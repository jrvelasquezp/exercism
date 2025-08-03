#include "resistor_color_duo.h"

uint16_t color_code(resistor_band_t *resist){
    uint16_t res;
    resistor_band_t res_arr[2]={BLACK, BLACK};
    res_arr[0]=*resist;
    resist++;
    res_arr[1]=*resist;
    resist++;
    res=10*res_arr[0]+res_arr[1];
    return res;
}
