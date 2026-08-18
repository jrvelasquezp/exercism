import math

class Rational:
    def __init__(self, numer, denom):
        self.numer = numer
        self.denom = denom
        self.reduce()

    def __eq__(self, other):
        return self.numer == other.numer and self.denom == other.denom

    def __repr__(self):
        return f'{self.numer}/{self.denom}'

    def __add__(self, other):
        return Rational(self.numer*other.denom+self.denom*other.numer,self.denom * other.denom)

    def __sub__(self, other):
        return Rational(self.numer*other.denom-self.denom*other.numer,self.denom * other.denom)

    def __mul__(self, other):
        return Rational(self.numer * other.numer, self.denom * other.denom)

    def __truediv__(self, other):
        return Rational(self.numer * other.denom, self.denom * other.numer)

    def __abs__(self):
        return Rational(int(math.fabs(self.numer)), int(math.fabs(self.denom)))

    def __pow__(self, power):
        if power >= 0:
            return Rational(self.numer ** power, self.denom ** power)
        else:
            return Rational(self.denom ** -power, self.numer ** -power)
        
    def __rpow__(self, base):
        if self.numer == 0 and self.denom == 1:
            return 1
        else:
            return math.pow(base,self.numer/self.denom)

    def reduce(self):
        if self.numer == 0:
            self.denom = 1

        if self.denom < 0:
            self.numer = -self.numer
            self.denom = -self.denom
        
        if self.numer > self.denom:
            big=self.numer
        else:
            big=self.denom
        for i in range(2,big+1):
            if self.denom % i == 0 and self.numer % i == 0:
                self.numer = int(self.numer / i)
                self.denom = int(self.denom / i)
                print(int(self.numer / i), int(self.denom / i))
        return self
