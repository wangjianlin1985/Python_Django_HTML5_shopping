# -*- coding: UTF-8 -*-
import pymysql

#连接数据库MySQL
# 正常返回conn=200
#数据库连接失败conn=400
#请求参数 401
def connectdb(db):
    try:
        conn = pymysql.connect(host='localhost',user='root',passwd='123456',db=db,charset='utf-8')  #连接数据库
    except Exception as e:
        conn = 400
    return conn

#请求mysql获取数据
def get_data(db,sql):
    conn = connectdb(db)
    if conn == 400:
        return conn
    else:
        try:
            cur = conn.cursor()  #获取操作游标
            cur.execute(sql)   #执行sql语句
            data = cur.fetchall()  #接受全部的返回结果行（多维元祖），存入rows里面
            cur.close()
            conn.commit()#提交事务，不然不能真正地插入数据
            conn.close()
            return data
        except Exception as e:
            return 401