# from django.shortcuts import render
# # Create your views here.
#

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import mixins
from rest_framework import generics
from rest_framework import filters
from rest_framework.pagination import PageNumberPagination
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.throttling import UserRateThrottle

from rest_framework_extensions.cache.mixins import CacheResponseMixin

from .models import Goods, Store, HotSearchWords, Banner,GoodsCategory,SpecialIndex,Store_detail
from trade.models import OrderInfo
# from .filters import GoodsFilter
from .serializers import GoodsSerializer,IndexSerializer,SpecialIndexSerializer,\
    StoreSerializer,Store_detailSerializer, \
    HotWordsSerializer, BannerSerializer,GoodsCategorySerializer,searchSerializer
from trade.serializers import OrderGoodsSerialzier
from rest_framework import status

class GoodsListView(APIView):  # APIView继承了view，里面有验证等。

    def get(self, request, format=None):
        goods = Goods.objects.all()[:10]  # 取到商品

        goods_serializer = GoodsSerializer(goods,
                                           many=True)  # 序列化，针对json   新建一个serializer.py  因为是一个列表，所以一定要many=True，就能序列化一个数组对象
        return Response(goods_serializer.data)

class IndexListView(APIView):  # APIView继承了view，里面有验证等。
    """
      首页
    """
    def get(self, request, format=None):
        stores = Store.objects.all()[:10]  # 取到商家

        stores_serializer = IndexSerializer(stores,
                                           many=True)  # 序列化，针对json   新建一个serializer.py  因为是一个列表，所以一定要many=True，就能序列化一个数组对象
        banner = Banner.objects.all()
        sliders = BannerSerializer(banner,many=True)
        special = SpecialIndex.objects.all()
        specials = SpecialIndexSerializer(special,many=True)

        if sliders.data and specials.data and store_detail(stores_serializer):
            data = {'position':'北京市','sliders':sliders.data,'special':specials.data,'shopList':store_detail(stores_serializer)}
            dict= {'ret':True,'errMsg':'','data':data}
        else:
            dict= {'ret':False,'errMsg':'信息错误'}
        return Response(dict,status=status.HTTP_401_UNAUTHORIZED)





class StoreListView(APIView):  # APIView继承了view，里面有验证等。
    """
    商家页面
    """
    def get(self, request, *args, **kwargs):

        queryset = Store.objects.all() # 取到商家
        shopId = self.request.query_params.get("shopId")
        stores = queryset.filter(id=shopId)

        stores_serializer = StoreSerializer(stores,
                                           many=True)  # 序列化，针对json   新建一个serializer.py  因为是一个列表，所以一定要many=True，就能序列化一个数组对象
        # return Response(stores_serializer.data)
        # 下单页面  商品
        gcat = GoodsCategory.objects.all()
        gcata = GoodsCategorySerializer(gcat,many=True)

        # order_serializer = OrderSerializer()
        shopInfo={}
        if stores_serializer.data:
            for i in stores_serializer.data:
                discount = i['discountList']
                if len(discount)>=3:
                    disc = True
                else:
                    disc = False
                discount = {'hasMore': disc, 'discountList': i['discountList']}

                # 分类
                order = {}
                orderList = []
                for j in gcata.data:
                    if j['name']=="优惠":
                        isDiscount = True
                    else:
                        isDiscount = False
                    # 分类下的商品
                    goods = Goods.objects.filter(category=j["id"],store=i["id"])  # 取到商品
                    goods_serializer = GoodsSerializer(goods,
                                                       many=True)


                    if goods_serializer.data:
                        gsList = []
                        for gs in goods_serializer.data:
                            # # 是否打折
                            # if gs['isDiscount']==True:
                            #      price_now = gs['shop_price'] * 0.1* gs['discount']
                            # else:
                            #     price_now = gs['shop_price']
                            gsl = {'id':gs['id'],'img':gs['img'],'title':gs['title'],'desc':gs['desc'],
                                           'sold_num':gs['sold_num'],'fav':gs['fav'],'price':gs['shop_price'],
                                            # 'discount':gs['isDiscount'],'oldPrice':gs['shop_price']
                                           }
                            gsList.append(gsl)
                        order = {'id':j['id'],'name':j['name'],
                                      'isDiscount':isDiscount,
                                      'desc':j['desc'],
                                      'list':gsList}
                        orderList.append(order)
                # order={gcat.data}

                # 商家实景图片
                pic = Store_detail.objects.filter(store = i['id'])
                pics = Store_detailSerializer(pic, many=True)

                intro = {'pics':pics.data,'infomation':i['infomation'],
                         'phone':i['phone'],'address':i['address'],
                         'openingHours':i['openingHours']}
                shopInfo = {'shopId':i['id'],'logo':i['logo'],'name':i['name'],
                           'favComments':i['favComments'],'orders':i['orders'],
                           'startAmount':i['startAmount'],'trans':i['trans'],
                           'sendTime':48,'distance':1.56,'notice':i['notice'],
                            'intro':intro,'discount':discount,'order':orderList}
            dict_info = {'shopInfo':shopInfo}
            dict= {'ret':True,'errMsg':'','data':dict_info}
        else:
            dict = {'ret': False, 'errMsg': '没有该店家'}
        return Response(dict,status=status.HTTP_401_UNAUTHORIZED)
