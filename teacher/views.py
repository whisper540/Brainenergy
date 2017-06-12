#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author:Dkal

from django.shortcuts import render,HttpResponse,redirect
from teacher import models as teacherM
import json,random,time,datetime
from django.conf import settings
import requests
from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.hashers import make_password
from teacher.forms import *
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger
from sympy import integrate, erf, exp, sin, log, oo, pi, sinh,sqrt,E, symbols
from teacher.upload import upload_image
from django.db.models import *
from teacher.MsgException import MsgException #信息发送异常

# Create your views here.

# 登录检测
def check_login2(func):
    def inner(request,*args,**kwargs):
        if hasattr(request.user,'utype'):
            ret = func(request,*args,**kwargs)
            return ret
        else:
            return redirect('/teacher/login')
    return inner

# #登陆角色检测
def check_utype2(func):
    def inner(request,*args,**kwargs):
        if request.user.utype == 2:
            ret = func(request,*args,**kwargs)
            return ret
        else:
            return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return inner

#检测部分页面如果没有uid不可以进行访问
def chekc_uid(func):
    def inner(request, *args, **kwargs):
        print(request.GET['uid'])
        if hasattr(request.GET,'uid'):
            ret = func(request, *args, **kwargs)
            return ret
        else:
            return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return inner

#老师页面初始化
@check_login2
@check_utype2
def home(request):
    # try:
    keyword = request.GET.get('keyword')
    list_len = 0
    if keyword :
        keyword = request.GET['keyword']
        stulists = teacherM.User.objects.filter(adduid=request.user.id).filter(Q(realname__icontains=keyword) | Q(username__icontains=keyword)).all().order_by("-modifytime")
        list_len=len(stulists)
    else:
        stulists = teacherM.User.objects.filter(adduid=request.user.id).all().order_by("-modifytime")
        list_len = len(stulists)
        keyword=''
    paginator = Paginator(stulists,10)
    try:
        page = int(request.GET.get('page',1))
        stulists = paginator.page(page)
    except (EmptyPage,InvalidPage,PageNotAnInteger):
        stulists = paginator.page(1)#出错默认显示第一页
    # except Exception as e:
    #     print(e)
    return render(request,'teacher/teacher.html',locals())

#老师设置信息页面
@check_login2
@check_utype2
def teacset(request):
    try:
        if request.method == 'POST':
            id = request.POST['id']
            username = request.POST['username']
            # password = make_password(request.POST['password'])
            realname = request.POST['realname']
            age = request.POST['age']
            grade = request.POST['grade']#老师学历
            sex = request.POST['sex']
            mobile = request.POST['mobile']
            # if request.POST['password'] == True :
            #     if teacherM.User.objects.filter(username=username).exclude(id=id).exists():
            #         return HttpResponse(901)
            #     else:
            if teacherM.User.objects.filter(username=username).exclude(id=id).exists():
                return HttpResponse(901)
            # elif teacherM.User.objects.filter(mobile=mobile).exclude(id=id).exists():
            #     return HttpResponse(900)
            else:
                teacherM.User.objects.filter(id=id).update(username=username, age=age,grade=grade,sex=sex, mobile=mobile, realname=realname)
            # elif request.POST['password'] == False :
            #     teacherM.User.objects.filter(id=id).update(username=username,age=age, grade=grade,sex=sex, mobile=mobile, realname=realname)

                return HttpResponse(200)
        else:
            teacherdetail = teacherM.User.objects.get(id=request.user.id)
            print(type(teacherdetail))
            return render(request, 'teacher/teacset.html', locals())
    except Exception as e:
        return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
        # logger.error(e)
    return render(request, 'teacher/teacset.html', locals())

# 头像上传接口
def upload_img(request):
    try:
        if request.method == 'POST':
            dir_name = 'avatar'
            uid = request.POST['userid']
            upload_image(request, dir_name, uid)
            return HttpResponse(200)
        else:
            pass
    except Exception as e:
        print(e)

