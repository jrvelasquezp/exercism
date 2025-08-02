def find(search_list, value):
    index=0
    found=False

    while len(search_list)>2 and found==False:
        middle=len(search_list)//2
        if value == search_list[middle]:
            found=True
            index=index+middle
        elif value < search_list[middle]:
            search_list=search_list[:middle]
        else:
            search_list=search_list[middle:]
            index=index+middle

    if len(search_list)==0:
        raise ValueError("value not in array")
    elif len(search_list)==1:
        if value==search_list[0]:
            index=0
        else:
            raise ValueError("value not in array")
    elif len(search_list)==2:
        if value==search_list[1]:
            index=index+1
        else:
            raise ValueError("value not in array")
            
    return index