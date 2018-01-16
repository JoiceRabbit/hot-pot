from rest_framework.authentication import SessionAuthentication
from django.contrib.auth import get_user_model
from django.shortcuts import render
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

from utils.permissions import IsOwnerOrReadOnly
# Create your views here.
from rest_framework import mixins, viewsets
from rest_framework.permissions import IsAuthenticated

from .serializers import LeavingMessageSerializer,AddressSerializer
from .models import UserLeavingMessage,UserAddress

User = get_user_model()

class LeavingMessageViewset(mixins.ListModelMixin,mixins.DestroyModelMixin,
                            viewsets.GenericViewSet):
    '''
    list:
        获取用户留言
    create:
        添加留言
    delete:
        删除留言功能
    '''
    serializer_class = LeavingMessageSerializer

    def get_queryset(self):
        sid = self.request.query_params.get("shopId")

        return UserLeavingMessage.objects.filter(store=sid).order_by("-time")

# class StoreListView(APIView):  # APIView继承了view，里面有验证等。
#     """
#     商家页面
#     """
#     def get(self, request, *args, **kwargs):
#
#         queryset = Store.objects.all() # 取到商家
#         shopId = self.request.query_params.get("shopId")
#         stores = queryset.filter(id=shopId)
#
#         stores_serializer = StoreSerializer(stores,
#                                            many=True)  # 序列化，针对json   新建一个serializer.py
#
#   # 因为是一个列表，所以一定要many=True，就能序列化一个数组对象
#         # return Response(stores_serializer.data)
#
#         dict_info = {'shopInfo':stores_serializer.data}
#         dict= {'ret':True,'errMsg':'','data':dict_info}
#         return Response(dict)


class AddressViewset(viewsets.ModelViewSet):
    '''
    收货地址的增删改查

    '''
    permission_classes = (IsAuthenticated,IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication,SessionAuthentication)
    serializer_class = AddressSerializer

    def get_queryset(self):
        return UserAddress.objects.filter(user=self.request.user)


