def check_living_neighbors(matrix, row, col):
    neighbors=0
    for i in range(row-1,row+2):
        for j in range(col-1,col+2):
            if j>=0 and i>=0 and i<len(matrix) and j<len(matrix):
                if i==row and j==col:
                    continue
                else:
                    neighbors=neighbors+matrix[i][j]
    return neighbors
            


def tick(matrix):
    # Empty matrix
    if matrix == []:
        return matrix
    else:
        n=len(matrix)
        expected=[[0] * n for row in range(0,n)]
        for i in range(0, len(matrix)):
            for j in range(0, len(matrix)): 
                if check_living_neighbors(matrix,i,j) == 3:
                    expected[i][j]=1
                elif check_living_neighbors(matrix,i,j) == 2 and matrix[i][j]==1:
                    expected[i][j]=1
        return expected