#include "largest_series_product.h"
#include <stdio.h>

//checks for all characters in string if any is a digit
size_t test_all_digits(char *digits) {
    size_t all_digits = 1;
    for (size_t i = 0 ; i < strlen(digits) ; i++) {
        if (!isdigit(*(digits + i))) {
            all_digits = 0;
            break;
        }
    }
    return all_digits;
}

int64_t largest_series_product(char *digits, size_t span) {
    int64_t product = 0;
    //rejections
    //bigger span than string length
    if (span > strlen(digits)) {
        product = -1;
    }
    //empty string
    else if (strlen(digits) < 1) {
        product = -1;
    }
    //check for non-digits
    else if (test_all_digits(digits) < 1) {
        product = -1;
    }
    //valid cases
    else {
        product = 0;
        int64_t temp = 1;
        for (size_t i = 0; i <= strlen(digits) - span; i++) {
            for (size_t j = i ; j < span + i ; j++) {
                temp *= *( digits + j ) - 48;   
            }
            if ( temp > product ) {
                product = temp;
            }
            temp = 1;
        }
    }
    return product;
}
