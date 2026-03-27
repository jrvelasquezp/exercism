import math

def largest_product(series, size):
    if len(series) < size:
        raise ValueError("span must not exceed string length")
    elif size < 1:
        raise ValueError("span must not be negative")
    elif not series.isdigit():
        raise ValueError("digits input must only contain digits")
    elif int(series)==0:
        return 0
    elif len(series)==size:
        digits=list(series)
        digits=[int(x) for x in digits]
        return math.prod(digits)
    else:
        lista=[series[x:x+size] for x in range(0,len(series)-size+1)]
        lista=[list(x) for x in lista]
        lista=[[int(xs) for xs in x] for x in lista]
        lista=[math.prod(x) for x in lista]
        return max(lista)
