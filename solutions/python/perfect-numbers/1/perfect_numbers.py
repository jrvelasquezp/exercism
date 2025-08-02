def classify(number):

    factors = set()
    result=""
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    elif number == 1:
        factors.add(1)
        result="deficient"
    else:
        for i in range (1,number):
            if i < number/2 + 1 and number % i == 0:
                factors.add(int(i))
                if number/i < number:
                    factors.add(int(number/i))
    
        sum=0
        for i in factors:
             sum=sum+i
        
        if sum==number:
            result="perfect"
        elif sum > number:
            result="abundant"        
        else:
            result="deficient"
    return result
    