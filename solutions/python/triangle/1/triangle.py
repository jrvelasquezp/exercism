def triangle_inequality(sides):
    t1=sides[0]+sides[1]>=sides[2]
    t2=sides[2]+sides[1]>=sides[0]
    t3=sides[0]+sides[2]>=sides[1]
    return t1 and t2 and t3

def equilateral(sides):
    return sides[0]==sides[1] and sides[1]==sides[2] and sides[0]>0


def isosceles(sides):
    return triangle_inequality(sides) and not scalene(sides)


def scalene(sides):
    return sides[0]!=sides[1] and sides[1]!=sides[2] and sides[0]!=sides[2] and triangle_inequality(sides)
