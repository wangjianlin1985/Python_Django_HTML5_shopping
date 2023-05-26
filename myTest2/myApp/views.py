# coding: utf-8
from django.shortcuts import render_to_response,render,redirect,HttpResponseRedirect
from django.http import  HttpResponse,Http404
from myApp.forms import *
from myApp.models import *
from django.template import RequestContext
from django.contrib.auth import login,logout,authenticate
from django.conf import settings
from django.contrib.auth.hashers import make_password
from django.core.paginator import Paginator,InvalidPage,EmptyPage,PageNotAnInteger
from django.db.models import F
from myApp.kuaidi import *
import time
from django.contrib.admin.views.decorators import staff_member_required  #装饰器

def global_settings(request):
    #站点信息
    MEDIA_URL = settings.MEDIA_URL
    category_list = Category.objects.all()
    #品牌信息
    brand_list = Brand.objects.all()
    #热销榜信息
    hot_list = Furniture.objects.all().order_by('-sales')[:4]
    #标签
    tag_list = Tag.objects.all()
    #购物车
    cart = request.session.get(request.user.id,None)
    ad_list = Ad.objects.all()
    fur_list = Furniture.objects.all()
    fur_list = getPage(request, fur_list)
    return locals()


#给家具分页
def getPage(request,fur_list):
    paginator = Paginator(fur_list,8)  #一页大小
    try:
        page = int(request.GET.get('page',1))
        fur_list = paginator.page(page)
    except (EmptyPage,InvalidPage,PageNotAnInteger):
        fur_list = paginator.page(1)
    return  fur_list

#给评价分页
def commPage(request,comments):
    paginator = Paginator(comments,4)
    try:
        page = int(request.GET.get('page',1))
        comments = paginator.page(page)
    except (EmptyPage,InvalidPage,PageNotAnInteger):
        comments = paginator.page(1)
    return comments

#主页
def index(request):
    return render(request,"index.html",locals())



#产品分类
def products(request):
    try:
        cid = request.GET.get('cid',None)  #获取分类的id号
        try:
            category = Category.objects.get(pk=cid)#查找对应id的分类
        except Category.DoesNotExist:#分类不存在
            return render(request,'error.html',{"reason":"分类不存在"})
        fur_list = Furniture.objects.filter(category=category)  #查找对应分类的家具
        fur_list = getPage(request,fur_list)   #获取一页的家具列表
    except Exception as e:
        pass
    return render(request,'products.html',locals())

#登录
def do_login(request):
    try:
        if request.method == 'POST':  #方式是提交
            login_form = LoginForm(request.POST)  #forms实例化，request.POST是表单中的数据，刚开始为空
            if login_form.is_valid():  #校验表单
                username = login_form.cleaned_data["username"]
                password = login_form.cleaned_data["password"]
                user = authenticate(username=username,password=password)  #认证给出的用户名和密码，合法返回一个User对象，密码不合法返回None
                if user is not None:
                    user.backend = 'django.contrib.auth.backends.ModelBackend'
                    #通过附加 user.backend 属性来记录验证是被哪个配置的 backend 通过的。通常是 django.contrib.auth.backends.ModelBackend.
                    login(request,user)
                    return render(request,'index.html')
                else:
                    return render(request,'error.html',{'reason':'登录验证失败'})
                #return redirect(request.POST.get('source_url')) #request。POST.get()获取login.html表单中的值：source_url
            else:
                return render(request,'error.html',{'reason':login_form.errors})
        else: #GET方法，如第一次进入登陆页面
            login_form = LoginForm()
    except Exception as e:
        #logger.error(e)
        pass
    return render(request,'login.html',locals())

#注册
def do_reg(request):
    try:
        if request.method == 'POST':  #POST方法
            reg_form = RegForm(request.POST)  #提取post的数据
            print(reg_form.is_valid())
            if reg_form.is_valid():  #校验表单
                user = User.objects.create(username=reg_form.cleaned_data["username"],  #创建一个对象，并保存在user中
                                    email=reg_form.cleaned_data["email"],
                                    password = make_password(reg_form.cleaned_data["password"]),
                                    address=reg_form.cleaned_data["address"],
                                    phone=reg_form.cleaned_data["phone"],)
                #注册后直接登录
                user = authenticate(username=reg_form.cleaned_data["username"],password=reg_form.cleaned_data["password"])
                if user is not None:
                    user.backend = 'django.contrib.auth.backends.ModelBackend'
                    login(request,user)
                    #return redirect(request.POST.get('source_url'))
                    return render(request,'index.html',locals())
                else:
                    return  render(request,'error.html','登陆失败')
            else:
                return render(request,'error.html',{'reason':reg_form.errors})
        else:
            reg_form=RegForm()
    except Exception as e:
        #logger.error
        print(e)
        pass
    return render(request,'register.html',locals())

