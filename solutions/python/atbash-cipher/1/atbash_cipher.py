alphabet = 'abcdefghijklmnopqrstuvwxyz'

def encode(plain_text):
    input=plain_text.replace(' ','').replace(',','').replace('.','').lower()
    output=''
    cnt=0
    for i in input:
        if i in alphabet:
            output=output+chr(219-ord(i))
        else:
            output=output+i
        cnt=cnt+1
        if cnt == 5:
            output=output+' '
            cnt=0
    return output.rstrip()


def decode(ciphered_text):
    #remove all spaces
    input=ciphered_text.replace(' ','').lower()
    output=''
    for i in input:
        if i in alphabet:
            output=output+chr(219-ord(i))
        else:
            output=output+i
        
    return output
            