#老师初始页面搜索学生
def searchstu(request):
    keyword = request.GET['keyword']
    stulists = teacherM.User.objects.filter(
        Q(adduid=request.user.id) & Q(realname__icontains=keyword) | Q(id__icontains=keyword)).all()
    paginator = Paginator(stulists, 5)
    try:
        page = int(request.GET.get('page', 1))
        stulists = paginator.page(page)
    except (EmptyPage, InvalidPage, PageNotAnInteger):
        stulists = paginator.page(1)  # 出错默认显示第一页
    return render(request, 'teacher/searchstu.html', locals())

#量表页搜索学生
def search(request):
    try:
        if request.method == 'POST':
            keyword = request.POST['keyword']
            if keyword != '':
                stulists = teacherM.User.objects.filter(Q(adduid=request.user.id) & Q(realname__icontains=keyword ) | Q(id__icontains=keyword)).all().values('id','username','realname','sex','age')
                stulists = json.dumps(list(stulists))
            else:
                stulists = teacherM.User.objects.filter(adduid=request.user.id).all().values('id','username','realname','sex','age')

                print(stulists)
                stulists = json.dumps(list(stulists))
            return HttpResponse(stulists)
        else:
            return HttpResponse('error')
    except Exception as e:
        print(e)

#新建档案接口
def newtab(request):
    try:
        if request.method == 'POST':
            username=str(time.time())
            realname=request.POST['realname']
            age = request.POST['age']
            grade = request.POST['grade']
            sex = request.POST['sex']
            utype = request.POST['utype']
            adduid = request.POST['adduid']
            mobile = request.POST['mobile']
            if teacherM.User.objects.filter(username=username).exists():
                return HttpResponse(901)
            else:
                teacherM.User.objects.create(username=username,age=age,grade=grade,sex=sex,utype=utype,adduid=adduid,mobile=mobile,realname=realname)
                return HttpResponse(200)
        else:
            return HttpResponse('error')
    except Exception as e:
        print(e)
    return redirect('/teacher/home')

#学生页面基础信息
@check_login2
@check_utype2
def student(request):
    try:
        if request.method == 'POST':
            id = request.POST['id']
            realname = request.POST['realname']
            age = request.POST['age']
            grade = request.POST['grade']
            sex = request.POST['sex']
            mobile = request.POST['mobile']
            # if teacherM.User.objects.filter(username=username).exists():
            #     return HttpResponse(901)
            # else:
            teacherM.User.objects.filter(id=id).update(realname=realname,age=age,grade=grade,sex=sex,mobile=mobile)
            teac = teacherM.User.objects.get(id=id)
            teac.save()
            return HttpResponse(200)
        else:
            uid = request.GET['uid']
            userdetail = teacherM.User.objects.filter(id=uid).all().values('id','username','realname','age','grade','sex','mobile','adduid','avatar')[0]
            print(userdetail)
    except Exception as e:
        print(e)
        # return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return render(request,'student/student.html',locals())

#信息采集
@check_login2
@check_utype2
def collect(request):
    try:
        if request.method == 'POST':
            # print(request.POST)
            id = request.POST['id']
            # username = request.POST['username']
            realname = request.POST['realname']
            age = request.POST['age']
            grade = request.POST['grade']
            sex = request.POST['sex']
            guardian = request.POST['guardian']
            relationship = request.POST['relationship']
            mobile = request.POST['mobile']
            # if teacherM.User.objects.filter(username=username).exists():
            #     return HttpResponse(901)
            # else:
            teacherM.User.objects.filter(id=id).update(realname=realname,age=age,grade=grade,sex=sex,guardian=guardian,relationship=relationship,mobile=mobile)
            teac = teacherM.User.objects.get(id=id)
            teac.save()
            return HttpResponse(200)
        else:
            uid = request.GET['uid']
            userdetail = teacherM.User.objects.filter(id=uid).all().values('id','username','realname','age','grade','sex','mobile','adduid','guardian','relationship','avatar')[0]
            print(userdetail)
    except Exception as e:
        return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return render(request, 'student/collect.html', locals())

