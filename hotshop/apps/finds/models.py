from django.db import models
from datetime import datetime
# Create your models here.


class Finds(models.Model):
    """
    发现页
    """

    imgUrl = models.ImageField(upload_to='find', verbose_name="发现图片")
    title = models.CharField(max_length=100, verbose_name="发现名")
    desc = models.TextField(max_length=500, verbose_name="发现描述")

    class Meta:
        verbose_name = '发现页'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class ImgsFinds(models.Model):
    """
    发现页活动图
    """
    title =  models.CharField(max_length=100, verbose_name="主题")
    imgUrl = models.ImageField(upload_to='banner', verbose_name="活动图片")
    index = models.IntegerField(default=0, verbose_name="活动顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '活动图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

