# -*- coding: utf-8 -*-
import time
from rest_framework import serializers

from goods.models import Goods
from .models import ShoppingCart, OrderInfo, OrderGoods,NeighborImg
from goods.serializers import GoodsSerializer


class ShopCartDetailSerializer(serializers.ModelSerializer):
    goods = GoodsSerializer(many=False, read_only=True)
    class Meta:
        model = ShoppingCart
        fields = ("goods", "nums")

class ShopCartSerializer(serializers.Serializer):
    # 灵活性更高，所以不继承ModelSerializer

    # user的默认的
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    # nums做加操作，
    nums = serializers.IntegerField(required=True, label="数量",min_value=1,
                                    error_messages={
                                        "min_value":"商品数量不能小于一",
                                        "required": "请选择购买数量"
                                    })
    goods = serializers.PrimaryKeyRelatedField(required=True, queryset=Goods.objects.all())

    # 因为本身没有提供save功能，所以要重写create
    def create(self, validated_data):  # 上述nums等是已经处理过的，validated_data
        user = self.context["request"].user  # 获取当前用户  上下文
        nums = validated_data["nums"]
        goods = validated_data["goods"]  # 此时是goods对象，因为反序列化

        # 查询数据库，看数据是否存在
        existed = ShoppingCart.objects.filter(user=user, goods=goods)

        if existed:
            existed = existed[0]  # 获取第一条数据
            existed.nums += nums  # 更新
            existed.save()        # 保存
        else:
            existed = ShoppingCart.objects.create(**validated_data)

        return existed  # 因为结果是要反序列化，传给前端的。
    # 这是一个商品的增加

    def update(self, instance, validated_data):
        #修改商品数量
        instance.nums = validated_data["nums"]
        instance.save()
        return instance
    # 删除是不用重写delete方法的

class OrderGoodsSerialzier(serializers.ModelSerializer):
    goods = GoodsSerializer(many=False)
    class Meta:
        model = OrderGoods
        fields = "__all__"

class NeighborImgSerializer(serializers.ModelSerializer):
    class Meta:
        model = NeighborImg
        fields = ('id', 'imgUrl','title',)

class OrderDetailSerializer(serializers.ModelSerializer):
    goods = OrderGoodsSerialzier(many=True)
    class Meta:
        model = OrderInfo
        fields = "__all__"


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )

    status = serializers.CharField(read_only=True)
    trade_no = serializers.CharField(read_only=True)
    order_sn = serializers.CharField(read_only=True)
    pay_time = serializers.DateTimeField(read_only=True)  # 支付时间

    def generate_order_sn(self):
        # 当前时间+userid+随机数========保证字符串唯一
        from random import Random
        random_ins = Random()
                                                     #获取当前时间，格式化成字符串   生成两位数
        order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),
                                                       userid=self.context["request"].user.id, # 如果是封装好的，是self.request.user.id
                                                       ranstr=random_ins.randint(10, 99))
        return order_sn

    def validate(self, attrs):
        attrs["order_sn"] = self.generate_order_sn()
        return attrs

    class Meta:
        model = OrderInfo
        fields = "__all__"