#量表列表
@check_login2
@check_utype2
def scalelist(request):
    try:
        # stype = '1'
        uid = request.GET['uid']  # 学生ID
        scalelists = teacherM.Scales.objects.all()
        stulists = teacherM.User.objects.filter(adduid=request.user.id).all()[:5]
    except Exception as e:
        return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return render(request, 'exam/scalelist.html', locals())

#测评开始页面
@check_login2
@check_utype2
def exam(request):
    try:
        # x, y = symbols('x,y')
        # values = integrate(sin(x), (x, 0, pi/2))
        # print(values)
        stype=request.GET['stype']
        sdatas = teacherM.Scales.objects.filter(id=stype).all()[0]
        print(sdatas.explain)
        uid = request.GET['uid']
        questions = teacherM.Questions.objects.filter(scales_id = stype).all().values()
        datas = []
        for question in list(questions):
            answers = list(teacherM.Answers.objects.filter(questions_id=question['id']).all().values())
            question['answer']=answers
            datas.append(question)
        # print(datas)
    except Exception as e:
        print(e)
    return render(request, 'exam/exam.html', locals())

#获取测评报告列表（历史记录）
def getreportlist(request,userid):
    try:
        reports = teacherM.Exhistory.objects.filter(uid=userid).all().order_by("-endtime")[:10]
        return reports
    except Exception as e:
        print(e)

#测评报告初始页面(先保存，然后展示最后一次的测评报告)
@check_login2
@check_utype2
def save(request):
    try:
        if request.method == 'POST':#这个是保存测评记录所走的流程
            form = request.POST['questions']
            userid = int(request.POST['userid'])
            stype = request.POST['stype']
            # 处理得分结果
            data_all = json.loads(form)#字符串转化成对象
            comscore = 0
            x, y = symbols('x,y')
            for his in data_all['history']:
                formula = 1 / sqrt(2 * pi) * (E**((-0.5*x**2)))
                varx = data_all['history'][his]['scoreX']
                vart = integrate(formula,(x,-oo,varx))
                data_all['history'][his]['scoreT'] = float(vart)*100
                comscore += data_all['history'][his]['scoreT']
            # print(data_all['history'])
            # print(len(data_all['history']))
            data_all['com'] = comscore/(len(data_all['history']))#综合得分
            # print(data_all)
            # End处理得分结果
            form = json.dumps(data_all)#重新格式化成字符串
            teacherM.Exhistory.objects.create(uid=userid,history=form,stype=stype)#保存测评结果
            reports = getreportlist(request,userid)
            # print(reports)
            return HttpResponse(200)
            # return render(request, 'exam/save_bak.html', locals())

        else:#这个是正常进入页面（不是POST方式）的显示内容
            userid = int(request.GET['uid'])
            reports = getreportlist(request, userid)#获取测评记录paginator = Paginator(stulists,5)
            if reports.exists():
                ishasreport = 1
                print(ishasreport)
                # 分页开始
                # paginator = Paginator(reports, 5)
                # try:
                #     page = int(request.GET.get('page',1))
                #     reports = paginator.page(page)
                # except (EmptyPage,InvalidPage,PageNotAnInteger):
                #     reports = paginator.page(1)#出错默认显示第一页
                # End分页
                userdetail = teacherM.User.objects.filter(id=userid).all().values('id', 'username','realname', 'age', 'grade', 'sex', 'mobile',
                                                                  'adduid', 'guardian', 'relationship', 'avatar')[0]
                qhistorys = teacherM.Exhistory.objects.filter(uid=userid).all()[:1].values()
                qhistory1 = list(qhistorys)
                questions = json.loads(qhistory1[0]['history'])
                endtime = qhistorys[0]['endtime']
                sdatas = teacherM.Scales.objects.filter(id=qhistorys[0]['stype']).all()[0]
                comscore = questions['com']
                pos = round((comscore/100)*20)#计算小人的位置int
                peoples = range(1,21)
                qdatas = questions['history']
                datas = []
                for question in qdatas:
                    datas.append(qdatas[question])
                print(questions['com'])
                return render(request, 'student/report.html', locals())
            else:
                ishasreport = False
                userdetail = teacherM.User.objects.filter(id=userid).all().values('id', 'username','realname', 'age', 'grade', 'sex', 'mobile',
                                                                     'adduid', 'guardian', 'relationship', 'avatar')[0]
                return render(request, 'student/report.html', locals())
    except Exception as e:
        print(e)
        return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
        # print(e)
    return render(request, 'student/report.html', locals())