#退出
def do_logout(request):
    try:
        logout(request)
    except Exception as e:
        pass
    return render(request, 'index.html', locals())


#查看购物车
def view_cart(request):
    if request.user.is_authenticated():
        cart = request.session.get(request.user.id,None)  #获取session中存放的cart
        return render(request,'checkout.html',locals())
    else:
        login_form = LoginForm()    #若用户还未登录，跳转到登录页面
        return render(request,'login.html',locals())

#商品详情页
def detail(request):
    try:
        did =request.GET.get('did',None)
        try:
            fur = Furniture.objects.get(pk=did)
            comments = Comment.objects.filter(fur_id=fur.id)  #首先在评论表中筛选出所有当前商品的评论的对象
            comments = commPage(request, comments)   #一页的评论列表
            users = []   #评论过当前商品的所有用户
            for c in comments:
                user = User.objects.get(id=c.user_id)  #选出给出评价的对应的用户
                users.append(user)
        except Furniture.DoesNotExist:
            return render(request,'error.html',{'reason':'商品不存在'})
    except Exception as e:
        #logger.error(e)
        pass
    return render(request,'single.html',locals())

#清空购物车
def cleanCart(request):
    if request.user.is_authenticated():#判断是否登陆
        cart = Cart()  #若已登录，初始化一个空的购物车
        request.session[request.user.id] = cart  #将空的购物车放入session
        return render(request,'index.html',locals())  #转到结算页
    else:
        login_form=LoginForm()  #没有登录，初始化一个form表单 让用户登录
        return render(request,'login.html',locals())  #转到登陆页面

#添加购物车
def add_cart(request):
    if request.user.is_authenticated():
        try:
            chid = request.GET.get('chid',None)  #获取传值，商品id
            try:
                furniture = Furniture.objects.get(pk=chid)  #获取id对应的家具
            except Furniture.DoesNotExist:
                return render(request, 'error.html', {'reason':'商品不存在'})
            cart = request.session.get(request.user.id,None)  #获取session中的购物车
            if not cart:  #session中没有购物车
                cart = Cart()  #实例化一个空的购物车
                cart.add(furniture) #调用cart对象的add方法，不重复的
                request.session[request.user.id] = cart  #把购物车重新放入session
            else:
                cart.add(furniture)  #session中已有购物车，直接加入家具
                request.session[request.user.id] = cart  #保存购物车
        except Exception as e:
            #logger.error(e)
            pass
        return render(request, 'checkout.html', locals())
    else:  #还未登陆，重定向到登录页面
        login_form = LoginForm()
        return render(request, 'login.html', locals())

#品牌列表页
def brands(request):
    try:
        bid = request.GET.get('bid',None)  #获取某一品牌的品牌id
        try:
            brand = Brand.objects.get(pk=bid)  #查询该id的品牌
        except Brand.DoesNotExist:
            return render(request,'error.html',{'reason':'品牌不存在'})
        fur_list = Furniture.objects.filter(brand=brand)  #查询该品牌对应的家具们的列表
        fur_list = getPage(request,fur_list)  #将家具列表分页
    except Exception as e:
        pass
    return render(request,'products.html',locals())

#标签列表页
def tags(request):
    try:
        tid = request.GET.get('tid',None) #获取pro_right页面的传参，tag.id
        try:
            tag = Tag.objects.get(pk=tid)
        except Tag.DoesNotExist:
            return render(request,'error.html',{'reason':'标签不存在'})
        fur_list = Furniture.objects.filter(tag=tag)
        fur_list = getPage(request,fur_list)
    except Exception as e:
        pass
    return render(request,'products.html',locals())


