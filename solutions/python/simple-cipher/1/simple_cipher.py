import random

class Cipher:
    def __init__(self, key=None):
        if key is None:
            self.key=""
            for i in range(0,100):
                self.key=self.key+chr(random.randrange(97,122))
        else:
            self.key=key

    def encode(self, text):
        key=self.key
        encoded=""
        j=0
        for i in range(0,len(text)):
            shift=ord(key[j])-97
            if ord(text[i])+shift>122:
                encoded=encoded+chr(ord(text[i])+shift-26)
            else:
                encoded=encoded+chr(ord(text[i])+shift)
            j=j+1
            if j==len(key):
                j=0
        return encoded

    def decode(self, text):
        key=self.key
        decoded=""
        j=0
        for i in range(0,len(text)):
            shift=ord(key[j])-97
            if ord(text[i])-shift<97:
                decoded=decoded+chr(ord(text[i])-shift+26)
            else:
                decoded=decoded+chr(ord(text[i])-shift)
        
            j=j+1
            if j==len(key):
                j=0
        return decoded