#测评报告点击顶部标签展示页面(先保存，然后展示最后一次的测评报告)
@check_login2
@check_utype2
def reportdetail(request):
    try:
        uid = request.GET['uid']
        reportid = int(request.GET['rid'])
        reports = getreportlist(request, uid)  # 获取测评记录
        userdetail = \
        teacherM.User.objects.filter(id=uid).all().values('id', 'username','realname', 'age', 'grade', 'sex', 'mobile',
                                                             'adduid', 'guardian', 'relationship', 'avatar')[0]
        qhistorys = teacherM.Exhistory.objects.filter(uid=uid).filter(id=reportid).all()[:1].values()
        qhistory1 = list(qhistorys)
        questions = json.loads(qhistory1[0]['history'])
        endtime = qhistorys[0]['endtime']
        sdatas = teacherM.Scales.objects.filter(id=qhistorys[0]['stype']).all()[0]
        comscore = questions['com']
        pos = int((comscore / 100) * 20)  # 计算小人的位置
        peoples = range(1, 21)
        qdatas = questions['history']
        datas = []
        for question in qdatas:
            datas.append(qdatas[question])
        print(questions['com'])
    except Exception as e:
        return render(request, 'basic/failure.html', {'reason': '您无法访问本页面'})
    return render(request, 'student/reportdetail.html', locals())


# 注册
def do_reg(request):
    try:
        if request.method == 'POST':
            reg_form = RegForm(request.POST)
            if reg_form.is_valid():
                # 注册
                # print(make_password(reg_form.cleaned_data["password"]))
                user = User.objects.create(username=reg_form.cleaned_data["username"],
                                    email=reg_form.cleaned_data["email"],
                                    url=reg_form.cleaned_data["url"],
                                    password=make_password(reg_form.cleaned_data["password"]),
                                    utype = 1,)
                user.save()
                # 登录
                user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                login(request, user)
                # return redirect(request.POST.get('source_url'))
                # 检测用户类型：
                if request.user.utype == 2 and request.user.is_staff == 0:
                    return redirect('/teacher/home')
                elif request.user.utype == 2 and request.user.is_staff == 1:
                    return redirect('/teacher/m_active')
                elif request.user.utype ==1:
                    return redirect('/manager/home')
            else:
                return render(request, 'basic/failure.html', {'reason': reg_form.errors})
        else:
            reg_form = RegForm()
    except Exception as e:
        print(e)
        # logger.error(e)
    return render(request, 'basic/reg.html', locals())

# 登录
def do_login(request):
    try:
        showtag=False#默认不显示提示信息
        if request.method == 'POST':
            login_form = LoginForm(request.POST)
            if login_form.is_valid():
                # 登录
                username = login_form.cleaned_data["username"]
                password = login_form.cleaned_data["password"]
                user = authenticate(username=username, password=password)
                if user is not None:
                    user.backend = 'django.contrib.auth.backends.ModelBackend' # 指定默认的登录验证方式
                    login(request, user)
                else:
                    username = login_form.cleaned_data["username"]
                    password = login_form.cleaned_data["password"]
                    showtag = True  # 显示提示信息
                    return render(request, 'basic/login2.html', locals())
                    # return render(request, 'basic/failure.html', {'reason': '登录验证失败'})
                # return redirect(request.POST.get('source_url'))
                #检测用户类型：
                if request.user.utype == 2 and request.user.is_staff == 0:
                    return redirect('/teacher/home')
                elif request.user.utype == 2 and request.user.is_staff == 1:
                    return redirect('/teacher/m_active')
                elif request.user.utype ==1:
                    return redirect('/manager/home')
            else:
                # username = login_form.cleaned_data["username"]
                # password = login_form.cleaned_data["password"]
                # showtag = True#显示提示信息
                # return render(request, 'basic/login2.html', locals())
                return render(request, 'basic/failure.html', {'reason': login_form.errors})
        else:
            login_form = LoginForm()
    except Exception as e:
        print(e)
        # logger.error(e)
    return render(request, 'basic/login2.html', locals())

