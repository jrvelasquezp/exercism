alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

def rotate(text, key):
    if key == 0 or key % 26 == 0:
        return text
    else:
        newtext = ""
        for char in text:
            if char in alphabet:
                if ord(char.lower())+key > ord('z'):
                    newchr=chr(ord(char)+key-26)
                else:
                    newchr=chr(ord(char)+key)
                newtext=newtext+newchr
                    
            else:
                newtext=newtext+char
        return newtext

