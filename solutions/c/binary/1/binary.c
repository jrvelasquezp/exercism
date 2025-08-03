#include "binary.h"

int convert(const char *input){
    int number=0;
    int i=0;
    while (*(input+i) != '\0'){
        if (*(input+i) == '1' && number != -1){
            number=2*number+1;
        }
        else if (*(input+i) == '0' && number != -1){
            number=2*number;
        }
        else{
            number=-1;
        }
        i++;
    }
    return number;
}
