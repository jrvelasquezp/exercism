def encode(numbers):
    coded=[]
    for number in numbers:
        if number>268435455:
            print(number//268435456,number%268435456,28)
            c1=128+number//268435456
            number=number%268435456
            coded.append(c1)
            if number==0:
                coded.append(128)
                coded.append(128)
                coded.append(128)
            print(coded,number)
        if number>2097151:
            print(number//2097152,number%2097152,21)
            c1=128+number//2097152
            number=number%2097152
            coded.append(c1)
            if number==0:
                coded.append(128)
                coded.append(128)
            print(coded,number)
        if number>16383:    
            print(number//16384,number%16384,14)
            c1=128+number//16384
            number=number%16384
            coded.append(c1)
            if number==0:
                coded.append(128)
            print(coded,number)
        if number>127:
            print(number//128,number%128,7)
            c1=128+number//128
            number=number%128
            coded.append(c1)
            print(coded,number)
        coded.append(number)
        print(coded,number)
    return coded

def decode(bytes):
    if(bytes[len(bytes)-1]>127):
        raise ValueError("incomplete sequence")
    else:
        decoded=[]
        decoded_number=0
        for number in bytes:
          if number < 128:
            decoded_number=decoded_number+number
            decoded.append(decoded_number)
            decoded_number=0
          else:
            decoded_number=decoded_number*128
            decoded_number=decoded_number+128*(number-128)
        return decoded
