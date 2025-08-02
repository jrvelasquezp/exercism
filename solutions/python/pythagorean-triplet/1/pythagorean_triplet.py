def triplets_with_sum(number):
    list_triplets=[]
    for a in range (1,int(number/3)):
        for b in range (a+1,number):
            c=number-a-b    
            if c < b:
                break
            elif b < c and a*a+b*b == c*c:
                list_triplets.append([a,b,c])
    return list_triplets
        
                
        
