class Clock:
    def __init__(self, hour, minute):
        self.minute=minute
        self.hour=0
        if self.minute >= 60 or self.minute <=-60:
            self.hour=self.minute//60
            self.minute=self.minute%60
        if self.minute < 0:
            self.hour=self.hour-1
            self.minute=60+self.minute
        print(self.hour, self.minute)
        self.hour=self.hour+hour
        if self.hour >= 24 or self.hour <=-24:
            self.hour=self.hour%24
        if self.hour < 0:
            self.hour=24+self.hour
        print(self.hour, self.minute)
          

    def __repr__(self):
        return 'Clock('+str(self.hour)+', '+str(self.minute)+')'

    def __str__(self):
        if self.minute < 10:
            str_minute='0'+str(self.minute)
        else:
            str_minute=str(self.minute)
        if self.hour < 10:
            str_hour='0'+str(self.hour)
        else:
            str_hour=str(self.hour)
        return str_hour+':'+str_minute

    def __eq__(self, other):
        return self.hour == other.hour and self.minute==other.minute

    def __add__(self, minutes):
        return Clock(self.hour, self.minute+minutes)

    def __sub__(self, minutes):
        return Clock(self.hour, self.minute-minutes)
