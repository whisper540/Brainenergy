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
from manager import views
# from teacher.upload import upload_image

urlpatterns = [
    url(r'^home/', views.home),
    url(r'^search/', views.search),  # 搜索页面
    url(r'^newtab/', views.newtab),  # 新增老师
    url(r'^upload/', views.upload_img, name='upload_image'),  # 老师上传头像接口
    # url(r'^upload/(?P<dir_name>[^/]+)$', views.upload_img, name='upload_image'),  # 学生上传头像接口
    # url(r'^student/', views.student),  # 学生基本信息页面
    url(r'^collect/', views.collect),  # 信息采集页面
    url(r'^sendmsg/', views.sendmsg),  # 发送短信接口
    url(r'^resetpwd/', views.resetpwd),  # 发送短信接口
]

