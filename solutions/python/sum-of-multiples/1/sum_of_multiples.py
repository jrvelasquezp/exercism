def sum_of_multiples(limit, factor):
    sum_of_multiples=0
    if len(factor)> 0:
        multiples = []
        for f in factor:
            if f !=0:
                multiples.append([x for x in range(1,limit) if x%f==0])
            else:
                multiples.append([0])
        for f in range(1,len(multiples)):
            multiples[0]=multiples[0]+multiples[f]
        multiples[0]=list(set(multiples[0]))
        sum_of_multiples=sum(multiples[0])
    return sum_of_multiples