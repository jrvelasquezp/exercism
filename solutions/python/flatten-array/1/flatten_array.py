def flatten(value):
    if any(type(e)==list for e in value) == False:
        pass
    else:
        for e in value:
            if type(e) == list:
              value=value[:value.index(e)]+flatten(e)+value[1+value.index(e):]    
    return [x for x in value if x != None]

