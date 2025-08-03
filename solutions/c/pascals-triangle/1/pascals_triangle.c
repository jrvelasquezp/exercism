#include "pascals_triangle.h"
#include <stdlib.h>

void free_triangle(uint8_t **triangle, size_t rows){
    if(rows>0){
        **triangle=0;
    }
}

uint8_t **create_triangle(size_t rows){
    uint8_t** arr;
    if(rows==0){
        arr=(uint8_t**)malloc(sizeof(uint8_t*));
        arr[0]=(uint8_t*)malloc(sizeof(uint8_t));
        arr[0][0]=0;
    }
    else{
        arr=(uint8_t**)malloc(rows*sizeof(uint8_t*));
        uint8_t i,j;
        for(i=0;i<rows;i++){
            arr[i]=(uint8_t*)malloc(rows*sizeof(uint8_t));
        }
        for(i=0;i<rows;i++){
            for(j=0;j<rows;j++){
                if(j==0)
                    arr[i][j]=1;
                else if(i==0)
                    arr[i][j]=0;
                else
                    arr[i][j]=arr[i-1][j-1]+arr[i-1][j];
            }
        }    
    }
    return arr;
}