class Luhn:
    def __init__(self, card_num):
        self.card_num=card_num

    def valid(self):
        valid_luhn = False
        self.card_num=self.card_num.replace(" ","")
        if len(self.card_num)>1 and self.card_num.isdigit():
            acc=0
            for i in range(len(self.card_num)):
                element=int(self.card_num[-i-1])
                if i%2 != 0:
                    element=2 * element
                    if element>9:
                        element=element-9
                acc=acc + element
            if acc % 10 == 0:
                valid_luhn=True
        return valid_luhn
