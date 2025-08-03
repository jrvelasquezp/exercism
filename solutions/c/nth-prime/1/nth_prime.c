#include "nth_prime.h"
#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#include <stdlib.h>

uint32_t nth(uint32_t n){
    uint32_t prime;
    uint32_t *prime_array=malloc(n*sizeof(uint32_t));
    uint32_t lower=2;
    uint32_t higher=(uint32_t)round(n*(log(n)+log(log(n))));
    uint32_t pri_limit=1+(uint32_t)sqrt(higher);
    bool is_prime;
    uint32_t i,j,k;
    *prime_array=2;
    k=1;
    if(n<=3){
        switch(n){
            case 0:
                prime=0;
                break;
            case 1:
                prime=2;
                break;
            case 2:
                prime=3;
                break;
            case 3:
                prime=5;
                break;
            default:
                break;
        }
    }
    else{
        for(i=lower+1;i<=higher;i++){
            is_prime=true;
            for(j=2;j<pri_limit;j++){
                if(i%j==0 && i>j){
                    j=pri_limit+1;
                    is_prime=false;
                }
            }
            if(is_prime){
                if(k<n){
                    *(prime_array+k)=i;
                    k++;
                }
                else{
                    i=higher+1;
                }
            }
        }
        prime=*(prime_array+n-1);    
    } 
    //free(prime_array);
    return prime;
}