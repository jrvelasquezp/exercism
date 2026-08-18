import math

class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real=real
        self.imaginary=imaginary

    def __eq__(self, other):
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self, other):
        if isinstance(self, int):
            return ComplexNumber(self + other.real, other.imaginary)
        elif isinstance(other, int):
            return ComplexNumber(other + self.real, self.imaginary)
        else:
            return ComplexNumber(self.real + other.real, self.imaginary+other.imaginary)

    def __radd__(self, other):
        return self.__add__(other)

    def __mul__(self, other):
        if isinstance(self, int):
            return ComplexNumber(self * other.real, self * other.imaginary)
        elif isinstance(other, int):
            return ComplexNumber(other * self.real, other * self.imaginary)
        else:
            a = self.real * other.real - self.imaginary * other.imaginary 
            b = self.imaginary * other.real + self.real * other.imaginary
            ans = ComplexNumber(a,b)
            return ans

    def __rmul__(self, other):
        return self.__mul__(other)

    def __sub__(self, other):
        if isinstance(self, int):
            return ComplexNumber(self - other.real, other.imaginary)
        elif isinstance(other, int):
            return ComplexNumber(self.real - other, self.imaginary)
        else:
            return ComplexNumber(self.real - other.real, self.imaginary - other.imaginary)

    def __rsub__(self, other):
        if isinstance(other, int):
            return ComplexNumber(
                other - self.real,
                -self.imaginary
            )
        else:
            pass

    def __truediv__(self, other):
        if isinstance(self, int):
            pass
        elif isinstance(other, int):
            return ComplexNumber(self.real / other, self.imaginary/other)
        else:
            norm = other.real * other.real + other.imaginary * other.imaginary
            a = self.real * other.real + self.imaginary * other.imaginary
            b = self.imaginary * other.real - self.real * other.imaginary
            a = a / norm
            b = b / norm
            return ComplexNumber(a,b)
            
    def __rtruediv__(self, other):
        if isinstance(other, int):
            imul=self.inverse()
            print(imul)
            return imul.__mul__(other)
        else:
            pass

    def __abs__(self):
        if self.imaginary == 0:
            return math.sqrt(self.real * self.real)
        elif self.real == 0:
            return math.sqrt(self.imaginary * self.imaginary)
        else:
            return math.sqrt(self.real*self.real + self.imaginary * self.imaginary)

    def conjugate(self):
        conj = ComplexNumber(self.real, self.imaginary * -1)
        return conj

    def exp(self):
        a = ComplexNumber(math.exp(self.real),0)
        b = ComplexNumber(math.cos(self.imaginary), math.sin(self.imaginary))
        return a.__mul__(b)

    def inverse(self):
        norm = self.real * self.real + self.imaginary * self.imaginary
        return ComplexNumber(self.real / norm, -self.imaginary/norm)
