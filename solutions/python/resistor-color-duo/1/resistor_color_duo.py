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


    