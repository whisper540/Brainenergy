from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

# 用户模型.
# 第一种：采用的继承方式扩展用户信息（本系统采用）
# 扩展：关联的方式去扩展用户信息
class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='avatar/default.png', max_length=200, blank=True, null=True, verbose_name='用户头像')
    qq = models.CharField(max_length=20, blank=True, null=True, verbose_name='QQ号码')
    mobile = models.CharField(max_length=11, blank=True, null=True, unique=True, verbose_name='手机号码')
    url = models.URLField(max_length=100, blank=True, null=True, verbose_name='个人网页地址')
    adduid = models.IntegerField(default='x', verbose_name="添加者id号")
    address = models.CharField(max_length=40, blank=True, null=True, verbose_name="家庭地址")
    organization = models.CharField(max_length=40, blank=True, null=True, verbose_name="机构")

    class Meta:
        verbose_name = '用户'
        verbose_name_plural = verbose_name
        ordering = ['-id']

    def __str__(self):
        return self.username
