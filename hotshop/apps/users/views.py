from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.shortcuts import render

from django.contrib.auth import get_user_model
from rest_framework import viewsets, authentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework_jwt.serializers import jwt_payload_handler, jwt_encode_handler
from rest_framework import mixins
from .serializers import SmsSerializer,UserRegSerializer,UserDetailSerializer
from rest_framework.response import Response
from rest_framework import status
from utils.huyi import YunPian
from random import choice
from .models import VerifyCode
from rest_framework.mixins import CreateModelMixin
from rest_framework import permissions
User = get_user_model()

class CustomBackend(ModelBackend):
    """
    自定义用户验证(密码验证登录)
    """
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = User.objects.get(Q(name=username)|Q(tel=username))
            if (user.check_password(password)) and (user.hasPassword == True):
                return user
        except Exception as e:
            return None


class SmsCodeViewset(CreateModelMixin, viewsets.GenericViewSet):
    """
    发送短信验证码
    """
    serializer_class = SmsSerializer

    def generate_code(self):
        """
        生成6位数字的验证码
        :return:
        """
        seeds = "1234567890"
        random_str = []
        for i in range(6):
            random_str.append(choice(seeds))

        return "".join(random_str)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        tel = serializer.validated_data["tel"]

        yun_pian = YunPian()

        code = self.generate_code()
        text = "您的验证码是：%s。请不要把验证码泄露给其他人。"%(code,)
        sms_status = yun_pian.send_sms(text=text, mobile=tel)

        if sms_status["code"] != 2:
            return Response({
                "ret":False,
                "errMsg":tel,
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            code_record = VerifyCode(verCode=code, tel=tel)
            code_record.save()
            return Response({
                "ret":True,
                "errMsg":"",
                "data":{"tel":tel,
                "verCode":code,}

            }, status=status.HTTP_201_CREATED)


class UserViewset(CreateModelMixin,viewsets.GenericViewSet):
    '''
    用户(注验证码登录，注册)

    '''
    serializer_class = UserRegSerializer
    queryset = User.objects.all()
    # def loginVercode(self,request,*args, **kwargs):
    #     serializer = self.get_serializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #
    #     self.perform_create(serializer)
    #     if self.queryset:
    #         request.session['uid'] = request.user
    #         LoginData = {
    #             "ret": True, "errMsg": "", "data": {
    #                 "tel": serializer.data['tel'],
    #                 "login":True,
    #                 "uid": User.objects.filter(tel=serializer.data['tel'])[0].id,
    #         }}
    #         return Response(LoginData,status=status.HTTP_200_OK)

    # 随机生成用户名
    def generate_name(self):

        seeds = "1234567890abcdefghigklmnopqrstuvwxyz"
        random_str = []
        for i in range(6):
            random_str.append(choice(seeds))
        name = "".join(random_str)
        if User.objects.filter(name=name).count():
            self.generate_name()
        else:
            return name


    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data = request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        user = User.objects.filter(tel=serializer.data['tel'])[0]
        # if user and user.name:
        #     request.session['uid'] = request.user
        #     LoginData = {
        #                 "ret": True, "errMsg": "", "data": {
        #                     "tel": serializer.data['tel'],
        #                     "login":True,
        #                     "uid": User.objects.filter(tel=serializer.data['tel'])[0].id,
        #             }}
        #     return Response(LoginData,status=status.HTTP_200_OK)

        new_user = User.objects.filter(tel=serializer.data['tel'])[0]
        new_user.name = self.generate_name()
        new_user.set_password("000000")
        new_user.save()
        request.session["uid"] = new_user.id
        Jdata = {"ret":True,"errMsg":"","data":{
            "tel":serializer.data['tel'],
            "login":True,
            "username":new_user.name,
        }}
        return Response(Jdata,status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        return serializer.save()


class UserDetViewset(CreateModelMixin,mixins.UpdateModelMixin,mixins.RetrieveModelMixin,viewsets.GenericViewSet):
    '''
    用户详细信息
    '''
    # permission_classes = (permissions.IsAuthenticated,)
    authentication_classes = (JSONWebTokenAuthentication, authentication.SessionAuthentication)

    def get_serializer_class(self):
        if self.action == "retrieve":
            return UserDetailSerializer
        elif self.action == "create":
            return UserRegSerializer

        return UserDetailSerializer

    def get_permissions(self):
        if self.action == 'retrieve':
            return [permissions.IsAuthenticated()]
        elif self.action == 'create':
            return []
        return []

    def get_object(self):
        return self.request.user
