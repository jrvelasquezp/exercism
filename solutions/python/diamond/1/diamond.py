alphabet='ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def rows(letter):
    diamond=[]
    size=ord(letter)-64
    length=2*size-1

    for rows in range(0,length):
        if rows <= length//2:
            character=alphabet[rows]
        else:
            character=alphabet[2*(length//2)-rows]
        text=''
        for i in range(0,length):
            if i==ord(character)-65+length//2 or i==length//2-ord(character)+65:
                text=text+character
            else:
                text=text+' '
        diamond.append(text)

    return diamond
