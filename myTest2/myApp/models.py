# -*- coding: UTF-8 -*-
from django.db import models
from django.contrib.auth.models import AbstractUser
from myApp import ConnMySql
import pymysql
import time
import random


# 用户
class User(AbstractUser):
    address = models.CharField(max_length=200, verbose_name='地址')
    phone = models.CharField(max_length=20, verbose_name='联系电话')

    class Meta:  # 定义元数据
        verbose_name = '用户'
        verbose_name_plural = verbose_name  # 设置后台模块
        ordering = ['-id']  # id降序排列

    def __str__(self):
        return self.username


# 广告
class Ad(models.Model):
    title = models.CharField(max_length=50, verbose_name='标题')
    image_url = models.ImageField(upload_to='ad/%Y/%m', verbose_name='图片路径')
    date_publish = models.DateTimeField(auto_now_add=True, verbose_name='发布时间')
    index = models.IntegerField(default=1, verbose_name='排列顺序')

    class Meta:
        verbose_name = '广告'
        verbose_name_plural = verbose_name
        ordering = ['index', 'id']

    def __str__(self):
        return self.title


# 分类
class Category(models.Model):
    typ = models.CharField(max_length=20, choices=(('客厅', '客厅'), ('卧室', '卧室'), ('餐厅/书房', '餐厅/书房'), ('成套', '成套')),
                          verbose_name='所属大类')
    name = models.CharField(max_length=30, verbose_name='分类名称')
    index = models.IntegerField(default=1, verbose_name='分类的排序')
    # 0代表中，1代表西
    west_east = models.IntegerField(default=0, choices=((0, '中式'), (1, '西式')), verbose_name='风格来源')

    class Meta:
        verbose_name = '分类'
        verbose_name_plural = verbose_name
        ordering = ['index', 'id']

    def __str__(self):
        #str = "中式" if self.west_east == 0 else "西式"
        return self.name + "---" + self.typ


# 品牌
class Brand(models.Model):
    name = models.CharField(max_length=30, verbose_name='品牌名称')
    index = models.IntegerField(default=1, verbose_name='排列顺序')

    class Meta:
        verbose_name = '品牌'
        verbose_name_plural = verbose_name
        ordering = ['index', ]

    def __str__(self):
        return self.name


# 尺寸
class Size(models.Model):
    name = models.CharField(max_length=20, verbose_name='尺寸')
    index = models.IntegerField(default=1, verbose_name='排列顺序')

    class Meta:
        verbose_name = '尺寸'
        verbose_name_plural = verbose_name
        ordering = ['index', ]

    def __str__(self):
        return self.name


# 标签
class Tag(models.Model):
    name = models.CharField(max_length=30, verbose_name='标签')

    class Meta:
        verbose_name = '标签'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 家具
class Furniture(models.Model):
    category = models.ForeignKey(Category, verbose_name='分类')
    name = models.CharField(max_length=30, verbose_name='名称')
    brand = models.ForeignKey(Brand, verbose_name='品牌')
    size = models.ManyToManyField(Size, verbose_name='尺寸')
    old_price = models.FloatField(default=0.0, verbose_name='原价')
    new_price = models.FloatField(default=0.0, verbose_name='现价')
    discount = models.FloatField(default=1, verbose_name='折扣')
    desc = models.CharField(max_length=100, verbose_name='简介')
    sales = models.IntegerField(default=0, verbose_name='销量')
    tag = models.ManyToManyField(Tag, verbose_name='商品风格标签')
    num = models.IntegerField(default=0, verbose_name='库存')
    image_url_i = models.ImageField(upload_to='furniture/%Y/%m', default='furniture/default.jpg', verbose_name='展示图片路径')
    image_url_l = models.ImageField(upload_to='furniture/%Y/%m', default='furniture/default.jpg',
                                    verbose_name='详情图片路径1')
    image_url_m = models.ImageField(upload_to='furniture/%Y/%m', default='furniture/default.jpg',
                                    verbose_name='详情图片路径2')
    image_url_r = models.ImageField(upload_to='furniture/%Y/%m', default='furniture/default.jpg',
                                    verbose_name='详情图片路径3')
    image_url_c = models.ImageField(upload_to='furniture/%Y/%m', default='furniture/ce.jpg', verbose_name='购物车展示图片')


    class Meta:
        verbose_name = '商品'
        verbose_name_plural = verbose_name
        ordering = ['id']

    def __str__(self):
        return self.brand.name + " " + self.category.name


