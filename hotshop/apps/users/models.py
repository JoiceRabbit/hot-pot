import os

from django.contrib.auth.base_user import BaseUserManager, AbstractBaseUser
from django.db import models

# Create your models here.
from django.contrib.auth.models import AbstractUser, PermissionsMixin
from datetime import datetime   #年龄不设字段，因为年龄是动态值，直接设出生日期，咱们可以算


# 自定义用户管理器
class UserManager(BaseUserManager):
    def _create_user(self, tel, name, password, **extra_fields):
        """
        Creates and saves a User with the given username, email and password.
        """
        if not name:
            raise ValueError('必须设置用户名')
        name = self.normalize_email(name)
        user = self.model(tel=tel,username=name, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, tel, name, password, **extra_fields):
        extra_fields.setdefault('is_staff', False)
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(tel,name, password, **extra_fields)

    def create_superuser(self, tel, name, password, **extra_fields):

        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        return self._create_user(tel, name, password, **extra_fields)


class UserProfile(AbstractBaseUser, PermissionsMixin):
    """
    用户
    """
    name = models.CharField(max_length=30, unique=True, verbose_name="username")
    USERNAME_FIELD = 'name'
    REQUIRED_FIELDS = ['tel']
    tel = models.CharField(max_length=11,verbose_name="电话")
    headImg = models.ImageField(upload_to='head/',
                                default=os.path.join('head', 'toxiang.jpg'),
                                verbose_name="头像")
    redBag = models.IntegerField(default=0, verbose_name="红包")
    gold = models.IntegerField(default=0, verbose_name="金币")
    hasPassword = models.BooleanField(default=False,verbose_name="密码是否设置了")
    # password = models.CharField(blank=True, null=True, max_length=128)
    is_staff = models.BooleanField('staff status', default=False)
    is_active = models.BooleanField('active', default=True)
    is_superuser = models.BooleanField(default=False)

    objects = UserManager()

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_short_name(self):
        return self.name

    def has_perm(self, perm, obj=None):
        return self.is_superuser

    def has_module_perms(self, app_label):
        return self.is_superuser



class VerifyCode(models.Model):
    """
    短信验证码
    """
    verCode = models.CharField(max_length=10, verbose_name="验证码")
    tel = models.CharField(max_length=11,verbose_name="电话")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "短信验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.verCode


"""
图片验证码
"""

