package romannumerals
import "errors"

func ToRomanNumeral(input int) (string, error) {
	if input > 0 && input < 4000 {
        roman:=""
        for i:=input; i>0 ; i-- {
            if i>=1000 {
                roman=roman+"M"
                i=i-999
            } else if i >= 900 {
                roman=roman+"C"
                i=i+101
            } else if i >= 500 {
                roman=roman+"D"
                i=i-499 
         	} else if i >= 400 {
                roman=roman+"C"
                i=i+101
            } else if i>=100 {
                roman=roman+"C"                
                i=i-99
            } else if i >= 90 {
                roman=roman+"X"
                i=i+11
            } else if i >= 50 {
                roman=roman+"L"
                i=i-49
            } else if i >= 40 {
                roman=roman+"X"
                i=i+11
            } else if i>=10 {
                roman=roman+"X"
                i=i-9
            } else if i == 9 {
                roman=roman+"I"
                i=i+2
            } else if i >= 5 {
                roman=roman+"V"
                i=i-4
            } else if i == 4 {
                roman=roman+"I"
                i=i+2
        	} else if i>0 {
                roman=roman+"I"
            }
        }
        return roman, nil
    } else {
    	return "as",errors.New("number out of range")
    }
}
