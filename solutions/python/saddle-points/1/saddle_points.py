def rows(matrix,index):
    return matrix[index]

def cols(matrix,index):
    ans=[]
    for row in matrix:
        ans.append(row[index])
    return ans

def saddle_points(matrix):
    if matrix==[]:
        return []
    else:
        #detect irregular matrix
        for i in range(1,len(matrix)):
            if len(matrix[i])!=len(matrix[i-1]):
                raise ValueError("irregular matrix")
        #make array of columns
        max_items=[]
        min_items=[]
        
        for i in range(0,len(matrix)):
            for j in range(0,len(matrix[0])):
                if matrix[i][j]==max(rows(matrix,i)):
                    max_items.append({'row': i+1,'column': j+1})
 
        for i in range(0,len(matrix[0])):
            for j in range(0,len(matrix)):
                if matrix[j][i]==min(cols(matrix,i)):
                    min_items.append({'row': j+1,'column': i+1})
        
        saddle=[]
        
        for a in max_items:
            for b in min_items:
                if a==b:
                    saddle.append(a)

        return saddle