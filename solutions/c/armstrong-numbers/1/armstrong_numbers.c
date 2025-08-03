#include "armstrong_numbers.h"
#include <math.h>

bool is_armstrong_number(int candidate){
    int c=1,d=0;
    int sum=0;
    int count=0;
    int digits=0;
    c=candidate;
    while(c!=0)
    {
        c=c/10;
        count++;
    }
    if (count==0){
        count=1;
    }
    digits=count;
    count=0;
    c=candidate;
    while(c!=0)
    {
        d=c%10;
        d=pow(d,digits);
        sum=sum+d;
        c=c/10;
        count++;
    }
    if (sum==candidate)
    {
        return true;    
    }
    else
    {
        return false;
    }
}
