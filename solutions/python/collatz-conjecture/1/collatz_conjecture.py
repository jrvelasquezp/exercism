def steps(number):
    #if number is even divide by 2
    i=0
    if number==1:
        i=0
    elif number<=0:
        raise ValueError("Only positive integers are allowed")
    else:
        while number!=1:
            if number % 2 == 0:
                number=number/2
                i=i+1
            else:
                number=3*number+1
                i=i+1
    return i
