import json
from django.http import HttpResponse

def get_vote_result(request):
    pie_list = [['����',50],['�Ϻ�',20],['����',30]]
    t_country = ['����','�Ϻ�','����']
    t_country_count = [50,20,30]
    data_dict = {'pie_g':pie_list,'t_country':t_country,'t_country_count':t_country_count}
    return HttpResponse(json.dump(data_dict))  #��strת����dict��ʽ