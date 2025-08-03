# Score categories.
# Change the values as you see fit.
YACHT = 12
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 10
FOUR_OF_A_KIND = 11
LITTLE_STRAIGHT = 8
BIG_STRAIGHT = 9
CHOICE = 7


def score(dice, category):
    points=0
    if category == YACHT:
        if all(dice[0]==x for x in dice):
            points=50
    elif category == BIG_STRAIGHT:
        dice.sort()
        if dice[0] == 2 and dice[4] == 6 and len(list(set(dice))) == len(dice):
            points = 30
        else:
            points = 0
    elif category == LITTLE_STRAIGHT:
        dice.sort()
        if dice[0] == 1 and dice[4] == 5 and len(list(set(dice))) == len(dice):
            points = 30
        else:
            points = 0
    elif category == FOUR_OF_A_KIND:
        dice.sort()
        if len(list(set(dice)))<=2:
            if dice.count(list(set(dice))[0])>=4:
                points=4*list(set(dice))[0]
            elif dice.count(list(set(dice))[1])>=4:
                points=4*list(set(dice))[1]
            else:
                points=0
    elif category == FULL_HOUSE:
        dice.sort()
        if len(list(set(dice)))==2:
            if dice.count(list(set(dice))[0])==3:
                points=sum(dice)
            elif dice.count(list(set(dice))[1])==3:
                points=sum(dice)
            else:
                points=0
    elif category == ONES:
        points=dice.count(1)
    elif category == TWOS:
        points=2*dice.count(2)
    elif category == THREES:
        points=3*dice.count(3)
    elif category == FOURS:
        points=4*dice.count(4)
    elif category == FIVES:
        points=5*dice.count(5)
    elif category == SIXES:
        points=6*dice.count(6)
    elif category == CHOICE:
        points=sum(dice)
    return points