# 购物车条目
class Caritem(models.Model):
    furniture = models.ForeignKey(Furniture, verbose_name='购物车中产品条目')
    quantity = models.IntegerField(default=0, verbose_name='数量')
    sum_price = models.FloatField(default=0.0, verbose_name='小计')

    class Meta:
        verbose_name = '购物车条目'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id)


# 购物车
class Cart(object):
    def __init__(self):
        self.items = []
        self.total_price = 0.0

     #定义加入购物车算法
    def add(self, furniture):
        self.total_price += furniture.new_price  #购物车总额增加
        for item in self.items:
            if item.furniture.id == furniture.id:  #购物车已存在该商品
                item.quantity += 1   #数量增一
                item.sum_price += furniture.new_price
                return
        else:
            self.items.append(Caritem(furniture=furniture, quantity=1, sum_price=furniture.new_price))


# 订单
class Order(models.Model):
    user = models.ForeignKey(User, verbose_name='下单用户')
    price = models.CharField(max_length=10, verbose_name='总价格')
    order_state = models.CharField(max_length=10, choices=(('未发货', '未发货'), ('已发货', '已发货')), verbose_name='订单状态')
    #express_id = models.CharField(max_length=50, verbose_name='快递单号')
    #furniture = models.ForeignKey(Furniture,verbose_name='家具')
    staff = models.CharField(max_length=100,verbose_name='商品')  #通常是第一件商品的名字
    #order_date = models.DateTimeField('订单时间', auto_now=True)
    order_date = models.DateField('订单时间', auto_now=True)

    class Meta:
        verbose_name = '订单'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.id)


# 订单条目
class Order_list(models.Model):
    furniture = models.CharField(max_length=50, verbose_name='商品名')
    quantity = models.IntegerField(default=0, verbose_name='数量')
    order = models.ForeignKey(Order, verbose_name='所属订单')
    remark = models.IntegerField(default=0, choices=((0, '未评价'), (1, '已评价')), verbose_name='是否评价')
    user_id = models.IntegerField(default=0,verbose_name='用户')
    list_date = models.DateField('订单时间', auto_now=True)

    class Meta:
        verbose_name = '订单条目'
        verbose_name_plural = verbose_name

    def __str__(self):
        return str(self.furniture)

#评论
class Comment(models.Model):
    comm= models.CharField(max_length=50,verbose_name='评论内容')
    fur_id = models.IntegerField(default=1,verbose_name='商品ID')
    user_id = models.IntegerField(default=1,verbose_name='用户ID')
    order_id = models.IntegerField(default=1,verbose_name='订单ID')

    class Meta:
        verbose_name = '评价'
        verbose_name_plural = verbose_name
    def __str__(self):
        return str(self.comm)


def get_sales_by_fur():
    try:
        db = pymysql.connect(host='localhost',user='root',password='123456',db='test',charset='utf8')
        cursor = db.cursor()
        #cursor.execute("select * from myapp_furniture")
        cursor.execute("SELECT DISTINCT(brand_id) FROM myapp_furniture")
        results = cursor.fetchall()  #表中所有的家具信息
        #sql="select name from myapp_furniture"
        #results = ConnMySql.get_data("testdb",sql)
        brand_id = []
        for row in results:
            #fur.append(row[2])  #fur列表中是家具名
            brand_id.append(row[0])  #不同的品牌id
        fur_number = []
        for i in brand_id:
            #sql_fur_number = "select sales from myapp_furniture where name='%s'"%str(i)
            #temp=ConnMySql.get_data("testdb",sql_fur_number)
            #fur_number.append(int(ConnMySql.get_data("testdb",sql_fur_number)[0][0]))   #fur_number中式每种家具的数量
           # cursor.execute("select sales from myapp_furniture where name=%s",(i))
            cursor.execute("SELECT SUM(sales) from myapp_furniture WHERE brand_id=%s",(i))
            cds = cursor.fetchall()
            fur_number.append(int(cds[0][0]))
            brand_name=[]
        for i in brand_id:
            cursor.execute("SELECT name from myapp_brand WHERE id=%s",(i))
            cb = cursor.fetchall()
            brand_name.append(cb[0][0])
        return brand_id,fur_number,brand_name
        #return fur_number
    except Exception as e:
        return 401

