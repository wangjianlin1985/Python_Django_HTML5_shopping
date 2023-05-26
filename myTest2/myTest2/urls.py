from django.conf.urls import patterns, include, url
from django.contrib import admin
from myApp.views import *
admin.autodiscover()

urlpatterns = [
    #url(r'^admin/mypage/$', 'myApp.views.my_admin_view'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('myApp.urls')),
    url(r"^uploads/(?P<path>.*)$", \
        "django.views.static.serve", \
        {"document_root": settings.MEDIA_ROOT, }),
    #uploads说明这是一个路由地址，(?P<path>.*)$表示可以是任意字符
    #"django.views.static.serve"是调用django里面的server方法
    #"document_root": settings.MEDIA_ROOT,这是对应路径
]