# 快递查询
def getExpress(request):
    try:
        postid = request.POST.get('postid','请输入你要查询的快递单号')
        content, postid = get_content(postid)
        express_form = ExpressForm()
        return render(request,'express.html',locals())
    except:
        express_form = ExpressForm()
        return render(request,'express.html',locals())


#生成当前订单
def final_order(request):
    #获取购物车上的信息加入数据库
        if request.user.is_authenticated():
            cart = request.session.get(request.user.id,None)  #获取session中的购物车
            user = User.objects.get(username=request.user.username)  #获取当前登录的用户
            order = Order.objects.create(user=user,price=cart.total_price,order_state='未发货',staff=cart.items[0].furniture.name)  #创建订单
            order.save()
            for item in cart.items:
                #创建订单条目
                order_list = Order_list.objects.create(furniture=item.furniture.name,quantity=item.quantity,order=order,user_id=user.id)
                order_list.save()
                #修改销量
                furniture = Furniture.objects.get(name = item.furniture.name)
                furniture.sales+=item.quantity
                furniture.save()
            cart = Cart()#清空购物车
            request.session[request.user.id] = cart
            return HttpResponseRedirect("http://localhost:8000/show_order/")
            #return render(request,'Personal.html',locals())
        else:
            return render(request,'login.html',locals())


def fur_statistic(request):
    temp_brand = get_sales_by_fur()
    fur = temp_brand[0]  #上面函数返回的第一个参数,家具名
    fur_number = temp_brand[1]  #上面函数返回的第二个参数，销量
    brand_name = temp_brand[2]
    return render(request,'chart.html',locals())


def show_order(request):
    user_name = request.user.username  #获取用户名
    user = User.objects.get(username=request.user.username)  # 获取当前登录的用户
    orders_list = Order.objects.filter(user=user) #过滤出该用户的所有订单
    reco = recommend_fur(request)
    return render(request,'Personal.html',locals())

def remind(request):
    oid = request.GET.get('oid', None)  #获取订单编号
    order = Order.objects.get(id=oid)
    order.order_state = '已发货'
    order.save()
    return HttpResponseRedirect("http://localhost:8000/show_order/")

def confirm(request):
    oid = request.GET.get('oid', None)  # 获取订单编号
    order = Order.objects.get(id=oid)
    order.order_state = '已收货'
    order.save()
    return HttpResponseRedirect("http://localhost:8000/show_order/")

#显示某一订单下待评论的商品列表
def comment(request):
    oid = request.GET.get('oid',None)
    order_list = Order_list.objects.filter(order_id=oid)  #从order_list表中获取到order_id=oid的所有订单条目
    order_list = order_list.filter(remark=0)   #选出未评价的订单条目
    fur_list = []   #未评价的商品列表
    for order in order_list:
        fur_name = order.furniture  #每个订单条目所对应的家具名
        furniture = Furniture.objects.get(name=fur_name)  #根据家具名找到对应的家具
        fur_list.append(furniture)
    return render(request,'comment.html',locals())

#显示即将评价的单个商品的评价页面
def show_single_comm(request):
    fur_id=request.GET.get('fid',None)  #商品id
    fur= Furniture.objects.get(id=fur_id)#获取商品对象
    oid = request.GET.get('oid',None)  #属于的订单号
    comm_form = CommentForm()
    return render(request,'desc_comm.html',locals())

#执行评价
def do_comment(request):
    try:
        if request.method == 'POST':
            comm_form = CommentForm(request.POST)   #根据用户填写的评论表单实例化一个表单对象
            if comm_form.is_valid():
                user_name = request.user.username  # 获取用户名
                user = User.objects.get(username=request.user.username)  # 获取当前登录的用户
                u_id = user.id
                f_id = request.POST.get('fur_id','None')  #商品ID
                order_id = request.POST.get('order_id', 'None')  #订单ID
                comment = Comment.objects.create(comm=comm_form.cleaned_data["comm"],fur_id=f_id,user_id=u_id,order_id=order_id) #实例化评价条目对象
                comment.save()
                #修改order_List表
                order_list = Order_list.objects.filter(order_id=order_id)
                fur = Furniture.objects.get(id=f_id)
                furniture = fur.name
                order_list = order_list.filter(furniture=furniture)  #order_list中是当前订单号中正在评价的商品所对应的订单条目
                for order in order_list:
                    order.remark = 1  #修改当前评价的商品为已评价状态
                    order.save()
                #return render(request,'comment.html',locals())
                return HttpResponseRedirect("http://localhost:8000/comment/?oid="+order_id)
            else:
                return render(request,'error.html',{'reason':comm_form.errors})
        else:
            comm_form = CommentForm()
    except Exception as e:
        pass
    return render(request,'comment.html',locals())

