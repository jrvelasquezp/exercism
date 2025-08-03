#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs){
    if (strcmp(lhs,rhs)==0){
        return 0;
    }
    //strings not equal
    else if (strlen(lhs)!=strlen(rhs)){
        return -1;
    }
    else {
        long unsigned int i=0;
        int hamming=0;
        for(i=0;i<strlen(lhs);i++){
            if (*(lhs+i)!=*(rhs+i))
                hamming++;
        }
        return hamming;
    }
}
