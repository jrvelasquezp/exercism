package reverse

func Reverse(input string) string {
    runes:= []rune(input)
    length:=len(runes)
    text:=""
	for i := 0; i < length; i++ {
		text = text + (string(runes[length-i-1]))
	}
    return text
}
