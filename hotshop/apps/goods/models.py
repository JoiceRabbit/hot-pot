from django.db import models

# Create your models here.
from datetime import datetime

from DjangoUeditor.models import UEditorField


class Store(models.Model):
    '''
    商家
    '''
    name = models.CharField(default="", max_length=30, verbose_name="商家名", help_text="商家名")
    infomation = models.TextField(default="", max_length=200, verbose_name="商家简单描述", help_text="商家描述")
    logo = models.ImageField(max_length=200, upload_to="stores/")

    phone = models.CharField(max_length=11, verbose_name="商家电话")
    openingHours= models.CharField(default="09:00-22:50",max_length=100, verbose_name="营业时间")
    notice = models.TextField(default="欢迎光临", max_length=200, verbose_name="商家公告信息")
    pics = UEditorField(verbose_name=u"商家实景图片", imagePath="stores/images/", width=1000, height=300,
                              filePath="goods/files/", default='', null=True, blank=True)

    startAmount = models.IntegerField(default=15, verbose_name="起送价")
    trans = models.IntegerField(default=5, verbose_name="配送费")
    orders = models.IntegerField(default=0, verbose_name="月订单量")
    favComments = models.FloatField(default="", max_length=30, verbose_name="好评率")
    address = models.CharField(max_length=100, default="", verbose_name="商家地址")
    praise = models.BooleanField(default=False, verbose_name="口碑")

    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "商家"
        verbose_name_plural = verbose_name
        # db_table = "goods_goodsbrand"

    def __str__(self):
        return self.name


class GoodsCategory(models.Model):
    """
    商品类别
    """

    name = models.CharField(default="", max_length=30, verbose_name="类别名", help_text="类别名")
    code = models.CharField(default="", max_length=30, verbose_name="类别code", help_text="类别code")
    desc = models.TextField(default="", verbose_name="类别描述", help_text="类别描述")
    is_tab = models.BooleanField(default=False, verbose_name="是否导航", help_text="是否导航")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "商品类别"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

class Goods(models.Model):
    """
    商品
    """
    store = models.ManyToManyField(Store, verbose_name="商家",related_name="good")
    category = models.ForeignKey(GoodsCategory, verbose_name="商品类别",related_name="gcat")
    title = models.CharField(max_length=100, verbose_name="商品名")
    sold_num = models.IntegerField(default=0, verbose_name="商品销售量")
    fav = models.FloatField(default="", max_length=30, verbose_name="好评率")
    fav_num = models.IntegerField(default=0, verbose_name="收藏数")
    goods_num = models.IntegerField(default=0, verbose_name="库存数")
    shop_price = models.FloatField(default=0, verbose_name="本店价格")
    desc = models.TextField(default="",null=True, blank=True, max_length=500, verbose_name="商品简短描述")

    img = models.ImageField(upload_to="goods/images/", null=True, blank=True, verbose_name="封面图")

    isDiscount = models.BooleanField(default=False, verbose_name="是否折扣")
    discount = models.IntegerField(default=10, verbose_name="打几折")

    is_new = models.BooleanField(default=False, verbose_name="是否新品")
    is_hot = models.BooleanField(default=False, verbose_name="是否热销")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

class Discount(models.Model):
    """
    促销信息
    """
    store = models.ForeignKey(Store,verbose_name="商家",related_name="discountList")
    cate = models.CharField(default="", max_length=20, verbose_name="促销类别")
    desc = models.CharField(default="", max_length=20, verbose_name="促销详情")
    show = models.BooleanField(default=True, verbose_name="是否展示")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '促销信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.cate

class Store_detail(models.Model):
    """
    商家实景图片
    """
    store = models.ForeignKey(Store, verbose_name="商家",related_name="store_detail")
    # goods = models.ForeignKey(Goods, verbose_name="商品")
    imgUrl = models.ImageField(upload_to='banner', verbose_name="图片")
    index = models.IntegerField(default=0, verbose_name="顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '商家实景图片'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.store.name

class Banner(models.Model):
    """
    首页轮播的商品（因为轮播的图片和商品图片不一样大）
    """
    store = models.ForeignKey(Store, verbose_name="商家",related_name="sliders")
    # goods = models.ForeignKey(Goods, verbose_name="商品")
    imgUrl = models.ImageField(upload_to='banner', verbose_name="轮播图片")
    index = models.IntegerField(default=0, verbose_name="轮播顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '轮播商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.store.name

class SpecialIndex(models.Model):
    """
    首页的四张广告图
    """
    title =  models.CharField(max_length=100, verbose_name="主题")
    imgUrl = models.ImageField(upload_to='banner', verbose_name="广告图片")
    index = models.IntegerField(default=0, verbose_name="广告顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '广告图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

class HotSearchWords(models.Model):
    """
    热搜词
    """
    hotSearch = models.CharField(default="", max_length=20, verbose_name="热搜词")
    index = models.IntegerField(default=0, verbose_name="排序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = '热搜词'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.hotSearch

