#include "square_root.h"
//square root using Heron's method
uint16_t square_root(uint16_t n){
    uint16_t x=0,y=0;
    int i=0;
    if (n==1){
        x=1;    
    }
    else{
        x=n/2;
        for(i=0;i<9;i++){
            y=n/x;
            x=x+y;
            x=x/2;    
        }
    }
    return x;
}
