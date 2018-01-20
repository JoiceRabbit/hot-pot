# 独立使用djnago的model
''''''

'''
import sys
import os


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))
sys.path.insert(0, os.path.join(BASE_DIR, 'extra_apps'))



pwd = os.path.dirname(os.path.realpath(__file__))
print('pwd:',pwd)
sys.path.append(pwd+"../")
# print("123")
# sys.path.append("../"+pwd)
# print("sys_path环境：",sys.path)
# print("sys路径：",sys.path.append(pwd+"../"))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "hotshop.settings")
# print("os路径：",os.environ.setdefault("DJANGO_SETTINGS_MODULE", "MxShop.MxShop.settings"))
print("123")
import django
django.setup()

from goods.models import Store

from db_tools.data.category_data import row_data

for lev1_cat in row_data:
    lev1_intance = Store()
    lev1_intance.code = lev1_cat["code"]
    lev1_intance.name = lev1_cat["name"]
    lev1_intance.category_type = 1
    lev1_intance.save()


'''


