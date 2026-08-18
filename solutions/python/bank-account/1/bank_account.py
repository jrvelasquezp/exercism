class BankAccount:
    def __init__(self):
        self.balance = -1

    def get_balance(self):
        if self.balance < 0:
            raise ValueError('account not open')
        return self.balance

    def open(self):
        if self.balance >= 0:
            raise ValueError('account already open')
        self.balance = 0

    def deposit(self, amount):
        if self.balance < 0:
            raise ValueError('account not open')
        if amount < 0:
            raise ValueError('amount must be greater than 0')    
        self.balance = self.balance+amount

    def withdraw(self, amount):
        if self.balance < 0:
            raise ValueError('account not open')
        if amount > self.balance:
            raise ValueError('amount must be less than balance')
        if amount < 0:
            raise ValueError('amount must be greater than 0')
        self.balance = self.balance - amount

    def close(self):
        if self.balance < 0:
            raise ValueError('account not open')
        self.balance = -1