''''''


# class SearchViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
class SearchViewset(viewsets.GenericViewSet):
    """
    搜索(商家、商品名称)
    """
    queryset = Store.objects.all()
    serializer_class = searchSerializer

    filter_backends = (DjangoFilterBackend, filters.SearchFilter)
    search_fields = ('name','good__title',)


    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        store_serializer = self.get_serializer(queryset, many=True)

        if store_detail(store_serializer):
            data = {'shopList':store_detail(store_serializer)}
            dict = {'ret': True, 'errMsg': '', 'data': data}
        else:
            dict = {'ret': False, 'errMsg': '没有该信息'}
        return Response(dict)

def store_detail(store_serializer):
    shopList = []
    for i in store_serializer.data:
        discount = i['discountList']
        if len(discount) >= 3:
            discount = {'hasMore': True, 'discountList': i['discountList']}
        else:
            discount = {'hasMore': False, 'discountList': i['discountList']}

        shop = {'shopId': i['id'], 'logo': i['logo'], 'name': i['name'],
                'favComments': i['favComments'], 'orders': i['orders'],
                'startAmount': i['startAmount'], 'trans': i['trans'],
                'praise': i['praise'],
                'sendTime': 48, 'distance': 1.56, 'discount': discount}
        shopList.append(shop)
    return shopList

class HotSearchsViewset(APIView):  # APIView继承了view，里面有验证等。
   """
   获取热搜词列表
   """
   def get(self, request, *args, **kwargs):
       hsw = HotSearchWords.objects.all() # 取到商家
       hots_serializer = HotWordsSerializer(hsw,
                                          many=True)  # 序列化，针对json   新建一个serializer.py  因为是一个列表，所以一定要many=True，就能序列化一个数组对象
       hlist = []
       for i in hots_serializer.data:
           hlist.append(i['hotSearch'])
       print(hlist)
       dict_info = {'hotSearch':hlist}
       dict= {'ret':True,'errMsg':'','data':dict_info}
       return Response(dict)


class BannerViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
   """
   获取轮播图列表
   """
   queryset = Banner.objects.all().order_by("index")
   serializer_class = BannerSerializer

class SpecialIndexViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
   """
   获取首页商品广告列表
   """
   queryset = SpecialIndex.objects.all().order_by("index")
   serializer_class = SpecialIndexSerializer

















# ----------------------------------------------
#
# # 七牛云
# # 安装 pip install qiniu
#
# from qiniu import Auth, put_file, etag, urlsafe_base64_encode
# import qiniu.config
#
# # 需要填写你的 Access Key 和 Secret Key
# access_key = 'BMjlwbyyMQQngPSN5Vlkawm1UMCTOuz2sRz4o7tz'
# secret_key = '-VtV6bCelG_jVCxzpPawhgTLe7Z5-uRogtSvxw-r'
#
# # 初始化  对接   Access Key 和 Secret Key。
# # 构建鉴权对象
# q = Auth(access_key,secret_key)
#
# #要上传的空间
# bucket_name = 'tchg'
#
# #上传到七牛后保存的文件名
# key = 'my-python-logo.png'
#
# #生成上传 Token，可以指定过期时间等
# #3600为token过期时间，秒为单位。3600等于一小时
# token = q.upload_token(bucket_name, key, 3600)
#
# #要上传文件的本地路径
# localfile = './sync/bbb.jpg'
#
# ret, info = put_file(token, key, localfile)
# print(info)
# assert ret['key'] == key
# assert ret['hash'] == etag(localfile)




