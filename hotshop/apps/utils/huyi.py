import http.client
import random
import urllib.parse
import urllib
import json


class YunPian(object):

    def __init__(self):
        self.host = "106.ihuyi.com"
        self.sms_send_uri = "/webservice/sms.php?method=Submit"
        self.account = "C14710572"
        self.password = "24a53cc7752c1a8e67a77f71f6bec64e"

    def send_sms(self, text, mobile):
        params = urllib.parse.urlencode(  # 改2
            {'account': self.account, 'password': self.password, 'content': text, 'mobile': mobile, 'format': 'json'})
        headers = {"Content-type": "application/x-www-form-urlencoded", "Accept": "text/plain"}
        conn = http.client.HTTPConnection(self.host, port=80, timeout=30)  # 改3
        conn.request("POST", self.sms_send_uri, params, headers)
        response = conn.getresponse()
        response_str = response.read()
        re_dict = json.loads(response_str)
        conn.close()
        # newC = self.changeCode(re_dict)
        # print(newC)
        return re_dict

    # def changeCode(self,re_dict):
    #     # re_dict = dict(re_dict)
    #     newC ={}
    #     if not (re_dict['code'] == 2):
    #         newC['ret'] = False
    #     else:
    #         newC['ret'] = True
    #     newC['errMsg'] =re_dict['msg']
    #     return  newC



if __name__ == "__main__":
    yun_pian = YunPian()
    yun_pian.send_sms("", "")


