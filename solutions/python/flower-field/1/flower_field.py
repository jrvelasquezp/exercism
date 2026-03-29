def annotate(garden):
    lenghts=[len(x)==len(garden[0]) for x in garden]
    valid_char=[]
    #print(lenghts)
    if not all(lenghts):
        raise ValueError("The board is invalid with current input.")
    elif garden==[]:
        return garden
    elif garden==[""]:
        return garden
    else:
        for row in garden:
            for ch in row:
                if ch != " " and ch != "*":
                    raise ValueError("The board is invalid with current input.")
                    break
        #now it makes all the conversion
        for x in range(0,len(garden)):
            garden[x]=garden[x].replace(' ','0')
            garden[x]=list(garden[x])
        #print(garden)
    
    
        for x in range(0,len(garden)):
            for y in range(0,len(garden[x])):
                #print(x,y, garden[x][y])
                for i in range (-1,2):
                    for j in range(-1,2):
                        if (x != x+i or y != y+j) and (x+i>=0 and y+j>=0) and (x+i<len(garden) and y+j<len(garden[x])) and garden[x+i][y+j] != '*' and garden[x][y] == '*':
                            garden[x+i][y+j]=str(int(garden[x+i][y+j])+1)
                            #print(x,y,x+i,y+j,garden[x+i][y+j])
    
        #print(garden)
    
        for x in range(0,len(garden)):
            for y in range(0,len(garden[x])):
                if garden[x][y] == '0':
                    garden[x][y]=' '
                #flowerpot[x]=flowerpot[x].replace('0',' ')
            garden[x]=''.join(garden[x])
        #print(garden)
        return garden

