#include "grains.h"

uint64_t square(uint8_t index){
    if (index == 1){
        return 1;
    }
    else {
        return (2*square(index-1));
    }
}

uint64_t total(){
    int i=0;
    uint64_t tot=0;
    for(i=0;i<64;i++){
        if (i==0){
            tot=square(i+1);
        }
        else{
            tot=tot+square(i+1);
        }
    }
    return tot;
}
