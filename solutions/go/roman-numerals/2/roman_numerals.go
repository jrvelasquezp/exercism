package romannumerals
import "errors"
import "strconv"
import "fmt"
import "strings"

func PrintBaseRoman(input int, position int) (string) {
    char := ""
    roman := ""
    switch position {
        case 1:
    		char="I"
    	case 2:
    		char="X"
        case 3:
    		char="C"
        case 4:
    		char="M"
    }
	for i:=0;i<input;i++ {
        roman=roman+char;
    }
	return roman;
}

func ToRomanNumeral(input int) (string, error) {
	if input > 0 && input < 4000 {
        num_rune:=[]rune(strconv.Itoa(input))
        romun:=""
        for i := 0; i < len(num_rune) ; i++{
            romun=romun+PrintBaseRoman(int(num_rune[i]-'0'),len(num_rune)-i)
        }
    	romun=strings.Replace(romun,"IIIIIIIII","IX",1)
        romun=strings.Replace(romun,"IIIII","V",1)
        romun=strings.Replace(romun,"IIII","IV",1)
    	romun=strings.Replace(romun,"XXXXXXXXX","XC",1)
        romun=strings.Replace(romun,"XXXXX","L",1)
        romun=strings.Replace(romun,"XXXX","XL",1)
    	romun=strings.Replace(romun,"CCCCCCCCC","CM",1)
        romun=strings.Replace(romun,"CCCCC","D",1)
        romun=strings.Replace(romun,"CCCC","CD",1)
        fmt.Println(romun)
        return romun, nil
    } else {
    	return "as",errors.New("number out of range")
    }
}
