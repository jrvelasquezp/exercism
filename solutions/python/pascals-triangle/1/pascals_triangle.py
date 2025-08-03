def rows(row_count):
    triangle=[]
    if row_count < 0:
        raise ValueError("number of rows is negative")
    else:
        if row_count > 0:
            if row_count == 1:
                triangle = [[1]]
            elif row_count == 2:
                triangle = rows(row_count-1)
                triangle.append([1,1])
            else:
                triangle = rows(row_count-1)
                last_row=[1]
                for i in range (0, len(triangle[-1])-1):
                    last_row.append(triangle[-1][i]+triangle[-1][i+1])
                last_row.append(1)
                triangle.append(last_row)
    return triangle
        
    
