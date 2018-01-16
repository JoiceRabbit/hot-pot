#!/usr/bin/env python
# encoding: utf-8

"""
@version: 1.0
"""
import xadmin
from .models import UserFav, UserLeavingMessage, UserAddress


class UserFavAdmin(object):
    list_display = ['user', 'stores', "add_time"]


class UserLeavingMessageAdmin(object):
    list_display = ['user', 'praise', "content", "time","is_Anonym"]


class UserAddressAdmin(object):
    list_display = ["signer_name", "signer_mobile", "district", "detail_addr"]


xadmin.site.register(UserFav, UserFavAdmin)
xadmin.site.register(UserAddress, UserAddressAdmin)
xadmin.site.register(UserLeavingMessage, UserLeavingMessageAdmin)