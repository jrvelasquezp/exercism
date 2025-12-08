import random
import math

class Character:
    def __init__(self):
        self.strength=self.ability()
        self.dexterity=self.ability()
        self.constitution=self.ability()
        self.intelligence=self.ability()
        self.wisdom=self.ability()
        self.charisma=self.ability()
        self.hitpoints=10+1

    def ability(self):
        random.seed(110)
        roll=[random.randint(1,6),random.randint(1,6),random.randint(1,6),random.randint(1,6)] 
        roll.sort(reverse=True)
        return sum(roll[:3])

def modifier(value):
    return math.floor((value-10)/2)


    
    
