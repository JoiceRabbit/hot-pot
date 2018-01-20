
import json
import requests
from django.shortcuts import render


def ipapi(ip):
    url = 'http://api.map.baidu.com/location/ip?ak=Z9kIREngyUvW70arafFRFUENbWpUWz6S&coor=bd09ll&ip=' + ip
    headers = {'User-Agent' :'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0'}
    r = requests.get(url, headers=headers, timeout=6)
    jsdic = json.loads(r.content)
    if jsdic.has_key('content'):
        city = jsdic['content']['address']
        pointx = jsdic['content']['point']['x']
        pointy = jsdic['content']['point']['y']
        return city, pointx, pointy

def getmap(x, y):
    im = 'http://api.map.baidu.com/staticimage/v2?ak=Z9kIREngyUvW70arafFRFUENbWpUWz6S&mcode=666666¢er=' + x + ',' + y + '&width=500&height=300&zoom=11'
    return im


def ip_api(request):
    # ip = request.GET['ipval']
    ip = request.GET.get('ipval', '')
    c, px, py = ipapi(ip)
    ima = getmap(px, py)
    return render(request, 'ip.html', {'city': c, 'px': px, 'py': py, 'ima': ima})


if __name__ == '__main__':
    ip_api()