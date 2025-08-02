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
    if len(colors) == 5:
        return int(resistor[:3])
    else:
        return int(resistor[:3])
        
def zeros(color):
    zero=''
    for i in range(0,color_code(color)):
        zero=zero+'0'

    return zero

def label(colors):
    if len(colors) == 5:
        resistor=str(value(colors[0:3]))+zeros(colors[3])
    else:
        resistor=str(value(colors[0:2]))+zeros(colors[2])
    res_value=''
    print (resistor)
    if float(resistor)/1000000000 >= 1:
        res_value=str(float(resistor)/1000000000) + ' gigaohms'
    elif float(resistor)/1000000 >= 1:
        res_value=str(float(resistor)/1000000) + ' megaohms'
    elif float(resistor)/1000 >= 1:
        res_value=str(float(resistor)/1000) + ' kiloohms'
    else:
        res_value=str(float(resistor)) + ' ohms'
    return res_value.replace('.0','')

def tolerance(color):
    tolerance_dict={
        "grey"  :"0.05%",
        "violet":"0.1%",
        "blue"  :"0.25%",
        "green" :"0.5%",
        "brown" :"1%",
        "red"   :"2%",
        "gold"  :"5%",
        "silver":"10%"
    }
    return tolerance_dict[color]

def resistor_label(colors):
    if colors==["black"]:
        return "0 ohms"
    else:
        return label(colors)+' ±'+tolerance(colors[-1])
