"""Brainenergy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from teacher import views
# from teacher.upload import upload_image

urlpatterns = [
    url(r'^home/', views.home),#老师首页
    url(r'^teacset/', views.teacset),#老师信息设置
    url(r'^search/', views.search),#搜索页面
    url(r'^newtab/', views.newtab),#新增学生
    url(r'^upload/', views.upload_img, name='upload_image'),#学生上传头像接口
    url(r'^student/', views.student),#学生基本信息页面
    url(r'^exam/', views.exam),#测评页面
    url(r'^save/', views.save),#测评报告初始化页面
    url(r'^reportdetail/', views.reportdetail),#测评报告详细化页面
    url(r'^collect/', views.collect),#信息采集页面
    url(r'^scalelist/', views.scalelist),#量表列表页面
    url(r'^reg/', views.do_reg, name='reg'),#注册
    url(r'^login', views.do_login, name='login'),#登陆
    url(r'^logout$', views.do_logout, name='logout'),#注销
    url(r'^getcode/', views.getcode, name='getcode'),#获取验证码
    url(r'^m_active/', views.m_active, name='m_active'),#激活
    url(r'^mpass/', views.change_pwd, name='mpass'),#修改密码
    url(r'^searchstu/', views.searchstu, name='searchstu'),#修改密码
]
