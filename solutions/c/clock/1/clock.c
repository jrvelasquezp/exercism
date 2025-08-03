#include "clock.h"

int time_in_minutes(int hour, int minute){
    int time=60*hour+minute;
    if (abs(time)>1440)
        time=time%1440;
    if (time<0)
        time=1440+time;
    return time;
}

clock_t clock_create(int hour, int minute){
    clock_t ck;
    //create clock on the string
    sprintf(ck.text,"00:00");
    //calculate right amount of hours and minutes
    minute=time_in_minutes(hour,minute);
    hour=(minute/60)%24;
    minute=minute%60;
    //parse clock
    if(hour>=10)
        ck.text[0]=hour/10+48;
    ck.text[1]=hour%10+48;
    if(minute>=10)
        ck.text[3]=minute/10+48;
    ck.text[4]=minute%10+48;
    return ck;
}

clock_t clock_add(clock_t clock, int minute_add){
    int hour=10*(clock.text[0]-48)+(clock.text[1]-48);
    int minute=10*(clock.text[3]-48)+(clock.text[4]-48);
    minute=time_in_minutes(hour,minute)+minute_add;
    hour=(minute/60)%24;
    minute=minute%60;
    clock=clock_create(hour,minute);
    return clock;
}

clock_t clock_subtract(clock_t clock, int minute_subtract){
    int hour=10*(clock.text[0]-48)+(clock.text[1]-48);
    int minute=10*(clock.text[3]-48)+(clock.text[4]-48);
    minute=time_in_minutes(hour,minute)-minute_subtract;
    hour=(minute/60)%24;
    minute=minute%60;
    clock=clock_create(hour,minute);
    return clock;
}

bool clock_is_equal(clock_t a, clock_t b){
    int hour_a=10*(a.text[0]-48)+(a.text[1]-48);
    int minute_a=10*(a.text[3]-48)+(a.text[4]-48);
    int hour_b=10*(b.text[0]-48)+(b.text[1]-48);
    int minute_b=10*(b.text[3]-48)+(b.text[4]-48);
    return (hour_a==hour_b && minute_a==minute_b);
}
