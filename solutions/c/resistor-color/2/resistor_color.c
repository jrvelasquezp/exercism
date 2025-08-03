#include "resistor_color.h"
#include <stdint.h>
#include <stdlib.h>

resistor_band_t* colors(){
    static resistor_band_t c[]={ BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE };
    resistor_band_t* cPtr=&c[0];
    return cPtr;
}

//this part implements a switch case 
uint16_t color_code(resistor_band_t cc){
    uint16_t valor;
    switch (cc){
        case 0:
            valor=BLACK;
            break;
        case 1:
            valor=BROWN;
            break;
        case 2:
            valor=RED;
            break;
        case 3:
            valor=ORANGE;
            break;
        case 4:
            valor=YELLOW;
            break;
        case 5:
            valor=GREEN;
            break;
        case 6:
            valor=BLUE;
            break;
        case 7:
            valor=VIOLET;
            break;
        case 8:
            valor=GREY;
            break;
        case 9:
            valor=WHITE;
            break;
        default:
            valor=WHITE;
            break;
    }
    return valor;
}
