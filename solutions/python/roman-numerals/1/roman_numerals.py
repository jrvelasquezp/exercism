def roman(number):
    roman_basic=['I','X','C','M']
    roman_pattern=["CCCCCCCCC","CCCCC","CCCC","XXXXXXXXX","XXXXX","XXXX","IIIIIIIII","IIIII","IIII"]
    roman_special=["CM","D","CD","XC","L","XL","IX","V","IV"]
    number_txt=str(number)
    roman=""
    dimension=len(number_txt)
    for j in range(dimension):
        for i in range(int(number_txt[j])):
            roman=roman+roman_basic[dimension-1-j]
    for i in range(9):
        roman=roman.replace(roman_pattern[i],roman_special[i])

    return roman

