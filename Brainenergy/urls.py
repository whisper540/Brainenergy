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
from django.conf import settings
from django.views.static import serve#必须此处这样写，处理静态文件

urlpatterns = [
    url(r'^$', views.do_login),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^login/', views.do_login),
    url(r'^teacher/', include('teacher.urls')),
    url(r'^manager/', include('manager.urls')),
    url(r"^uploads/(?P<path>.*)$", serve,{"document_root": settings.MEDIA_ROOT, }),#admin后台管理上传接口
    url(r"^static/(?P<path>.*)$", serve,{"document_root": settings.STATIC_ROOT, }),#静态文件地址
    # url(r'^logout$', views.do_logout, name='logout'),
    # url(r'^reg', views.do_reg, name='reg'),
    # url(r'^login', views.do_login, name='login'),
]
# handler404 = views.page_error404
# handler500 = views.page_error500