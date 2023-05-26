from myApp.models import *
from django.contrib import admin


class ProductAdmin(admin.ModelAdmin):
    list_display = ('brand','name','num',)
    fieldsets = (
        ('None',{'fields':('category','name','brand','size','old_price',
                           'new_price','desc','sales','tag','num','image_url_i',
                           'image_url_l','image_url_m','image_url_r','image_url_c',)}),
    )

class OrderAdmin(admin.ModelAdmin):
    list_display = ('id','user','price','order_state','order_date')

class Order_listAdmin(admin.ModelAdmin):
    list_display = ('order','furniture','quantity','user_id','list_date')

class CommentAdmin(admin.ModelAdmin):
    list_display = ('comm','fur_id','user_id','order_id')

class UserAdmin(admin.ModelAdmin):
    list_display = ('username','phone','email','address','date_joined')

# Register your models here.
admin.site.register(User,UserAdmin)
admin.site.register(Ad)
admin.site.register(Category)
admin.site.register(Tag)
admin.site.register(Size)
admin.site.register(Brand)
admin.site.register(Furniture,ProductAdmin)
admin.site.register(Order,OrderAdmin)
admin.site.register(Order_list,Order_listAdmin)
admin.site.register(Comment,CommentAdmin)