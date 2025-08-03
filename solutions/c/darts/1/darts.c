#include "darts.h"

uint8_t score(coordinate_t pos){
    uint8_t value=0;
    if (pos.x*pos.x + pos.y*pos.y<=1){
        value=10;
    }
    else if (pos.x*pos.x + pos.y*pos.y<=25){
        value=5;
    }
    else if (pos.x*pos.x + pos.y*pos.y<=100){
        value=1;
    }
    return value;
}
