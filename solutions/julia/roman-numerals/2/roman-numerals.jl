function roman_char(number,pos)
    numerals="IVXLCDM"
    roman=""
    if number==0
        roman=""
    elseif number==9
        roman=string(roman_char(1,pos),roman_char(1,pos+1))
    elseif number==5
        roman=numerals[(2+(2*(pos-1))):(2+(2*(pos-1)))]
    elseif number==1
        roman=numerals[1+(2*(pos-1)):1+(2*(pos-1))]
    elseif number==4
        roman=string(roman_char(1,pos),roman_char(number+1,pos))
    elseif number>5
        roman=string(roman_char(5,pos),roman_char(number-5,pos))
    else
        roman=string(roman_char(1,pos),roman_char(number-1,pos))
    end
end

function to_roman(number)
    if number > 0
        roman_number=string(number)
    else
        error("Error here")
        @show "Error here"
    end
    if(length(roman_number)==4)
        answer="$(roman_char(parse(Int,roman_number[1:1]),4))$(roman_char(parse(Int,roman_number[2:2]),3))$(roman_char(parse(Int,roman_number[3:3]),2))$(roman_char(parse(Int,roman_number[4:4]),1))"
        roman_number=answer
    elseif(length(roman_number)==3)
        answer="$(roman_char(parse(Int,roman_number[1:1]),3))$(roman_char(parse(Int,roman_number[2:2]),2))$(roman_char(parse(Int,roman_number[3:3]),1))"
        roman_number=answer
    elseif(length(roman_number)==2)   
        answer="$(roman_char(parse(Int,roman_number[1:1]),2))$(roman_char(parse(Int,roman_number[2:2]),1))"
        roman_number=answer
    else
        answer="$(roman_char(parse(Int,roman_number[1:1]),1))"
        roman_number=answer
    end
end
