class MyMiddleWare(object):
    def __init__(self):
        print('Hello,this is my middlware')
    def process_view(self,request,func,args,kwargs):
        print(func)