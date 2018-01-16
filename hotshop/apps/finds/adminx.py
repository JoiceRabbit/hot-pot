#!/usr/bin/env python
# encoding: utf-8

"""
@version: 1.0
"""
import xadmin
from .models import Finds,ImgsFinds



class FindsAdmin(object):
    list_display = ["title", "imgUrl", "desc"]

class ImgsFindsAdmin(object):
    list_display = ["title", "imgUrl", ]

xadmin.site.register(Finds, FindsAdmin)
xadmin.site.register(ImgsFinds, ImgsFindsAdmin)

