#include "all_your_base.h"

size_t rebase(int8_t *digits, int16_t input_base, int16_t output_base, size_t input_length){
    size_t out_array[10]={0,0,0,0,0,0,0,0,0,0};
    size_t accumulator=0;
    size_t invalid_digit=0;
    size_t i=0;
    if (input_base > 1 && output_base > 1){
        for (i=0;i<input_length;i++){
            if ((*(digits+i))<0 || (*(digits+i))>=input_base){
                i=input_length+2;
                accumulator=0;
                invalid_digit=1;
            }
            else{
                accumulator+=(*(digits+i))*pow(input_base,input_length-i-1);    
            }
        }
        i=0;    
        if (accumulator>0){
            while (accumulator >= (size_t)output_base){
                out_array[i]=accumulator%(size_t)output_base;
                accumulator=accumulator/(size_t)output_base;
                i++;
            }
            out_array[i]=accumulator%(size_t)output_base;
            i++;
            if (accumulator == (size_t)output_base){
                out_array[i]=accumulator/(size_t)output_base;
                i++;
            }
            out_array[9]=out_array[8];
            }
        else if (accumulator==0){
            out_array[0]=0;
            i=1;
        }
        for(size_t j=0;j<i;j++){
            *(digits+j)=out_array[i-j-1];
        }
    }
    if(output_base==0 || invalid_digit>0 || input_length==0){
        i=0;
    }
    return i;
}
