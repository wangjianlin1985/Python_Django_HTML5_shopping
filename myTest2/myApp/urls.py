from django.conf.urls import include, url
from myApp.views import *

urlpatterns = [
    url(r'^$', index, name='index'),
    url(r'^products/$', products, name='products'),
    url(r'^brands/$', brands, name='brands'),
    url(r'^tags/$', tags, name='tags'),
    url(r'^login/$',do_login,name='login'),
    url(r'^register/$',do_reg,name='register'),
    url(r'^logout/$',do_logout,name='logout'),
    url(r'^express/$',getExpress,name='express'),
    url(r'^view_cart/$',view_cart,name='view_cart'),
    url(r'^detail/$', detail, name='detail'),
    url(r'^add_cart/$', add_cart, name='add_cart'),
    url(r'^clean_cart/$', cleanCart, name='clean_cart'),
    url(r'^final_order/$',final_order,name='final_order'),
    url(r'^show_order/$', show_order,name='show_order'),
    url(r'^remind/$',remind,name='remind'),
    url(r'^confirm/$',confirm,name='confirm'),
    url(r'^comment/$',comment,name='comment'),
    url(r'^show_single_comm/$',show_single_comm,name='show_single_comm'),
    url(r'^do_comment/$',do_comment,name='do_comment'),
    url(r'^finish_comm/$',finish_comm,name='finish_comm'),
    url(r'^check_remark/$',check_remark,name='check_remark'),
    #url(r'^recommend/$',recommend_fur,name='recommend_fur'),
    url(r'^chart/$',fur_statistic),

]
