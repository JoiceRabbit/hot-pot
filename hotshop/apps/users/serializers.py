import re

from datetime import datetime,timedelta
from rest_framework import serializers

from django.contrib.auth import get_user_model
from rest_framework.validators import UniqueValidator

from .models import VerifyCode
from hotshop.settings import REGEX_MOBILE

User = get_user_model()

class SmsSerializer(serializers.Serializer):
    tel = serializers.CharField(max_length=11)

    def validate_tel(self, tel):
        """
        验证手机号码
        :param data:
        :return:
        """

        # 手机是否注册
        # if User.objects.filter(tel=tel).count():
        #     raise serializers.ValidationError("用户已经存在")

        # 验证手机号码是否合法
        if not re.match(REGEX_MOBILE, tel):
            raise serializers.ValidationError("手机号码非法")

        # 验证码发送频率
        one_mintes_ago = datetime.now() - timedelta(hours=0, minutes=1, seconds=0)
        if VerifyCode.objects.filter(add_time__gt=one_mintes_ago, tel=tel).count():
            raise serializers.ValidationError("距离上一次发送未超过60s")

        return tel

class UserRegSerializer(serializers.ModelSerializer):
    tel = serializers.CharField(required=True,max_length=11)
    verCode = serializers.CharField(required=True,write_only=True,max_length=6,min_length=6,label="验证码",
                                    error_messages={
                                        "blank": "请输入验证码",
                                        "required": "请输入验证码",
                                        "max_length": "验证码格式错误",
                                        "min_length": "验证码格式错误"
                                    },
                                    help_text="验证码")

    # name = serializers.CharField(label="用户名", help_text="用户名", required=True, allow_blank=False,
    #                                  validators=[UniqueValidator(queryset=User.objects.all(), message="用户已经存在")])



    def validate_verCode(self, verCode):
        verify_records = VerifyCode.objects.filter(tel=self.initial_data["tel"]).order_by("-add_time")
        if verify_records:
            last_record = verify_records[0]

            five_mintes_ago = datetime.now() - timedelta(hours=0, minutes=10, seconds=0)
            if five_mintes_ago > last_record.add_time:
                raise serializers.ValidationError("验证码过期")
            if last_record.verCode != verCode:
                raise serializers.ValidationError("验证码错误")
        else:
            raise serializers.ValidationError("验证码错误")

    def validate(self, attrs):
        del attrs["verCode"]
        return attrs

    class Meta:
        model = User
        fields = ("id","tel","verCode")

class UserDetailSerializer(serializers.ModelSerializer):
    '''
    用户详情序类化类
    '''
    class Meta:
        model = User
        fields = ('name',"tel","headImg","redBag","gold")










