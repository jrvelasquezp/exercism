def color_code(color):
    return colors().index(color)

def colors():
    color_list=[
        "black",
        "brown",
        "red",
        "orange",
        "yellow",
        "green",
        "blue",
        "violet",
        "grey",
        "white",
        ]
    return color_list

def value(colors):
    resistor=""
    for color in colors:
        resistor=resistor+str(color_code(color))

    return int(resistor[:2])

def zeros(color):
    zero=''
    for i in range(0,color_code(color)):
        zero=zero+'0'

    return zero

def label(colors):
    resistor=str(value(colors[0:2]))+zeros(colors[2])
    res_value=''
    res_mult=''
    res_zeros=resistor.count('0')
    if res_zeros < 3:
        res_mult='ohms'
        res_value=resistor
    elif res_zeros < 6:
        res_mult='kiloohms'
        res_value=resistor[0:len(resistor)-3]
    elif res_zeros < 9:
        res_mult='megaohms'
        res_value=resistor[0:len(resistor)-6]
    else:
        res_mult='gigaohms'
        res_value=resistor[0:len(resistor)-9]
    return res_value+' '+res_mult
    


