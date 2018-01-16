
from datetime import datetime
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from rest_framework import mixins
from django.shortcuts import redirect

from goods.models import Store
from goods.serializers import StoreSerializer
from .serializers import ShopCartSerializer, ShopCartDetailSerializer,OrderGoodsSerialzier,OrderSerializer, \
    NeighborImgSerializer
from .models import ShoppingCart, OrderInfo, OrderGoods, NeighborImg
from utils.permissions import IsOwnerOrReadOnly

# Create your views here.
class ShoppingCartViewset(viewsets.ModelViewSet):
    """
    购物车功能
    list:
        获取购物车详情
    create：
        加入购物车
    delete：
        删除购物记录
    """
    # 用户权限：确保只有创建代码段的用户才能更新或删除它。
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)  # 删除时候IsOwnerOrReadOnly
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = ShopCartSerializer

    lookup_field = "goods_id"  #根据id查详情

    def perform_create(self, serializer):
        shop_cart = serializer.save()
        goods = shop_cart.goods
        goods.goods_num -= shop_cart.nums
        goods.save()

    def perform_destroy(self, instance):
        goods = instance.goods
        goods.goods_num += instance.nums
        goods.save()
        instance.delete()

    def perform_update(self, serializer):
        existed_record = ShoppingCart.objects.get(id=serializer.instance.id)
        existed_nums = existed_record.nums
        saved_record = serializer.save()
        nums = saved_record.nums - existed_nums
        goods = saved_record.goods
        goods.goods_num -= nums
        goods.save()

    # 详情
    def get_serializer_class(self):
        if self.action == 'list':
            return ShopCartDetailSerializer
        else:
            return ShopCartSerializer

    # queryset = ShoppingCart.object.all()
    # 只返回当前用户的列表
    def get_queryset(self):
        return ShoppingCart.objects.filter(user=self.request.user)


# 将购物车里所有的商品进行结算
# 因为订单不允许修改，所以，用mixin就行
class OrderViewset(mixins.ListModelMixin, mixins.RetrieveModelMixin, mixins.CreateModelMixin,
                           mixins.DestroyModelMixin,
                           viewsets.GenericViewSet):
    """
    订单管理
    list:
        获取个人订单
    delete:
        删除订单
    create：
        新增订单
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = OrderSerializer

    # 获取当前用户的订单
    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)


    # def get_serializer_class(self):
    #     if self.action == "retrieve":
    #         return OrderDetailSerializer
    #     return OrderSerializer


    def perform_create(self, serializer):
        order = serializer.save()
        # 获取购物车里的所有数据，并将购物车删除
        shop_carts = ShoppingCart.objects.filter(user=self.request.user)
        for shop_cart in shop_carts:
            order_goods = OrderGoods()
            order_goods.goods = shop_cart.goods
            order_goods.goods_num = shop_cart.nums
            order_goods.order = order
            order_goods.save()

            shop_cart.delete()
        return order




class OrdersViewset(APIView):  # APIView继承了view，里面有验证等。
   """
      订单页面
   """
   def get(self, request, *args, **kwargs):
       nei = NeighborImg.objects.all()  # 取到附近
       nei_serializer = NeighborImgSerializer(nei, many=True)


       queryset = OrderInfo.objects.all()  # 取到订单
       userId = self.request.query_params.get("uid")   # ?? 拿到uid，传uid
       users = queryset.filter(user=userId)

       orders_serializer = OrderSerializer(users,
                                           many=True)

       orderList=[]
       if orders_serializer.data:
           for ors in orders_serializer.data:
               # 'name':ors['store'], 'logo':ors['logo']
               # 下单到现在过去多久了  # now = datetime.now()    # times = now - ors['add_time']

               storeList = Store.objects.filter(id = ors['store'])
               # print(storeList)
               store_serializer = StoreSerializer(storeList,many=True)
               for store in store_serializer.data:
                    if ors['status']=='TRADE_FINISHED':
                        content = '再来一单'
                    else:
                        content = '查看详情'

                    orderl = {'id':ors['id'],'name':store['name'],'logo':store['logo'],
                              'time':ors['add_time'],'status':ors['status'],
                              'content':content,'total':ors['total']}
                    orderList.append(orderl)
           dict= {'ret':True,'errMsg':'','data':{'bought':nei_serializer.data,'orderList':orderList}}
       else:
           dict = {'ret': False, 'errMsg': '无订单信息'}
       return Response(dict)







