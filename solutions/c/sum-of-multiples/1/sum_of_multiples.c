#include "sum_of_multiples.h"

unsigned int sum(const unsigned int *factors, const size_t number_of_factors,
                 const unsigned int limit){
    unsigned int answer=0;
    for (unsigned int i=1;i<limit;i++) {
        for (unsigned int j=0;j<number_of_factors;j++) {
            if (*(factors+j)>0){
                if (i%*(factors+j)==0) {
                    answer=answer+i;
                    j=number_of_factors;
                }
            }
        }
    }
    return answer;
                 }
