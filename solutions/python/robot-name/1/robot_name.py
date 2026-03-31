import random

class Robot:
    def __init__(self):
        self.name = self.generateName()

    def generateName(self):
        random.seed()
        number=random.randrange(0,1000)
        chr1=random.randrange(65,91)
        chr2=random.randrange(65,91)
        if number< 100:
            return chr(chr1)+chr(chr2)+'0'+str(number)
        else:
            return chr(chr1)+chr(chr2)+str(number)

    def reset(self):
        self.name=self.generateName()
