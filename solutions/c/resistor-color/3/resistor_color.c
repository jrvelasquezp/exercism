#include "resistor_color.h"
#include <stdint.h>
#include <stdlib.h>

//this part implements a switch case 
uint16_t color_code(resistor_band_t cc){
    return (uint16_t) cc;
}

resistor_band_t* colors(){
    static resistor_band_t c[]={ BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE };
    resistor_band_t* cPtr=&c[0];
    return cPtr;
}
