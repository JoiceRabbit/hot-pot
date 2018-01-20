#!/usr/bin/env python
# encoding: utf-8

"""
@version: 1.0
"""
import xadmin
from .models import Goods, Store, GoodsCategory, Store_detail,\
    Banner, HotSearchWords,Discount,SpecialIndex
# from .models import IndexAd

class GoodsAdmin(object):
    list_display = ["title", "category", "sold_num", "fav","fav_num", "goods_num",
                    "shop_price", "desc", "isDiscount","discount","is_new", "is_hot", "add_time"]
    search_fields = ['title',]
    list_editable = ["is_hot", ]
    list_filter = ["title", "category","sold_num", "fav","fav_num", "goods_num",
                   "shop_price", "is_new", "is_hot","isDiscount","discount","add_time", "store__name"]
    # class GoodsImagesInline(object):
    #     model = GoodsImage
    #     exclude = ["add_time"]
    #     extra = 1
    #     style = 'tab'
    #
    # inlines = [GoodsImagesInline]


class StoreAdmin(object):
    list_display = ["name", "logo", "phone", "infomation","startAmount","trans","openingHours","notice",
                    "orders","favComments","address","praise"]
    style_fields = {"pics": "ueditor"}
    # def get_context(self):
    #     context = super(StoreAdmin, self).get_context()
    #     if 'form' in context:
    #         context['form'].fields['category'].queryset = GoodsCategory.objects.filter(category_type=1)
    #     return context


class GoodsCategoryAdmin(object):
    list_display = ["name", "code", "desc"]

class BannerAdmin(object):
    list_display = ["store", "imgUrl", "index"]

class Store_detailAdmin(object):
    list_display = ["store", "imgUrl", "index"]

class SpecialIndexAdmin(object):
    list_display = ["title", "imgUrl", "index"]

class HotSearchAdmin(object):
    list_display = ["hotSearch", "index", "add_time"]

class DiscountAdmin(object):
    list_display = ["cate", "desc", "show","add_time"]


# class IndexAdAdmin(object):
#     list_display = ["category", "goods"]


xadmin.site.register(Goods, GoodsAdmin)
xadmin.site.register(Store, StoreAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(SpecialIndex, SpecialIndexAdmin)

xadmin.site.register(Store_detail, Store_detailAdmin)

xadmin.site.register(Discount, DiscountAdmin)

xadmin.site.register(GoodsCategory, GoodsCategoryAdmin)

xadmin.site.register(HotSearchWords, HotSearchAdmin)
# xadmin.site.register(IndexAd, IndexAdAdmin)

