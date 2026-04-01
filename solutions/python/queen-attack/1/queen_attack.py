class Queen:
    def __init__(self, row, column):
        if row < 0:
            raise ValueError("row not positive")
        if column < 0:
            raise ValueError("column not positive")
        if row > 7:
            raise ValueError("row not on board")
        if column > 7:
            raise ValueError("column not on board")
        self.row=row
        self.column=column
        pass

    def can_attack(self, another_queen):
        attack=False
        if self.row==another_queen.row and self.column==another_queen.column:
            raise ValueError("Invalid queen position: both queens in the same square")
        else:
            if self.row==another_queen.row:
                attack=True
            elif self.column==another_queen.column:
                attack=True
            elif abs(self.row-another_queen.row)==abs(self.column-another_queen.column):
                attack=True
        return attack
