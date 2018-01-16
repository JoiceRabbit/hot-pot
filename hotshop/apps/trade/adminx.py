# -*- coding: utf-8 -*-
__author__ = 'WJT'

import xadmin
from .models import ShoppingCart, OrderInfo, OrderGoods,NeighborImg

class ShoppingCartAdmin(object):
    list_display = ["user", "goods", "nums", ]
class NeighborImgAdmin(object):
    list_display = ["title", "imgUrl", "index"]

class OrderInfoAdmin(object):
    list_display = ["user","store", "order_sn",  "trade_no", "status", "post_script",
                    "total", "pay_time", "add_time"]

    class OrderGoodsInline(object):
        model = OrderGoods
        exclude = ['add_time', ]
        extra = 1
        style = 'tab'

    inlines = [OrderGoodsInline, ]




xadmin.site.register(ShoppingCart, ShoppingCartAdmin)
xadmin.site.register(OrderInfo, OrderInfoAdmin)
xadmin.site.register(NeighborImg,NeighborImgAdmin)
