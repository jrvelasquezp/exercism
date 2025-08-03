def primes(limit):
    numbers = []
    sieve = []
    
    for i in range (2,limit+1):
        numbers.append(i)
    
    i=0
    while i<len(numbers):
        j=0
        prime=numbers[i]
        sieve=[]
        factor=2
        while j<len(numbers):
            num=numbers[j]
            if num<prime*factor:
                sieve.append(num)
            elif num>prime*factor:
                factor=factor+1
                j=j-1
            else:
                factor=factor+1
            j=j+1
        i=i+1
        numbers=sieve
        
    return sieve
