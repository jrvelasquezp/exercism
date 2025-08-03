ocr_numbers=[
                [" _ ", "| |", "|_|", "   "],
                ["   ", "  |", "  |", "   "],
                [" _ ", " _|", "|_ ", "   "],
                [" _ ", " _|", " _|", "   "],
                ["   ", "|_|", "  |", "   "],
                [" _ ", "|_ ", " _|", "   "],
                [" _ ", "|_ ", "|_|", "   "],
                [" _ ", "  |", "  |", "   "],
                [" _ ", "|_|", "|_|", "   "],
                [" _ ", "|_|", " _|", "   "]
            ]

def single_ocr_char(text,pos,line):
    number=[]
    for i in range(0,4):
        number.append(text[i+4*line][0+3*pos:3+3*pos])
    return number

def convert(input_grid):
    if len(input_grid)%4 != 0:
        raise ValueError("Number of input lines is not a multiple of four")
    if any([len(x)%3 != 0 for x in input_grid]):
        raise ValueError("Number of input columns is not a multiple of three")
    lines=len(input_grid)//4
    chars=len(input_grid[0])//3
    ans=''
    for j in range(0,lines):
        for i in range(0,chars):
            if j>0 and i==0:
                ans=ans+','
            char=single_ocr_char(input_grid,i,j)
            if char in ocr_numbers:
                ans=ans+str(ocr_numbers.index(char))
            else:
                ans=ans+'?'
    return ans