# 注销
def do_logout(request):
    try:
        logout(request)
    except Exception as e:
        print(e)
        # logger.error(e)
    # print(request.META)
    return redirect(request.META['HTTP_REFERER'])

#修改密码接口
def change_pwd(request):
    try:
        if request.method == 'POST':
            # 先登录
            username = request.POST["username"]
            oldpassword = request.POST["oldpassword"]
            user = authenticate(username=username, password=oldpassword)
            if user is not None and user.is_active:
                newpassword = request.POST["newpassword"]
                user.set_password(newpassword)
                user.save()
                return HttpResponse(200)
            else:
                return HttpResponse(13)
        else:
            return render(request, 'teacher/mpass.html', locals())
    except Exception as e:
        print(e)

#发送短息方法
def sendmsg(request,mobile,code):
    # 短信接口的URL
    SEND_URL = 'http://send.18sms.com/msg/HttpBatchSendSM'
    # 产品服务账号用户中心 - 账户管理 - 产品服务 找到对应的账号与密码
    account = '*****'
    # 产品服务密码
    pswd = '*****'
    # mobile='15295565440'
    mobile=mobile
    msg = "您好，您的注册验证码是：%s，请完成输入。如非本人操作，请忽略！【六六脑】" % (code)
    reponse = requests.post(SEND_URL, data={'account': account,'pswd':pswd,'mobile':mobile,'msg':msg,'needstatus':True,'product':''})
    reponse.encoding = 'utf-8'
    print(reponse.text)
    return HttpResponse(reponse.text)

#获取激活码
def getcode(request):
    try:
        mobile = request.POST['mobile']
        uid = request.POST['uid']
        li = []
        for i in range(6):
            r = random.randrange(0,5)
            if r ==2 or r == 4:
                num = random.randrange(0,10)
                li.append(str(num))
            else:
                temp = random.randrange(65,91)
                c = chr(temp)
                li.append(c)
        code = "".join(li)
        isext = teacherM.User.objects.filter(id=uid).filter(mobile=mobile).exists()
        if isext:
            msgcount = teacherM.Activehistory.objects.filter(uid=uid,mobile=mobile,active_date=datetime.date.fromtimestamp(time.time())).count()
            # print(msgcount)
            if msgcount >= 3:
                raise MsgException(540)#信息发送超过每日三次抛出异常
            teacherM.Activehistory.objects.create(uid=uid,mobile=mobile,code=code)
            sendmsg(request,mobile,code)
            # print(ret2)
            return HttpResponse(200)#信息发送成功
        else:
            return HttpResponse(133)#不存在此用户信息
    except MsgException as me:
        return HttpResponse(540)#信息发送超过每日三次抛出异常
    except Exception as e:
        return HttpResponse(13)#获取激活码错误


#激活页面
def m_active(request):
    try:
        if request.method == 'POST':
            uid = request.POST['uid']
            mobile = request.POST['mobile']
            code = request.POST['code']
            password = make_password(request.POST['password'])
            isext = teacherM.Activehistory.objects.filter(uid=uid).filter(mobile=mobile).filter(code=code).exists()
            if isext:
                maxcode = teacherM.Activehistory.objects.filter(uid=uid).filter(code=code).aggregate(Max('id'))
                repass = teacherM.User.objects.filter(id=uid).update(password=password,is_staff = 0)
                if repass:
                    do_logout(request)
                    return HttpResponse(200)
                    # return render(request, '/teacher/login', locals())
                else:
                    return HttpResponse(1313)
            else:
                return HttpResponse(113)
        else:
            return render(request, 'teacher/m_active.html', locals())
    except Exception as e:
        return HttpResponse(13456)#激活失败
    return render(request, 'teacher/m_active.html', locals())

#404错误
def page_error404(request):
    return HttpResponse('404')

#500错误
def page_error500(request):
    return HttpResponse('500')
