class HighScores:
    def __init__(self, scores):
        self.scores=scores
    def latest(self):
        return self.scores[-1]
    def personal_best(self):
        return max(self.scores)
    def personal_top_three(self):
        answer=self.scores.copy()
        if len(answer)<=3:
            answer.sort(reverse=True)
            return answer
        else:
            answer.sort(reverse=True)
            return answer[:3]
            
