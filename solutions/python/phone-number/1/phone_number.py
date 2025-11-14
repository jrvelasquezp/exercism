class PhoneNumber:
    def __init__(self, number):
        self.number = self.cleanNumber(number)
        self.area_code = self.number[:3]
        self.phone =self.number[3:]

    def cleanNumber(self,number):
        #clean unnecessary stuff
        b = "-.+ ()"
        for char in b:
            number = number.replace(char, "")
        if len(number) < 10:
            raise ValueError("must not be fewer than 10 digits")
        elif len(number) == 11 and number[0] != '1':
            raise ValueError("11 digits must start with 1")
        elif len(number) > 11:
            raise ValueError("must not be greater than 11 digits")
        else:
            if len(number) == 11:
                number=number[1:]
            
            if number[0] == '0':
                raise ValueError("area code cannot start with zero")
            elif number[0] == '1':
                raise ValueError("area code cannot start with one")
            elif number[3] == '0':
                raise ValueError("exchange code cannot start with zero")
            elif number[3] == '1':
                raise ValueError("exchange code cannot start with one")
            elif number.isalnum() and not number.isdigit():
                raise ValueError("letters not permitted")
            elif number.isprintable() and not number.isdigit():
                raise ValueError("punctuations not permitted")
            else:
                return number
    
    def pretty(self):
        return '('+self.area_code+')-'+self.phone[:3]+'-'+self.phone[3:]
