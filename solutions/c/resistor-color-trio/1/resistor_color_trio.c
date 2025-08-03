#include "resistor_color_trio.h"

resistor_value_t color_code(resistor_band_t *resist){
    resistor_value_t res;
    resistor_band_t res_arr[3]={BLACK, BLACK, BLACK};
    unsigned long i;
    res_arr[0]=*resist;
    resist++;
    res_arr[1]=*resist;
    resist++;
    res_arr[2]=*resist;
    resist++;
    if(res_arr[2]<2){
        res.unit=OHMS;
    }
    else if(res_arr[2]<5){
        res.unit=KILOOHMS;
    }
    else if(res_arr[2]<8){
        res.unit=MEGAOHMS;
    }    
    else if(res_arr[2]<=9){
        res.unit=GIGAOHMS;
    }
    res.value=10*res_arr[0]+res_arr[1];
    for(i=0;i<res_arr[2];i++){
        res.value=res.value*10;
    }
    if(res.unit==KILOOHMS){
        res.value=res.value/1000;
    }
    else if(res.unit==MEGAOHMS){
        res.value=res.value/1000000;    
    }
    else if(res.unit==GIGAOHMS){
        res.value=res.value/1000000000;    
    }
    return res;
}
