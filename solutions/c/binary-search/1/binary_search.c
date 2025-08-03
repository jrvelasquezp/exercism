#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length){
    if (length==0) return NULL;
    else if (length==1 && *arr==value) return (void *)arr;
    else if (value < *arr || value > *(arr+length-1)) return NULL;
    else if (value == *arr) return (void *)arr;
    else if (value == *(arr+length-1)) return (void *)(arr+length-1);
    else {
        int upper = length - 1;
        int lower = 0;
        int half = length/2;
        int stop=0;
        while (stop==0){
        if(value == *(arr+half)) {
            stop=1;
            return (void *)(arr+half);
        }
        else if (value < *(arr+half)) {
            upper=half;
            half=(lower+upper)/2;
        }
        else {
            lower=half;
            half=(lower+upper)/2;
        }
        if (upper == lower+1) stop=1; 
        }
        return NULL;
    }
}
