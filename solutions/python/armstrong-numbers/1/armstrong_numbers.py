def is_armstrong_number(number):
    #number to string
    num_str=str(number)
    digit_sum=0
    pwr=len(num_str)
    #armstrong checker
    for char in num_str:
        digit_sum=digit_sum+int(char)**pwr
    return digit_sum==number