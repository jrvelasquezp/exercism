def slices(series, length):    
    if series == "":
        raise ValueError("series cannot be empty")
    elif length==0:
        raise ValueError("slice length cannot be zero")
    elif length<0:
        raise ValueError("slice length cannot be negative")
    elif length>len(series):
        raise ValueError("slice length cannot be greater than series length")
    elif length==len(series):
        return [series]
    else:
        answer=[]
        for i in range(0,len(series)-length+1):
            answer.append(series[i:i+length])
        return answer
