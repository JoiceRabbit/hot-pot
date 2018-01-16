#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import requests
import pymysql
import sys

def get_mdb_conn(my_host, my_user, my_password, my_port, my_db):
    dbconn = None
    ok_flag = True
    msg_sb = ''
    try:
        dbconn = pymysql.connect(
                host=my_host,
                user=my_user,
                passwd=my_password,
                port=my_port,
                db=my_db,
                charset="utf8")
    except Exception as err:
        ok_flag = False
        msg_sb = 'get_mdb_conn connect error:{0}'.format(err)
    return dbconn, ok_flag, msg_sb


class Goods:
    def __init__(self):
        self.store = ''
        self.category = ''
        self.title = ''
        self.sold_num = 0
        self.fav = ''
        self.fav_num = 0
        self.goods_num = 0
        self.shop_price = ''
        self.desc = ''
        self.img = ''
        self.isDiscount = ''
        self.discount = ''
        self.is_new = False
        self.is_hot = False

def con_url(filepath):
    url_list = []
    with open(filepath, 'r', encoding='utf-8') as fp:
        for line in fp.readlines():
            url = 'https://www.ele.me/restapi/shopping/v1/foods?food_ids%5B%5D={0}'.format(line)
            url_list.append(url)
    return url_list


def get_url(url):
    headers = {
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36'
    }
    result = ''
    res = ''
    try:
        res = requests.get(url, headers=headers)
    except:
        pass
    try:
        result = res.json()[0]
    except:
        pass
    return result

def analyze(result):
    goods = Goods()
    try:
        goods.title = result['name']
        goods.goods_num = result['specfoods'][0]['stock']
        goods.shop_price = result['specfoods'][0]['price']
        goods.desc = result['description']
        goods.img = result['image_path']
        goods.isDiscount = result['activity']
    except:
        pass
    return goods


if __name__ == "__main__":

    tz_host = '127.0.0.1'
    tz_port = 3306
    tz_user = 'root'
    tz_password = 'root'
    tz_db = 'wanb'
    mdb, ok, m_msg = get_mdb_conn(tz_host, tz_user, tz_password, tz_port, tz_db)
    if not ok:
        print('invalid mysql {0}'.format(m_msg))
        sys.exit(-1)
    m_cursor = mdb.cursor()

    filepath = 'eleme_goods_list.txt'
    url_list = con_url(filepath)
    with open('eleme_result.txt', 'w') as fp:
        for url in url_list:
            result = get_url(url)
            print(result)
            goods = analyze(result)
            fp.write("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\n".format(goods.title, goods.goods_num,
                      goods.shop_price, goods.desc, goods.img, goods.isDiscount))
            # sql ="""insert into goods(title,goods_num,shop_price,`desc`,img,isDiscount)
            #         values ({0},{1},{2},{3},{4},{5})""".format(goods.title, goods.goods_num,
            #           goods.shop_price, goods.desc, goods.img, goods.isDiscount)
            # m_cursor.execute(sql)
            # 这里我表建的不对，你要入库的话就按照这么方式去写就行，取消注释
    fp.close()
    # mdb.close()












