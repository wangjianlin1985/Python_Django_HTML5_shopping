#coding:utf-8
#推荐系统
import time
import random


class Recommend(object):
    """
    like 是反应用户最近的趋势，趋势用value[0]表示，value[1]表示其开始时间
    learn 用于再学习，info参数接受一个用户选择的结果（例如一个商品）
    result 是获取test集合的推荐结果，返回下标值
            遍历like，其中的标签若过期了，则自动删除，不过期则于该样本比对，符合一个该样本的推荐系数+1
    """
    def __init__(self,limit_time):
        self._like = dict()  #{'key1':(value[0],value[1]),'key2':(value[0],value[1])}  value[0]是喜欢的程度，value[1]是开始时间
        self._time = limit_time  #有效期，按秒算

    def learn(self,info:dict):
        """
        根据info的内容学习，学习内容会连同当前的时间记录下来
        :param info: info是代表选择的属性，例如电影会具有{'title':'abc','type':'喜剧'}的形式，这些就是它需要学习的地方
        :return:
        """
        for key in info.values():
            if key in self._like:   #info的value值是self._like的键值
                self._like[key] = (self._like[key][0]+1,time.time())   #修改self._like的喜欢程度，开始时间
            else:  #info的value值在self._like中没有相应的键
                self._like[key] = (1,time.time())   #新增self._like中的键值对，初始化喜欢程度

    def result(self,test_set:list,number:int):
        """
        给出测试集合，会与记录中的用户偏好进行比较，选出标签符合数最多的集合在测试集合中的下标
        :param test_set: 列表，其单个元素的内容是{p1:v1,p2:v2},v会用于与self._like的key比较
        :param number: 需要返回的选择数目
        :return:   返回一个列表，内容是test_set的下标
        """
        #第一次
        if len(self._like) == 0:
            #返回number个，在[0,len(test_set))中的随机数字
            return [random.randrange(0,len(test_set),1) for x in range(number)]
        #已经有资料了：
        t = time.time()  #t是当前时间
        res = dict()  #推荐系数，与test_set中的电影一一对应
        for index in range(len(test_set)):  #index是测试集合的所有下标
            res[index] = 0
            #选出self._like中前5个标签（近段时间的喜好）
            # 将self._like按value[0]也就是喜欢程度降序排列,key_list是排序后键值组成的列表
            key_list = sorted(self._like,key=lambda x:int(self._like[x][0]),reverse=True)
            if len(key_list) >= 5:
                key_list = key_list[:5]
            for like in key_list:
                w,begin_time = self._like[like]
                if begin_time >= t-self._time:  #开始时间大于当前时间减有效期，说明没有过期
                    if like in test_set[index].values():
                        #给test_set中某项的推荐系数加一
                        res[index]+=1
                    else:  #过期，删除self._like中的过期项
                        del self._like[like]
        return sorted(res,key=lambda x:res[x],reverse=True)[:number]   #返回推荐系数的列表下标
