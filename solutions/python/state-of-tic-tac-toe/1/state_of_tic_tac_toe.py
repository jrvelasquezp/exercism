def count(board, ch):
    counter=0
    for row in board:
        for column in row:
            counter+=column.count(ch)
    print(counter)
    return counter

def win_row(board, ch):
    win=False
    for row in board:
        if row==ch * 3:
            win=True
            break
    return win

def win_column(board, ch):
    win=False
    board_list=[]
    for row in board:
        board_list.append(list(row))
    for i in range(0,3):
        if [board_list[n][i] for n in range(0,3)]==[ch]*3:
             win=True
             break
    return win

def win_falling_diagonal(board, ch):
    win=False
    board_list=[]
    for row in board:
        board_list.append(list(row))
    return [board_list[n][n] for n in range(0,3)]==[ch]*3

def win_rising_diagonal(board, ch):
    win=False
    board_list=[]
    for row in board:
        board_list.append(list(row))
    return [board_list[n][2-n] for n in range(0,3)]==[ch]*3

def win(board, ch):
    return win_row(board, ch) or win_column(board, ch) or win_falling_diagonal(board, ch) or win_rising_diagonal(board, ch)
            
def gamestate(board):
    #Valid or invalid boards
    if count(board,"X") < count(board,"O"):
        raise ValueError("Wrong turn order: O started")
    elif count(board,"X") > count(board,"O")+1:
        raise ValueError("Wrong turn order: X went twice")
    #check if both players win
    elif win(board,"X") and win(board,"O"):
        raise ValueError("Impossible board: game should have ended after the game was won")
    #If board is valid, check winning conditions
    else:        
        if win(board, "X") or win(board, "O"):
            return "win"
        elif count(board,"X") + count(board,"O") == 9:
            return "draw"
        else:
            return "ongoing"

    
    
