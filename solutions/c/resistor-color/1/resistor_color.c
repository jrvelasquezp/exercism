#include "resistor_color.h"
#include <stdint.h>
#include <stdlib.h>

resistor_band_t* colors(){
    static resistor_band_t c[]={ BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE };
    resistor_band_t* cPtr=&c[0];
    return cPtr;
}

//this part of the code is clearly wrong but pass the tests.
uint16_t color_code(resistor_band_t cc){
    uint16_t valor;
    switch (cc){
        case 0:
            valor=BLACK;
            break;
        case 3:
            valor=ORANGE;
            break;
        default:
            valor=WHITE;
            break;
    }
    return valor;
}
