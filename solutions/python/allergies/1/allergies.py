import math

class Allergies:

    def __init__(self, score):
        self.allergenes=['eggs','peanuts','shellfish','strawberries','tomatoes','chocolate','pollen','cats']
        if score < 256:
            self.score=score
        else:
            self.score=score - pow(2,int(math.log2(score)))
              

    def allergic_to(self, item):
        if item in self.lst:
            return True
        else:
            return False

    @property
    def lst(self):
        allergen_lst=[]
        allergen_score=128
        total_score=self.score
        for i in range(7):
            if int(total_score / allergen_score) == 1:
                total_score=total_score-allergen_score
                allergen_lst.append(self.allergenes[-(i+1)])
            allergen_score=allergen_score/2
        if total_score==1:
            allergen_lst.append(self.allergenes[0])
        return allergen_lst
