def line_up(name, number):
    if number%10 == 1 and number%100 != 11:
        return name + ", you are the " + str(number)+"st customer we serve today. Thank you!"
    elif number%10 == 2 and number%100 != 12:
        return name + ", you are the " + str(number)+"nd customer we serve today. Thank you!"
    elif number%10 == 3 and number%100 != 13:
        return name + ", you are the " + str(number)+"rd customer we serve today. Thank you!"
    else:
        return name + ", you are the " + str(number)+"th customer we serve today. Thank you!"
