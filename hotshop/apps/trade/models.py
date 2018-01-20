
from datetime import datetime
from django.conf import settings

from django.db import models
# from django.contrib.auth import get_user_model

from goods.models import Goods,Store

# import django
#
# # 否则会抛出错误 django.core.exceptions.AppRegistryNotReady: Models aren't loaded yet.
# # if django.VERSION >= (1, 7):#自动判断版本
# django.setup()

# from users.models import UserProfile

# User = get_user_model()    # 就不用 from users.models import UserProfile
#get_user_model() 这个函数直接实现从配置的路径中找


# Create your models here.

class ShoppingCart(models.Model):
    """
    购物车
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name=u"用户")
    goods = models.ForeignKey(Goods, verbose_name=u"商品")
    nums = models.IntegerField(default=0, verbose_name="购买数量")

    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = '购物车'
        verbose_name_plural = verbose_name
        unique_together = ("user", "goods")  # 构成联合唯一索引

    def __str__(self):
        return "%s(%d)".format(self.goods.name, self.nums)

class OrderInfo(models.Model):
    """
    订单
    """
    ORDER_STATUS = (  ("TRADE_SUCCESS", "成功"),
        ("TRADE_CLOSED", "超时关闭"),    ("WAIT_BUYER_PAY", "交易创建"),
        ("TRADE_FINISHED", "订单已完成"),("paying", "待支付"),
    )
    user = models.ForeignKey(settings.AUTH_USER_MODEL, verbose_name="用户")
    store = models.ForeignKey(Store, verbose_name="商家")
    order_sn = models.CharField(max_length=30, null=True, blank=True, unique=True, verbose_name="订单号")
    # trade_no 支付宝支付，生成订单号与本系统订单形成关联。第三方。
    trade_no = models.CharField(max_length=100, unique=True, null=True, blank=True, verbose_name=u"交易号")
    # pay_status 订单支付状态。可以先给个默认值。用户可能支付一半就不支付了
    status = models.CharField(choices=ORDER_STATUS, default="paying", max_length=30, verbose_name="订单状态")
    post_script = models.CharField(max_length=200, verbose_name="订单留言")
    total = models.FloatField(default=0.0, verbose_name="订单金额")
    pay_time = models.DateTimeField(null=True, blank=True, verbose_name="支付时间")

    # 为什么不设置外键呢？因为客户如果在后台修改了地址，此处订单里的地址信息就会变化。
    # 所以，防止出问题。将填写的状态直接保存。
    address = models.CharField(max_length=100, default="", verbose_name="收货地址")
    signer_name = models.CharField(max_length=20, default="", verbose_name="签收人")
    singer_mobile = models.CharField(max_length=11, verbose_name="联系电话")

    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")


    class Meta:
        verbose_name = u"订单"
        verbose_name_plural = verbose_name


    def __str__(self):
        return str(self.order_sn)

class NeighborImg(models.Model):
    """
    附近买过
    """
    title =  models.CharField(max_length=100, verbose_name="主题")
    imgUrl = models.ImageField(upload_to='banner', verbose_name="图片")
    index = models.IntegerField(default=0, verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '推荐图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


class OrderGoods(models.Model):
    """
    订单的商品详情
    """
    # 因为一个订单里会有多个商品，所以，单独设置一个表，一对多
    order = models.ForeignKey(OrderInfo, verbose_name="订单信息", related_name="goods")
    goods = models.ForeignKey(Goods, verbose_name="商品")
    goods_num = models.IntegerField(default=0, verbose_name="商品数量")

    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "订单商品"
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.order.order_sn)




