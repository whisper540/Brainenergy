#-*- coding:utf-8 -*-

from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
#量表
class Scales(models.Model):
    name = models.CharField(max_length=20,default='x',verbose_name="量表名",unique=True,null=False)
    stype = models.CharField(max_length=10,default='x',verbose_name="量表类型",unique=True,null=False)
    explain = models.CharField(max_length=40,default='x',verbose_name="量表说明",null=False)


    class Meta:
        verbose_name="量表"
        verbose_name_plural=verbose_name
        ordering=['id']

    def __str__(self):
        return "量表"

#能力
class Ability(models.Model):
    name = models.CharField(max_length=20,default='x',verbose_name="能力名称",null=True)

#问题
class Questions(models.Model):
    title = models.CharField(max_length=40,default='x',verbose_name="问题题目")
    img_src = models.CharField(max_length=40,default='x',blank=True,verbose_name="图片地址")
    scales = models.ForeignKey(Scales,verbose_name="所属量表",null=False)
    sid = models.IntegerField(default=0,verbose_name="该选项题目ID")
    type = models.IntegerField(default=0,verbose_name="题目类型",null=True)
    act_explain=models.CharField(max_length=40,default='x',verbose_name="操作说明")
    right_answer = models.CharField(max_length=40,default='x',verbose_name="正确答案")
    m = models.FloatField(default=0,verbose_name="m值")
    sd = models.FloatField(default=0,verbose_name="sd值")
    ability_id = models.IntegerField(default=0,verbose_name="能力类型")
    range_score=models.IntegerField(default=0,verbose_name='最高分数阈值')
    min_score=models.IntegerField(default=0,verbose_name='最低分数阈值')

    class Meta:
        verbose_name="问题"
        verbose_name_plural=verbose_name
        ordering=['id']

    def __str__(self):
        return "问题"

#答案
class Answers(models.Model):
    qid = models.IntegerField(verbose_name="该选项题目ID")
    content = models.CharField(max_length=40,default='x',verbose_name="答案内容")
    ans_score = models.IntegerField(verbose_name="该选项分数")
    questions = models.ForeignKey(Questions,verbose_name="所属问题",null=False)
    sid = models.IntegerField(default=0,verbose_name="量表类型")
    ans_img = models.CharField(max_length=40,default='x',blank=True,verbose_name="图片地址")

    class Meta:
        verbose_name="答案"
        verbose_name_plural=verbose_name
        ordering=['id']

    def __str__(self):
        return self.qid

#答题记录
class Exhistory(models.Model):
    uid = models.IntegerField(default='x',verbose_name="用户id")
    history = models.CharField(max_length=2000,default='x',verbose_name="测评记录str")
    endtime = models.DateTimeField(verbose_name="提交时间",auto_now=True)
    stype = models.IntegerField(default=0,verbose_name="量表类型")

class User(AbstractUser):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='/uploads/avatar/default.png', max_length=200, blank=True,null=True, verbose_name='用户头像')
    qq = models.CharField(max_length=20, blank=True, null=True, verbose_name='QQ号码')
    mobile = models.CharField(max_length=11, blank=True, null=True, verbose_name='手机号码')
    url = models.URLField(max_length=100, blank=True, null=True, verbose_name='个人网页地址')
    adduid = models.IntegerField(default=0,verbose_name="添加者id号")
    address = models.CharField(max_length=40, blank=True, null=True, verbose_name="家庭地址")
    organization = models.CharField(max_length=40, blank=True, null=True, verbose_name="机构")
    sex = models.IntegerField(default=0,verbose_name="性别")
    age = models.IntegerField(default=0,verbose_name="年龄")
    utype = models.IntegerField(default=0,verbose_name="人员类型")
    grade = models.IntegerField(default=0,verbose_name="年级")
    guardian = models.CharField(default='无',max_length=40, blank=True, null=True, verbose_name="监护人")
    relationship = models.CharField(default='无',max_length=40, blank=True, null=True, verbose_name="与监护人关系")
    realname = models.CharField(max_length=20,blank=True,null=True,verbose_name="真实姓名")
    modifytime = models.DateTimeField(verbose_name="修改时间",auto_now=True)

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = verbose_name
        ordering = ['-id']

    def __str__(self):
        return self.username
class Student(models.Model):
    avatar = models.ImageField(upload_to='avatar/%Y/%m', default='/uploads/avatar/default.png', max_length=200,blank=True, null=True, verbose_name='用户头像')
    qq = models.CharField(max_length=20, blank=True, null=True, verbose_name='QQ号码')
    mobile = models.CharField(max_length=11, blank=True, null=True, verbose_name='手机号码')
    url = models.URLField(max_length=100, blank=True, null=True, verbose_name='个人网页地址')
    adduid = models.IntegerField(default=0, verbose_name="添加者id号")
    address = models.CharField(max_length=40, blank=True, null=True, verbose_name="家庭地址")
    organization = models.CharField(max_length=40, blank=True, null=True, verbose_name="机构")
    sex = models.IntegerField(default=0, verbose_name="性别")
    age = models.IntegerField(default=0, verbose_name="年龄")
    utype = models.IntegerField(default=0, verbose_name="人员类型")
    grade = models.IntegerField(default=0, verbose_name="年级")
    guardian = models.CharField(max_length=40, blank=True, null=True, verbose_name="监护人")
    relationship = models.CharField(max_length=40, blank=True, null=True, verbose_name="与监护人关系")
    realname = models.CharField(max_length=20, blank=True, null=True, verbose_name="真实姓名")

    class Meta:
        verbose_name = "学生"
        verbose_name_plural = verbose_name
        ordering = ['-id']

    def __str__(self):
        return self.realname

class Activehistory(models.Model):
    uid = models.IntegerField(default=0, verbose_name="用户id")
    mobile = models.CharField(max_length=11, blank=True, null=True,  verbose_name='手机号码')
    code = models.CharField(max_length=6, blank=True, null=True,  verbose_name='激活码')
    last_active = models.DateTimeField(verbose_name="最后获取激活码的时间",auto_now=True)
    active_date = models.DateField(verbose_name="最后获取激活码的当天日期",auto_now=True)


