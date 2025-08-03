def minisay(number):
    answer=""
    if number==0:
        answer="zero"
    elif number==1:
        answer="one"
    elif number==2:
        answer="two"        
    elif number==3:
        answer="three"
    elif number==4:
        answer="four"
    elif number==5:
        answer="five"
    elif number==6:
        answer="six"        
    elif number==7:
        answer="seven"
    elif number==8:
        answer="eight"
    elif number==9:
        answer="nine"
    elif number==10:
        answer="ten"
    elif number==11:
        answer="eleven"        
    elif number==12:
        answer="twelve"
    return answer
    
def say_decs(number):
    answer=""
    if number>19:
        if number>79 and number <90:
            answer="eighty"
            if number%10 != 0:
                answer=answer+"-"+minisay(number-80)
        elif number>19 and number <30:
            answer="twenty"
            if number%10 != 0:
                answer=answer+"-"+minisay(number-20)
        elif number>29 and number <40:
            answer="thirty"
            if number%10 != 0:
                answer=answer+"-"+minisay(number-30)
        elif number>39 and number <50:
            answer="forty"
            if number%10 != 0:
                answer=answer+"-"+minisay(number-40)
        elif number>49 and number <60:
            answer="fifty"
            if number%10 != 0:
                answer=answer+"-"+minisay(number-50)
        elif number>59:
            answer=minisay(number//10)+"ty"
            if number%10 != 0:
                answer=answer+"-"+minisay(number-10*(number//10))
        else:
            answer="not implemented yet"
    elif number>12:
        if number==13:
            answer="thirteen"
        elif number==15:
            answer="fifteen"
        elif number==18:
            answer="eighteen"
        else:
            answer=minisay(number-10)+"teen"
    else:
        answer=minisay(number)
    return answer


def say_hundreds(number):
    answer=""
    if number>=100:
        answer=minisay(number//100)+" hundred"
        if number%100 !=0:
            answer=answer+" "+say_decs(number-100*(number//100))
    else:
        answer=say_decs(number)
    return answer

def say_thousands(number):
    answer=""
    if number//1000 > 0:
        answer=say_hundreds(number//1000)+" thousand"
        if number%1000 !=0:
            answer=answer+" "+say_hundreds(number%1000)
    else:
        answer=say_hundreds(number%1000)
    return answer

def say_millions(number):
    answer=""
    if number//1_000_000 > 0:
        answer=say_hundreds(number//1_000_000)+" million"
        if number%1_000_000 !=0:
            answer=answer+" "+say_thousands(number%1_000_000)
    else:
        answer=say_thousands(number%1_000_000)
    return answer

def say_billions(number):
    answer=""
    if number//1_000_000_000 > 0:
        answer=say_hundreds(number//1_000_000_000)+" billion"
        if number%1_000_000_000 !=0:
            answer=answer+" "+say_millions(number%1_000_000_000)
    else:
        answer=say_millions(number%1_000_000_000)
    return answer
    
def say(number):
    if number<0 or number>999_999_999_999:
        raise ValueError("input out of range")
    else:
        return say_billions(number)
