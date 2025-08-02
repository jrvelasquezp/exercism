function to_roman(number)
    if number > 0
        roman_number=string(number)
    else
        error("Error here")
        @show "Error here"
    end
    if(length(roman_number)==4)
        roman_number=replace(roman_number,'1'=>'M','2'=>"MM",'3'=>"MMM",count=1)
            roman_number=replace(roman_number,'1'=>'C','2'=>"CC",'3'=>"CCC",'4'=>"CD",'5'=>'D','6'=>"DC",'7'=>"DCC",'8'=>"DCCC",'9'=>"CM",'0'=>"",count=1)
                roman_number=replace(roman_number,'1'=>'X','2'=>"XX",'3'=>"XXX",'4'=>"XL",'5'=>'L','6'=>"LX",'7'=>"LXX",'8'=>"LXXX",'9'=>"XC",'0'=>"",count=1)
        roman_number=replace(roman_number,'1'=>'I','2'=>"II",'3'=>"III",'4'=>"IV",'5'=>'V','6'=>"VI",'7'=>"VII",'8'=>"VIII",'9'=>"IX",'0'=>"",count=1)
    elseif(length(roman_number)==3)
roman_number=replace(roman_number,'1'=>'C','2'=>"CC",'3'=>"CCC",'4'=>"CD",'5'=>'D','6'=>"DC",'7'=>"DCC",'8'=>"DCCC",'9'=>"CM",'0'=>"",count=1)
                roman_number=replace(roman_number,'1'=>'X','2'=>"XX",'3'=>"XXX",'4'=>"XL",'5'=>'L','6'=>"LX",'7'=>"LXX",'8'=>"LXXX",'9'=>"XC",'0'=>"",count=1)
        roman_number=replace(roman_number,'1'=>'I','2'=>"II",'3'=>"III",'4'=>"IV",'5'=>'V','6'=>"VI",'7'=>"VII",'8'=>"VIII",'9'=>"IX",'0'=>"",count=1)
    elseif(length(roman_number)==2)   
roman_number=replace(roman_number,'1'=>'X','2'=>"XX",'3'=>"XXX",'4'=>"XL",'5'=>'L','6'=>"LX",'7'=>"LXX",'8'=>"LXXX",'9'=>"XC",'0'=>"",count=1)
        roman_number=replace(roman_number,'1'=>'I','2'=>"II",'3'=>"III",'4'=>"IV",'5'=>'V','6'=>"VI",'7'=>"VII",'8'=>"VIII",'9'=>"IX",'0'=>"",count=1)
    else
        roman_number=replace(roman_number,'1'=>'I','2'=>"II",'3'=>"III",'4'=>"IV",'5'=>'V','6'=>"VI",'7'=>"VII",'8'=>"VIII",'9'=>"IX",'0'=>"",count=1)
    end
    @show roman_number
end
