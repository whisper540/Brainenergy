#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Dkal

from django.shortcuts import render,HttpResponse,redirect
from teacher import models as teacherM
import json
from django.conf import settings
import requests
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.hashers import make_password
from teacher.forms import *
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger
from teacher.upload import upload_image

# Create your views here.
# 登录检测
def check_login(func):
    def inner(request,*args,**kwargs):
        if hasattr(request.user,'utype'):
            ret = func(request,*args,**kwargs)
            return ret
        else:
            return redirect('/teacher/login')
    return inner

# #登陆角色检测
def check_utype(func):
    def inner(request,*args,**kwargs):
        if request.user.utype == 1:
            ret = func(request,*args,**kwargs)
            return ret
        else:
            return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return inner


#管理员登陆首页
@check_login
@check_utype
def home(request):
    keyword = request.GET.get('keyword')
    list_len = 0
    if keyword :
        keyword = request.GET['keyword']
        stulists = teacherM.User.objects.filter(adduid=request.user.id).filter(Q(realname__icontains=keyword) | Q(username__icontains=keyword)).all().order_by("-modifytime")
        list_len=len(stulists)
        print(666)
    else:
        stulists = teacherM.User.objects.filter(adduid=request.user.id).all().order_by("-modifytime")
        list_len = len(stulists)
        keyword=''
    paginator = Paginator(stulists, 10)
    try:
        page = int(request.GET.get('page', 1))
        stulists = paginator.page(page)
    except (EmptyPage, InvalidPage, PageNotAnInteger):
        stulists = paginator.page(1)  # 出错默认显示第一页
    return render(request,'manager/manager.html',locals())

#搜索老师
def search(request):
    try:
        if request.method == 'POST':
            keyword = request.POST['keyword']
            if keyword != '':
                stulists = teacherM.User.objects.filter(Q(adduid=request.user.id) & Q(realname__icontains=keyword ) | Q(id__icontains=keyword)).all().values('id','username','realname','sex','age','mobile')
                stulists = json.dumps(list(stulists))
            else:
                stulists = teacherM.User.objects.filter(adduid=request.user.id).all().values('id','username','realname','sex','age','mobile')
                stulists = json.dumps(list(stulists))
            return HttpResponse(stulists)
        else:
            return HttpResponse('error')
    except Exception as e:
        print(e)

# 头像上传接口
def upload_img(request):
    if request.method == 'POST':
        dir_name = 'avatar'
        uid = request.POST['userid']
        upload_image(request, dir_name, uid)
        return HttpResponse(200)
    else:
        pass

#新建档案接口
def newtab(request):
    try:
        if request.method == 'POST':
            username=request.POST['username']
            realname = request.POST['realname']
            password = make_password("123456")#初始化密码
            age = request.POST['age']
            grade = request.POST['grade']
            sex = request.POST['sex']
            utype = request.POST['utype']
            adduid = request.POST['adduid']
            mobile = request.POST['mobile']
            if teacherM.User.objects.filter(username=username).exists():
                return HttpResponse(901)
            elif teacherM.User.objects.filter(mobile=mobile).exists():
                return HttpResponse(900)
            else:
                teacherM.User.objects.create(username=username,password=password,age=age,grade=grade,sex=sex,utype=utype,adduid=adduid,mobile=mobile,realname=realname)
                return HttpResponse(200)
        else:
            return HttpResponse('error')
    except Exception as e:
        print(e)
    return redirect('/manager/home')


#信息采集
@check_login
@check_utype
def collect(request):
    try:
        if request.method == 'POST':
            # print(request.POST)
            id = request.POST['id']
            username = request.POST['username']
            realname = request.POST['realname']
            # password = make_password(request.POST['password'])
            age = request.POST['age']
            grade = request.POST['grade']
            sex = request.POST['sex']
            # guardian = request.POST['guardian']
            # relationship = request.POST['relationship']
            mobile = request.POST['mobile']
            if teacherM.User.objects.filter(username=username).exclude(id=id).exists():
                return HttpResponse(901)
            else:
                teacherM.User.objects.filter(id=id).update(username=username,age=age,grade=grade,sex=sex,mobile=mobile,realname=realname)
                teac = teacherM.User.objects.get(id=id)
                teac.save()
                return HttpResponse(200)
        else:
            uid = request.GET['uid']
            userdetail = teacherM.User.objects.filter(id=uid).all().values('id','username','realname','age','avatar','grade','sex','mobile','adduid','guardian','relationship')[0]
            print(userdetail)
    except Exception as e:
        print(e)
    return render(request,'manager/collect.html',locals())

#重置密码
def resetpwd(request):
    try:
        if request.method == "POST":
            uid = request.POST['uid']
            password = make_password("123456")  # 初始化密码
            teacherM.User.objects.filter(id=uid).update(password=password)
            return HttpResponse(200)
        else:
            return HttpResponse(13)#初始化密码产生错误
    except Exception as e:
        print(e)

def sendmsg(request):
    # 短信接口的URL
    SEND_URL = 'http://send.18sms.com/msg/HttpBatchSendSM'
    # 产品服务账号用户中心 - 账户管理 - 产品服务 找到对应的账号与密码
    account = '*****'
    # 产品服务密码
    pswd = '*****'
    mobile='15295565440'
    msg = '您好，您的注册验证码是：123456，请在15分钟内完成输入。如非本人操作，请忽略！【六六脑】'
    reponse = requests.post(SEND_URL, data={'account': account,'pswd':pswd,'mobile':mobile,'msg':msg,'needstatus':True,'product':''})
    reponse.encoding = 'utf-8'
    print(reponse.text)
    return HttpResponse(reponse.text)

