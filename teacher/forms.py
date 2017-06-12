# -*- coding:utf-8 -*-
from django import forms
from django.conf import settings
from django.db.models import Q
from teacher.models import User
import re

class LoginForm(forms.Form):
    '''
    登录Form
    '''
    username = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Username", "required": "required","class":"form-control"}),
                              max_length=50,error_messages={"required": "username不能为空",})
    password = forms.CharField(widget=forms.PasswordInput(attrs={"placeholder": "Password", "required": "required",}),
                              max_length=20,error_messages={"required": "password不能为空",})

class RegForm(forms.Form):
    '''
    注册表单
    '''
    username = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "Username", "required": "required","class":"form-control"}),
                              max_length=50,error_messages={"required": "username不能为空",})
    email = forms.EmailField(widget=forms.TextInput(attrs={"placeholder": "Email", "required": "required","class":"form-control"}),
                              max_length=50,error_messages={"required": "email不能为空",})
    url = forms.URLField(widget=forms.TextInput(attrs={"placeholder": "Url", "class":"form-control"}),
                              max_length=100, required=False)
    password = forms.CharField(widget=forms.PasswordInput(attrs={"placeholder": "Password", "required": "required","class":"form-control"}),
                              max_length=20,error_messages={"required": "password不能为空",})

# class RegStuForm(forms.Form):
#     '''
#     新建学生
#     '''
#     username = forms.CharField(widget=forms.TextInput(attrs={"placeholder": "姓名（请输入汉字）", "required": "required","class":"form-control"}),
#                               max_length=50,error_messages={"required": "姓名不合法",})
#     age = forms.IntegerField(widget=forms.IntegerField(attrs={"placeholder": "年龄（1-100）", "required": "required","class":"form-control"}),
#                               error_messages={"required": "年龄不合法", })
#     grade = forms.Select(widget=forms.Select(choices='c',attrs={"class":"form-control"}),
#                               required=False)


