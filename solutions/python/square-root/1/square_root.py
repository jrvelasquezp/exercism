def square_root(number):
    if number==1:
        x=1
    else:
        #Bakshali method
        x=12
        for i in range(1,10):
            a=(number-x*x)/(2*x)
            b=x+a
            x=b-(a*a)/(2*b)
    return x
