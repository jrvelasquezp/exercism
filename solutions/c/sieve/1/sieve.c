#include "sieve.h"

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes){
    uint32_t *numbers = malloc((1001)*sizeof(uint32_t));
    if (limit<2) return 0;
    else if (max_primes == 0) return 42;
    else if (limit == 2) {
        *primes = 2;
        return 1;
    }
    else if (limit > 2){
        uint32_t i=0;
        uint32_t j=0;
        //fill the array
        for (i=0;i<limit-1;i++) *(numbers+i)=i+2;
        //next check if the non primes can be marked (zeroed)
        for (j=0;j<limit-1;j++){
            if (*(numbers+j)!=0){
            uint32_t multiplier=1;
            for (i=0;i<limit-1;i++) {
                if (*(numbers+i)==*(numbers+j)*multiplier) {
                    if (multiplier > 1)
                        *(numbers+i)=0;
                    multiplier++;
                    }
                    else if (*(numbers+i)>*(numbers+j)*multiplier) {
                        multiplier++;
                    }
                }
            } 
        }
        //Last thing, fill and return the right array
        j=0;
        for (uint32_t i=0;i<limit-1;i++){
            if(*(numbers+i)!=0 && j<max_primes) {
                *(primes+j)=*(numbers+i);
                j++;
            }
        }
        return j;
    }
    else return 0;
}