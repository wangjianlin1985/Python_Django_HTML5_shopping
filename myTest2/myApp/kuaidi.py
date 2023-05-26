# -*- coding: utf-8 -*-

import urllib.request
import urllib.parse
import http.cookiejar
import json
import random
import time

#获取快递公司
def get_comCode(postid):
    url_xhr="http://www.kuaidi100.com/autonumber/autoComNum?"
    req = urllib.request.Request(url_xhr)

    #Http头部
    ori_headers = {
        'Host': 'www.kuaidi100.com',
        'Proxy-Connection': 'keep-alive',
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'X-Requested-With': 'XMLHttpRequest',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',
        'DNT': '1',
        'Referer': 'http://www.kuaidi100.com/',
        'Accept-Language': 'zh-CN,zh;q=0.8,,en-US;q=0.6,en;q=0.4',
        'Origin': 'http://www.kuaidi100.com',
        'Content-Length': '203'
    }
    #url后面的参数
    form_data = urllib.parse.urlencode({  #把字典形式转化成url后面的参数格式
        'text': postid,
    }).encode()   #编码成字节

    #把http头加入request
    for key,value in ori_headers.items():
        req.add_header(key,value)

    #处理cookie
    cj = http.cookiejar.CookieJar()  #声明cj用来存放cookie
    pro = urllib.request.HTTPCookieProcessor(cj) #利用HTTPCookieProcessor对象来创建cookie处理器
    opener = urllib.request.build_opener(pro)

    op = opener.open(req,form_data)  #调用open方法，发送请求和参数
    data_bytes = op.read()  #读取获得的数据

    data_str = bytes.decode(data_bytes)  #字节数据解码

    ori_content = json.loads(data_str)  #把json数据转化成字典
    inner_content = ori_content['auto'][0]['comCode']  #取出auto列表的第一个字典中comCode对应的值，即快递公司

    time.sleep(1)

    return inner_content

def get_content(postid):

    url_xhr = "http://www.kuaidi100.com/query?"
    req = urllib.request.Request(url_xhr)  #请求对象

    #HTTP头
    ori_headers = {
        'Host' : 'www.kuaidi100.com',
        'Connection' : 'keep-alive',
        'Accept' : '*/*',
        'Origin' : 'http://www.newrank.cn',
        'X-Requested-With': 'XMLHttpRequest',
        'User-Agent' : 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',
        'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8',
        'DNT':'1',
        'Referer': 'http://www.kuaidi100.com/',
        'Accept-Language': 'zh-CN,zh;q=0.8',
    }
    #处理url后面的其他参数
    temp = str(random.random())
    type = get_comCode(postid)
    form_data = urllib.parse.urlencode({  #转成url后面的参数形式
        'type' : type,
        'postid' : postid,
        'id':'1',
        'valicode':'',
        'temp':temp,
    }).encode()    #编码成字节码

    #把http头放入request
    for kay, value in ori_headers.items():
        req.add_header(kay, value)

    #处理cookie
    cj = http.cookiejar.CookieJar()
    pro = urllib.request.HTTPCookieProcessor(cj)
    opener = urllib.request.build_opener(pro)

    op = opener.open(req, form_data)
    data_bytes = op.read()
    data_str = bytes.decode(data_bytes)

    ori_content = json.loads(data_str)  #解析成字典格式
    inner_content = ori_content['data']
    return inner_content,postid

def add_postid():
    id = input("请输入要查询的快递单号")
    if id != None:
        return id

def main():
    postid = add_postid()
    print('加载中... ...')
    time.sleep(5)
    print('即将查询的快递单号为'+postid)
    try:
        content, postid = get_content(postid)
        print('单号为'+postid+'的快递信息为')
        for x in content:
            print(x['time'] + x['context'])
        print('')
    except:
        print('快递单号错误')

if __name__ == '__main__':
    main()