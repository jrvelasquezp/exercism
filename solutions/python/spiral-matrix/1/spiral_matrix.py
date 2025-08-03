def spiral_matrix(size):
    spiral=[]
    if size==0:
        spiral=[]
    elif size==1:
        spiral=[[1]]
    else:
        for i in range(0,size):
            spiral.append([0]*size)

        mini=0
        maxi=size-1
        i=1
        row=0
        col=0
        state=1

        while i<=size*size:
            if col<maxi and state==1:
                spiral[row][col]=i
                col=col+1
                if col==maxi:
                    state=2
            elif row<maxi and col == maxi and state==2:
                spiral[row][col]=i
                row=row+1
                if row==maxi:
                    state=3
            elif col>mini and state==3:
                spiral[row][col]=i
                col=col-1
                if col==mini:
                    state=4
            elif row>mini and col==mini and state==4:
                spiral[row][col]=i
                row=row-1
                if row==mini:
                    state=1
                    mini=mini+1
                    maxi=maxi-1
                    row=mini
                    col=mini
            i=i+1

        if size % 2 == 1:
            spiral[mini][mini]=size*size
        
    return spiral
