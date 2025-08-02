def append(list1, list2):
    for x in list2:
        list1.append(x)
    return list1

def concat(lists):
    answer=[]
    for x in lists:
        answer=append(answer,x)
    return answer


def filter(function, list):
    answer=[]
    for x in list:
        if function(x):
            answer.append(x)

    
    return answer


def length(list):
    len=0
    for x in list:
        len=len+1
    return len

def map(function, list):
    answer=[]
    for x in list:
        answer.append(function(x))

    
    return answer


def foldl(function, list, initial):
    for x in list:
        initial=function(initial,x)
    return initial


def foldr(function, list, initial):
    list=reverse(list)
    for x in list:
        initial=function(initial,x)
    return initial


def reverse(list):
    answer=[]
    for x in list:
        answer.insert(0,x)
    return answer