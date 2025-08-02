import calendar
import datetime
from datetime import date

# subclassing the built-in ValueError to create MeetupDayException
class MeetupDayException(ValueError):
    def __init__(self,message):
        self.message=message

def meetup(year, month, week, day_of_week):
    days_dict={'Monday':0,'Tuesday':1,'Wednesday':2,'Thursday':3,'Friday':4,'Saturday':5,'Sunday':6}
    week_dict={'first':0,'second':1,'third':2,'fourth':3,'fifth':4,'last':-1,'teenth':0}
    day=[]
    final_date=None
    print(calendar.month(year,month))
    for i in range (1,calendar.monthrange(year,month)[1]+1):
        if week=='teenth' and i>=13 and i<=19:
            if calendar.weekday(year, month, i)==days_dict[day_of_week]:
                final_date=date(year,month,i)

        elif calendar.weekday(year, month, i)==days_dict[day_of_week]:
            day.append(i)
    
    if week == 'fifth' and len(day)<5:
        raise MeetupDayException("That day does not exist.")
    elif final_date == None:
        final_date=date(year,month,day[week_dict[week]])

    return final_date

