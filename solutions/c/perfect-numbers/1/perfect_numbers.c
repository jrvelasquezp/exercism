#include "perfect_numbers.h"
#include <stdio.h>

kind classify_number(int number){
    int i=0;
    int aliquot=0;
    kind kind_of=PERFECT_NUMBER;
    if (number<1){
        kind_of=ERROR;
    }
    else if (number==1){
        kind_of=DEFICIENT_NUMBER;
    }
    else{
        //get the aliquot sum
        for(i=1;i<=number/2;i++){
            if (number % i == 0){
                aliquot=aliquot+i;
            }
        }
        if(number>aliquot){
            kind_of=DEFICIENT_NUMBER;
        }
        else if(number<aliquot){
            kind_of=ABUNDANT_NUMBER;
        }
    }
    return kind_of;
}