#某订单下所有订单条目均评论完成
def finish_comm(request):
    oid = request.GET.get('oid',None)  #获取当前订单号
    order_list = Order_list.objects.filter(order_id=oid)  #获取该订单的所有订单条目
    order_list = order_list.filter(remark=0)  #获取未评论的订单条目
    if not order_list:  #order_list列表为空
        order = Order.objects.get(id=oid)
        order.order_state='评价完成'  #修改订单状态
        order.save()
    return HttpResponseRedirect("http://localhost:8000/show_order/")

#查看评论
def check_remark(request):
    oid = request.GET.get('oid', None)  #订单号
    order_list = Order_list.objects.filter(order_id=oid)  # 从order_list表中获取到order_id=oid的所有订单条目
    fur_list = []  # 订单对应的商品列表
    comms = []
    for order in order_list:
        fur_name = order.furniture  # 每个订单条目所对应的家具名
        furniture = Furniture.objects.get(name=fur_name)  # 根据家具名找到对应的家具
        comm = Comment.objects.filter(fur_id=furniture.id)
        comm = comm.filter(order_id=oid)
        fur_list.append(furniture)
        comms.append(comm)
    return render(request, 'check_remark.html', locals())

def recommend_fur(request):
    try:
        db = pymysql.connect(host='localhost', user='root', password='123456', db='test', charset='utf8')
        cursor = db.cursor()
        user_name = request.user.username
        user = User.objects.get(username=request.user.username)
        cursor.execute("SELECT furniture FROM myapp_order_list WHERE user_id=%s ORDER BY list_date DESC",(user.id)) #查询当前用户已购买的家具，按时间逆序
        results = cursor.fetchall()
        furs = []   #家具，对象
        fur_category = []  #购买所有的家具的分类名，string
        #fur_brand = []  #购买所有家具的品牌名，string
        fur_tag = []  #tag.id
        for row in results:
            fur_name = row[0]
            furniture = Furniture.objects.get(name=fur_name)
            furs.append(furniture)
            fur_category.append(furniture.category.name)
            #fur_brand.append(furniture.brand.name)
            cursor.execute("SELECT tag_id from myapp_furniture_tag WHERE furniture_id=%s", (furniture.id))
            result = cursor.fetchall()
            tag_id = result[0][0]
            tag = Tag.objects.get(pk=tag_id)
            fur_tag.append(tag.id)
        fur = furs[:5]  #前5个已购买的家具对象
        #fur_brand = fur_brand[:5]
        fur_tag = fur_tag[:3]
        fur_category = fur_category[:3]
        reco_fur = []  #根据分类推荐的家具列表,对象
        reco_fur_id = []  #与reco_fur一一对应的家具id
        recommend_furniture = []#最终推荐对象
        for c in fur_category:
            cat = Category.objects.get(name=c)
            cursor.execute("SELECT * FROM myapp_furniture WHERE category_id=%s", (cat.id))
            result1 = cursor.fetchall()
            for row in result1:
                fur_id = row[0]
                fur = Furniture.objects.get(pk=fur_id)
                reco_fur_id.append(fur_id)
                reco_fur.append(fur)   #根据分类选商品
        for i in fur_tag:
            cursor.execute("SELECT * FROM myapp_furniture_tag WHERE tag_id=%s", (i))
            result2 = cursor.fetchall()
            for row in result2:
                f_id = row[1]   #某一风格标签的家具id
                for f in reco_fur_id:
                    if f == f_id:
                        furniture_c_t = Furniture.objects.get(pk=f_id)
                        recommend_furniture.append(furniture_c_t)

        for rf in recommend_furniture:
            for f in furs:
                if rf == f:
                    recommend_furniture.remove(rf)
        #去重
        #recommend_furniture = list(set(recommend_furniture)
        recommend_furnitures = list(set(recommend_furniture))
        #取4个
        give_furs = []
        give_furs =recommend_furnitures[:4]
    except Exception as e:
        pass
    return give_furs