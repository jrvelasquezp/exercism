#include "prime_factors.h"

size_t find_factors(uint64_t n, uint64_t factors[static MAXFACTORS]){
    size_t a=sizeof(*factors)/sizeof(uint64_t);
    int i=0,f_prime=2;
    if(n==1){  
        a=0;
    }
    else{
        do{
            if(n%f_prime==0){
                factors[i]=f_prime;
                n=n/f_prime;
                i++;
                a=i;
            }
            else{
                f_prime++;
            }
        } while (n>1);
    } 
    return a;
}
