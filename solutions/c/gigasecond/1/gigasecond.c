#include "gigasecond.h"
#include <time.h>

void gigasecond(time_t input, char *output, size_t size){
    struct tm *datetime;
    char buffer[size];
    time_t after=input+1000000000;
    datetime=gmtime(&after);
    strftime(buffer,80,"%Y-%m-%d %H:%M:%S", datetime);
    sprintf(output,"%s",buffer);  
}
