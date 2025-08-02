def all_rows_equal(board):
    rows_equal=True
    cols=0
    for i in range(0,len(board)):
        if i==0:
            cols=len(board[i])
        else:
            if not len(board[i])==cols:
                rows_equal=False
    
    return rows_equal

def mine_boundaries(row,col,row_size,col_size):
    row_inf=0
    row_sup=0
    col_inf=0
    col_sup=0
    if row-1<0:
        row_inf=0
    else:
        row_inf=row-1
    if col-1<0:
        col_inf=0
    else:
        col_inf=col-1
    if row+1>=row_size:
        row_sup=row_size-1
    else:
        row_sup=row+1
    if col+1>=col_size:
        col_sup=col_size-1
    else:
        col_sup=col+1

    return row_inf, row_sup, col_inf, col_sup

def annotate(minefield):
    board_rows=len(minefield)
    if board_rows==0:
        minefield=[]
    else:
        if all_rows_equal(minefield):
            board_columns=len(minefield[0])
        else:
            raise ValueError("The board is invalid with current input.")
    
        for row in minefield:
            for char in row:
                if not (char==' ' or char=='*'):
                    raise ValueError("The board is invalid with current input.")
    
        for row in range(0,board_rows):
            for column in range(0,board_columns):
                if minefield[row][column]=="*":
                    row_inf, row_sup, col_inf, col_sup = mine_boundaries(row,column,board_rows,board_columns)
                    for i in range (row_inf,row_sup+1):
                        for j in range (col_inf, col_sup+1):
                            if not (minefield[i][j]=='*'):
                                if minefield[i][j]==' ':
                                    minefield[i]=minefield[i][0:j]+'1'+minefield[i][j+1:col_sup+1]+minefield[i][col_sup+1:]
                                else:
                                    minefield[i]=minefield[i][0:j]+str(1+int(minefield[i][j]))+minefield[i][j+1:col_sup+1]+minefield[i][col_sup+1:]                    
    
    return minefield
