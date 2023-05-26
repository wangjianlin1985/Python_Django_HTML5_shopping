import json
from django.http import HttpResponse

def get_vote_result(request):
    pie_list = [['北京',50],['上海',20],['广州',30]]
    t_country = ['北京','上海','广州']
    t_country_count = [50,20,30]
    data_dict = {'pie_g':pie_list,'t_country':t_country,'t_country_count':t_country_count}
    return HttpResponse(json.dump(data_dict))  #将str转化成dict格式