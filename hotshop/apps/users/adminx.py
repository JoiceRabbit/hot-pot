#!/usr/bin/env python
# encoding: utf-8

"""
@version: 1.0
"""
import xadmin
from xadmin import views
from .models import VerifyCode,UserProfile


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSettings(object):
    site_title = "后台管理"
    site_footer = "后台管理"
    # menu_style = "accordion"


class VerifyCodeAdmin(object):
    list_display = ['verCode','tel', "add_time"]



xadmin.site.register(VerifyCode, VerifyCodeAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)