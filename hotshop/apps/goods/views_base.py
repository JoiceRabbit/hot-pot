

from django.views.generic.base import View   # django的baseview 最底层的view

from goods.models import Goods



class GoodsListView(View):
    def get(self, request):
        """
        通过django的view实现商品列表页
        """
        json_list = []  # 把字段转换成json返回给前端。序列化

        goods = Goods.objects.all()[:10]  # 拿到数据。避免加载过慢
        print(goods)
        exit()
        # 法一
        # for good in goods:
        #     json_dict = {}
        #     json_dict["name"] = good.name
        #     json_dict["category"] = good.category.name
        #     json_dict["market_price"] = good.market_price
        #     json_dict["add_time"] = good.add_time
        #     json_list.append(json_dict)
        # 法二
        # from django.forms.models import model_to_dict
        # for good in goods:
        #     json_dict = model_to_dict(good)
        #     json_list.append(json_dict)
        # 法三
        import json
        from django.core import serializers
        json_data = serializers.serialize('json', goods)
        json_data = json.loads(json_data)

        from django.http import HttpResponse, JsonResponse
        return JsonResponse(json_data, safe=False)


























