def distance(strand_a, strand_b):
    distance=0;
    if not len(strand_a) == len(strand_b):
        raise ValueError("Strands must be of equal length.")
    else:
        for i in range (0,len(strand_a)):
            if not strand_a[i]==strand_b[i]:
                distance = distance + 1
    return distance
        
