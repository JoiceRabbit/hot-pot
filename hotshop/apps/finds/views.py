from django.shortcuts import render

# Create your views here.
from .models import Finds,ImgsFinds
from .serializers import FindSerializer,ImgsFindsSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import mixins
from rest_framework import viewsets
from rest_framework import status

class FindListView(APIView):  # APIView继承了view，里面有验证等。
    """
    发现页
    """

    def get(self, request, format=None):
        finds = Finds.objects.all()[:10]  # 取到商品

        finds_serializer = FindSerializer(finds,
                                               many=True)  # 序列化，针对json   新建一个serializer.py  因为是一个列表，所以一定要many=True，就能序列化一个数组对象
        Imgs = ImgsFinds.objects.all() # 取到商家
        Imgs_serializer = ImgsFindsSerializer(Imgs,
                                           many=True)
        if finds_serializer.data and Imgs_serializer.data:
            dict = {'ret': True, 'errMsg': '', 'data': finds_serializer.data,'imgs':Imgs_serializer.data}
        else:
            dict = {'ret': False, 'errMsg': '页面无信息'}
        return Response(dict,status=status.HTTP_401_UNAUTHORIZED)


class ImgsFindsViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    获取首页商品广告列表
    """
    queryset = ImgsFinds.objects.all().order_by("index")
    serializer_class = ImgsFindsSerializer
