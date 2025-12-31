#take an ascii drawing and translate it to a tuple with coordinates
def get_coordinates(region):
  row=0;
  col=0;
  coords=[]
  for r in region:
    for c in r:
      coords.append((row,col,c))
      col=col+1
    row=row+1
    col=0
  return coords

#take all the corners and store on a different array
def get_all_corners(grid):
  corners=[]
  for p in grid:
    if p[2]=='+':
      corners.append(p)
  return corners

#check if a segment is valid
def is_valid_h_part_segment(s):
  valid=True if (s[2]=='+' or s[2]=='-') else False
  return valid

def is_valid_v_part_segment(s):
  valid=True if (s[2]=='+' or s[2]=='|') else False
  return valid

def is_valid_h_segment(segment):
  valid=True
  for s in segment:
    valid=valid and is_valid_h_part_segment(s)
  return valid

def is_valid_v_segment(segment):
  valid=True
  for s in segment:
    #print(s)
    valid=valid and is_valid_v_part_segment(s)
  return valid


#print the region
def print_region(region):
  for row in text_list:
    print(row)

#check if a rectangle is valid
def is_valid_rectangle(p1,p2,p3,p4,region):
  if abs(p1[0]-p2[0])==1 and abs(p2[1]-p3[1])==1 and abs(p3[0]-p4[0])==1 and abs(p4[1]-p1[1])==1:
    return True
  else:
    line_1_valid=is_valid_h_segment(get_segment(p1,p2,region))
    line_2_valid=is_valid_v_segment(get_segment(p2,p4,region))
    line_3_valid=is_valid_h_segment(get_segment(p3,p4,region))
    line_4_valid=is_valid_v_segment(get_segment(p1,p3,region))
    all_lines_valid=line_1_valid and line_2_valid and line_3_valid and line_4_valid
    valid_length=abs(p1[0]-p2[0])==abs(p3[0]-p4[0]) and abs(p1[1]-p3[1])==abs(p2[1]-p4[1])
    return all_lines_valid and valid_length

def get_segment(p1,p2,region):
  segment=[]
  if p1[0]==p2[0]:
    for p in region:
      if p[0]==p1[0] and p[1]>=p1[1] and p[1]<=p2[1]:
        segment.append(p)
    return segment
  elif p1[1]==p2[1]:
    for p in region:
      if p[1]==p1[1] and p[0]>=p1[0] and p[0]<=p2[0]:
        segment.append(p)
    return segment
  else:
    pass

#count rectangles
def rectangles(strings):
  if strings == []:
    return 0
  elif strings==[""]:
    return 0
  elif strings==[" "]:
    return 0
  else:
    region=get_coordinates(strings)
    corners=get_all_corners(region)
    rows=region[-1][0]
    cols=region[-1][1]
    rectangle_counter=0
    for i in range(0,rows+1):
      for j in range(0,cols+1):
        for k in range(i+1,rows+1):
          for l in range(j+1,cols+1):
            p1=(i,j,'+')
            p2=(i,l,'+')
            p3=(k,j,'+')
            p4=(k,l,'+')
            if p1 in corners and p2 in corners and p3 in corners and p4 in corners:
              if is_valid_rectangle(p1,p2,p3,p4,region):
                rectangle_counter=rectangle_counter + 1
    return rectangle_counter
            
