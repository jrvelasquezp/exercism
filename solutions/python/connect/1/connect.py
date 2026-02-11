def adjacent_cells(cell,rows,cols):
  r_index=rows.index(cell[0])
  c_index=cols.index(cell[1])
  adjacent_list=[]
  #one above and one below the same row are adjacents
  if r_index-1>=0 and c_index+1<len(cols):
    adjacent_list.append((rows[r_index-1],cols[c_index+1]))
  if r_index-1>=0:
    adjacent_list.append((rows[r_index-1],cols[c_index]))
  if c_index-1>=0:
    adjacent_list.append((rows[r_index],cols[c_index-1]))
  if c_index+1<len(cols):
    adjacent_list.append((rows[r_index],cols[c_index+1]))
  if r_index+1<len(rows) and c_index-1>=0:
    adjacent_list.append((rows[r_index+1],cols[c_index-1]))
  if r_index+1<len(rows):
    adjacent_list.append((rows[r_index+1],cols[c_index]))
  return adjacent_list

def group_cells(game):
  row=0
  col=0
  xs=[]
  os=[]
  es=[]
  for ch in game:
    if ch=='\n':
      row=row+1
      col=0
    elif ch=='X':
      xs.append((row,col))
      col=col+1
    elif ch=='O':
      os.append((row,col))
      col=col+1
    elif ch=='.':
      es.append((row,col))
      col=col+1
  return xs,os,row,col-1

def check_x_wins(xs,rows,cols):
  #find if there is a point on the beginning column
  win=False
  path=[]
  for x in xs:
    if x[1]==0:
      path.append(x)
  if path != []:
    for p in path:
      adj=adjacent_cells(p,rows,cols)
      for x in adj:
        if x in xs and not x in path:
          path.append(x)
        else:
          continue
  #find if there is a point on the final column
  for x in path:
    if x[1]==len(cols)-1:
      win=True
      break
  return win

def check_o_wins(os,rows,cols):
  #find if there is a point on the beginning column
  win=False
  path=[]
  for x in os:
    if x[0]==0:
      path.append(x)
  if path != []:
    for p in path:
      adj=adjacent_cells(p,rows,cols)
      for x in adj:
        if x in os and not x in path:
          path.append(x)
        else:
          continue
  #find if there is a point on the final column
  for x in path:
    if x[0]==len(rows)-1:
      win=True
      break
  return win
    
class ConnectGame:
    def __init__(self, board):
        self.board=board

    def get_winner(self):
        if self.board=="X" or self.board=="O":
            return self.board
        elif not "X" in self.board or not "O" in self.board:
            return ''
        else:
            game=self.board.replace(' ','')
            xs,os,row,col=group_cells(game)
            rows=list(range(row+1))
            cols=list(range(col+1))
            if check_x_wins(xs,rows,cols):
                return 'X'
            elif check_o_wins(os,rows,cols):
                return 'O'
            else:
                return ''

