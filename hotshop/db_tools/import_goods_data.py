# 独立使用
'''
'''
'''
import sys
import os


pwd = os.path.dirname(os.path.realpath(__file__))
sys.path.append(pwd+"../")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "hotshop.settings")

import django
django.setup()

from goods.models import Goods, Store

from db_tools.data.product_data import row_data

for goods_detail in row_data:
    goods = Goods()
    goods.name = goods_detail["name"]

    goods.shop_price = float(int(goods_detail["sale_price"].replace("￥", "").replace("元", "")))
    goods.goods_brief = goods_detail["desc"] if goods_detail["desc"] is not None else ""
    goods.goods_desc = goods_detail["goods_desc"] if goods_detail["goods_desc"] is not None else ""
    goods.goods_front_image = goods_detail["images"][0] if goods_detail["images"] else ""

    store_name = goods_detail["categorys"][-1]
    category = Store.objects.filter(name=store_name)
    if category:
        goods.category = category[0]
    goods.save()

'''

