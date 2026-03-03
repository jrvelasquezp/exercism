package resistorcolorduo

func Colors() []string {
	colors:=[] string{"black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"}
    return colors
}

func ColorCode(color string) int {
	for i:=0 ; i < 10 ; i++ {
        if Colors()[i]==color {
            return i
        } 
    }
    return -1
}

// Value should return the resistance value of a resistor with a given colors.
func Value(colors []string) int {
	return 10*ColorCode(colors[0])+ColorCode(colors[1])
}
