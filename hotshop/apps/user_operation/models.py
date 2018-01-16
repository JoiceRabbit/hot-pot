

from datetime import datetime
from django.conf import settings
from django.db import models
# from django.contrib.auth import get_user_model

from goods.models import Goods,Store
# Create your models here.
# User = settings.AUTH_USER_MODEL

# from users.models import UserProfile
# User = UserProfile()

class UserFav(models.Model):
    """
    用户收藏---店家
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name="用户")
    stores = models.ForeignKey(Store, verbose_name="商家", help_text="商家id")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = '用户收藏'
        verbose_name_plural = verbose_name
        # unique_together = ("user", "goods")

    def __str__(self):
        return self.user.name

class UserAddress(models.Model):
    """
    用户收货地址
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name="用户" )
    province = models.CharField(max_length=100, default="", verbose_name="省份")
    city = models.CharField(max_length=100, default="", verbose_name="城市")
    district = models.CharField(max_length=100, default="", verbose_name="区域")
    detail_addr = models.CharField(max_length=100, default="", verbose_name="详细地址")
    signer_name = models.CharField(max_length=100, default="", verbose_name="签收人")
    signer_sex = models.CharField(max_length=20,default="先生", verbose_name="签收人性别")
    signer_mobile = models.CharField(max_length=11, default="", verbose_name="电话")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "收货地址"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.detail_addr

class UserLeavingMessage(models.Model):
    """
    用户评价
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name="用户")
    store = models.ForeignKey(Store, verbose_name="商家")
    praise = models.IntegerField(default="", verbose_name="评分")
    content = models.TextField(default="", verbose_name="评价内容", help_text="评价内容")
    file = models.FileField(upload_to="message/images/", verbose_name="上传的文件", help_text="上传的文件")
    time = models.DateTimeField(default=datetime.now, verbose_name="评价时间")
    is_Anonym = models.BooleanField(default=False, verbose_name="是否匿名")

    class Meta:
        verbose_name = "用户评价"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.user.username








