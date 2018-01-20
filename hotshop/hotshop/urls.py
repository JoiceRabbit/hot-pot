"""hotshop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
# from django.contrib import admin
import xadmin
from rest_framework.documentation import include_docs_urls
from rest_framework_jwt.views import obtain_jwt_token

from django.views.static import serve
from .settings import MEDIA_ROOT

from tool import views as tool_views
from finds.views import FindListView
from goods.views import GoodsListView,StoreListView,BannerViewset,\
    HotSearchsViewset,SearchViewset,IndexListView,SpecialIndexViewset
from trade.views import ShoppingCartViewset,OrderViewset,OrdersViewset
from users.views import SmsCodeViewset, UserViewset,UserDetViewset
from user_operation.views import LeavingMessageViewset,AddressViewset

from rest_framework.routers import DefaultRouter
router = DefaultRouter()  # 生成一个route对象
# 首页四张广告图url
router.register(r'api/special', SpecialIndexViewset, base_name="special")
# 轮播图url
router.register(r'api/banners', BannerViewset, base_name="banners")
# 搜索
router.register(r'api/search/search', SearchViewset, base_name="search")
# 热搜词
# router.register(r'api/search/hot', HotSearchsViewset, base_name="hotsearchs")
# 购物车
router.register(r'api/shoppingCart', ShoppingCartViewset, base_name="shoppingCart")
# 订单相关
router.register(r'api/orders', OrderViewset, base_name="order")

# 登录注册
router.register(r'api/user/getVerCode',SmsCodeViewset,base_name="user/getVerCode")
router.register(r'api/user/loginVerCode', UserViewset, base_name="user/loginVerCode")
router.register(r'api/mine/getUserInfo', UserDetViewset, base_name="mine/getUserInfo")

# 评价
router.register(r'api/shop/evaluate',LeavingMessageViewset,base_name="shop/evaluate")
router.register(r'api/address',AddressViewset,base_name="address")

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'docs/',include_docs_urls(title="tchg")),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    url(r'^', include(router.urls)),

    url(r'^tool/ip/$', tool_views.ip_api),

    # 首页展示
    url(r'api/index/$', IndexListView.as_view(), name="stores-list"),  # 一
    # 店家展示
    url(r'api/shop/index/$', StoreListView.as_view(), name="store"),  # 一
    # 发现页
    url(r'api/find/$', FindListView.as_view(), name="finds-list"),  # 一
    # 热搜词
    url(r'api/search/hot/$', HotSearchsViewset.as_view(), name="hot-list"),  # 一

    # 订单主页
    url(r'api/order/$', OrdersViewset.as_view(), name="order-list"),

    # jwt认证登录接口
    url(r'^user/loginPwd', obtain_jwt_token),
]
