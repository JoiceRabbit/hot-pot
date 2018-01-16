from rest_framework import serializers

from finds.models import  Finds,ImgsFinds


class FindSerializer(serializers.ModelSerializer):
    class Meta:
        model = Finds

        fields = "__all__"


class ImgsFindsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImgsFinds
        fields = ('id', 'imgUrl',)