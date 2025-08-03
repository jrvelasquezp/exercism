import math
def prime(n):
    if n == 0:
        raise ValueError('there is no zeroth prime')
    elif n == 1:
        return 2
    elif n == 2:
        return 3
    else:
        prime=2
        #generate array of numbers
        numbers=[x for x in range(2,110000) if (x%2!=0 or x==2) and (x%3!=0 or x==3) and (x%5!=0 or x==5)]
        #filter multiples of prime
        for i in range (7,320):
            numbers=list(filter(lambda x: (x%i != 0 or x==i),numbers))
            #print(numbers)
        return numbers[n-1]
                

