import re

from rest_framework import serializers

from hotshop.settings import REGEX_MOBILE
from .models import UserLeavingMessage,UserAddress
from users.models import UserProfile
from goods.models import Store

# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = UserProfile
#         fields = ("name","headImg")
#
# class StoreSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Store
#         fields = "__all__"

class LeavingMessageSerializer(serializers.ModelSerializer):
    # user = serializers.HiddenField(
    #     default=serializers.CurrentUserDefault()
    # )
    time = serializers.DateTimeField(read_only=True,format="%Y-%m-%d")
    user = serializers.PrimaryKeyRelatedField(required=True, queryset=UserProfile.objects.all())
    store = serializers.PrimaryKeyRelatedField(required=True, queryset=Store.objects.all())
    # store = serializers.SerializerMethodField()
    # user = serializers.SerializerMethodField()
    class Meta:
        model = UserLeavingMessage
        fields = ("user","store","praise","content","file","time","is_Anonym")


class AddressSerializer(serializers.ModelSerializer):
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    add_time = serializers.DateTimeField(read_only=True,format="%Y-%m-%d")

    signer_mobile = serializers.CharField(required=True, max_length=11, min_length=11,
                                    error_messages={
                                        "blank": "请输入手机号",
                                        "required": "请输入手机号",
                                        "max_length": "手机格式错误",
                                        "min_length": "手机号格式错误"
                                    },
                                    help_text="收货人电话")
    detail_addr = serializers.CharField(required=True,allow_blank=False,
                                        error_messages={"blank": "请输入详细地址",
                                        "required": "请输入详细地址",},help_text="详细地址")
    signer_name = serializers.CharField(required=True,allow_blank=False,
                                        error_messages={"blank": "请输入收货人",
                                        "required": "请输入收货人",},help_text="收货人")

    class Meta:
        model = UserAddress
        fields = ("id","user","province","city","district","detail_addr",
                  "signer_name","signer_sex","signer_mobile","add_time")






















