import requests
import json
# from . import coordTransform_utils

s = requests.session()

'''
# 获取用户ip地址
def get_client_ip(request):
    try:
      real_ip = request.META['HTTP_X_FORWARDED_FOR']
      regip = real_ip.split(",")[0]
    except:
      try:
        regip = request.META['REMOTE_ADDR']
      except:
        regip = ""
    return regip

'''

# myAk = "Z9kIREngyUvW70arafFRFUENbWpUWz6S"
# youAk = "F454f8a5efe5e577997931cc01de3974"
url = "http://api.map.baidu.com/highacciploc/v1?ak=Z9kIREngyUvW70arafFRFUENbWpUWz6S&qcip=124.193.207.194&coord=bd09ll&extensions=3"
# url = "'http://api.map.baidu.com/location/v1?qcip=192.168.68.1&qterm=pc&ak=F454f8a5efe5e577997931cc01de3974&coord=gcj02&extensions=3' "

# 高德地图
# url = 'http://restapi.amap.com/v3/ip?key=a0da5acbab199e8ba0a8068241be77e2&ip=192.168.68.1'
header = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36'
}
response = s.get(url, headers=header, timeout=30)
print(response.text)

json = json.loads(response.text)

'''
print('省份：'+str(json['content']['address_detail']['province']))
print('城市：'+str(json['content']['address_detail']['city']))
print('简要地址信息：'+str(json['content']['address']))
print('维度：'+str(json['content']['point']['y']))   #当前城市中心点纬度
print('经度：'+str(json['content']['point']['x']))    #当前城市中心点经度
# print('准确度：'+str(json['content']['confidence']))
'''


# print('位置：'+str(json['content']['formatted_address']))
# print('商圈：'+str(json['content']['business']))
# print('经度：'+str(json['content']['location']['lat']))
# print('维度：'+str(json['content']['location']['lng']))
# print('准确度：'+str(json['content']['confidence']))