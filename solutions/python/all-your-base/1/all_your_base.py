def rebase(input_base, digits, output_base):
    if input_base < 2:
        raise ValueError("input base must be >= 2")
    elif output_base < 2:
        raise ValueError("output base must be >= 2")
    elif any(x >= input_base for x in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")
    elif any(x < 0 for x in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")
    else:
        #number from list on input base
        acc=0
        for x in range(len(digits)):
            acc=acc+int(digits[x])*pow(input_base,len(digits)-x-1)
        print("acc is ",acc)
        #list from number in output base
        out_list=[]
        while acc >= output_base:
            out_list.append(acc % output_base)
            acc=acc // output_base
        out_list.append(acc % output_base)    
        if acc == output_base:
            out_list.append(acc // output_base)
        print(out_list)
        reversed_list = out_list[::-1]
        return reversed_list
