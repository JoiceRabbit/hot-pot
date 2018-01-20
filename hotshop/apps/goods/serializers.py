from rest_framework import serializers


from goods.models import  Goods,Store,GoodsCategory,Store_detail,\
    Banner,HotSearchWords,Discount,SpecialIndex

'''
class GoodsSerializer(serializers.Serializer):
     # 把model里的字段拷贝过来，修改。eg：
     name = serializers.CharField(required=True, max_length=30)
     order_num = serializers.IntegerField(default=0)
'''
class FindsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Discount
        fields = ('id','cate','desc','show',)

class SpecialIndexSerializer(serializers.ModelSerializer):
    class Meta:
        model = SpecialIndex
        fields = ('id', 'imgUrl','title',)

class BannerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Banner
        fields = ('id', 'imgUrl',)

class Store_detailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Store_detail
        fields = ('id', 'imgUrl',)

class StoreSerializer(serializers.ModelSerializer):
    # discountList = serializers.PrimaryKeyRelatedField(many=True, queryset=Store.objects.all())
    discountList = FindsSerializer(many=True)
    class Meta:
        model = Store
        # fields = "__all__"
        fields = ('id', 'logo', 'name', 'favComments', 'orders','startAmount','trans',
                  'notice', 'pics', 'infomation', 'phone',
                  'address', 'openingHours',
                  'discountList',
                  )

class searchSerializer(serializers.ModelSerializer):
    discountList = FindsSerializer(many=True)
    class Meta:
        model = Store
        # fields = "__all__"
        fields = ('id', 'logo', 'name', 'favComments', 'orders','startAmount','trans',
                  'praise', 'discountList',
                  )

class IndexSerializer(serializers.ModelSerializer):
    discountList = FindsSerializer(many=True)

    class Meta:
        model = Store
        fields = (

                  'id', 'logo', 'name', 'favComments', 'orders',
                  'startAmount','trans','praise',
                  'discountList',
                  )
        # extra_kwargs = {'password': {'write_only': True}}

class GoodsCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsCategory
        # fields = "__all__"
        fields = ('id','name','desc')

class GoodsSerializer(serializers.ModelSerializer):
     # store = StoreSerializer(many=True)   # 不加  many=True  会报错
     # gcat = GoodsCategorySerializer(many=True)
     class Meta:
          model = Goods
          fields = ('id','img', 'title', 'desc', 'sold_num','fav','shop_price','discount','isDiscount')
          # fields = "__all__"


class HotWordsSerializer(serializers.ModelSerializer):
    class Meta:
        model = HotSearchWords

        fields = ('hotSearch',)




