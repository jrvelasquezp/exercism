#include "say.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

const char *digits[]={"zero","one","two","three","four","five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "", "fourteen"};
const char *prefix[]={"","","twen","thir","for","fif","six","seven","eigh","nine"};

char* hundreds(int64_t input) {
    int64_t remainder;
    remainder=input;
    char *say_string=malloc(200*sizeof(int));
    //routine for numbers lower than 1000
    if (remainder > 99) {
        strcat(say_string,digits[remainder/100]);
        strcat(say_string," hundred");
        remainder=(remainder%100);
        if (remainder!=0) strcat(say_string," ");
    }
    if (remainder > 19) {
        strcat(say_string,prefix[remainder/10]);
        strcat(say_string,"ty");
        remainder=remainder-10*(remainder/10);
        if (remainder%10!=0) strcat(say_string,"-");
    }
    if (remainder > 12 && remainder !=14) {
        strcat(say_string,prefix[remainder%10]);
        strcat(say_string,"teen");
    }
    if (remainder > 0) strcat(say_string,digits[remainder]);
    if (remainder == 0 && strlen(say_string)==0) strcat(say_string,digits[remainder]);
    return say_string;
}

int say(int64_t input, char **ans) {
    int exit_code;
    int64_t remainder;
    //Make the remainder equal to the input
    remainder=input;
    //allocate memory
    *ans=malloc(200*sizeof(int));
    char *say_string=malloc(200*sizeof(int));
    //make early exit
    exit_code=(input < 0 || input > 999999999999) ? -1: 0;
    //run if exit code is 1
    if (exit_code>=0) {
        if (remainder>=1000000000){
            strcat(say_string,hundreds(remainder/1000000000));
            strcat(say_string," billion");
            remainder=(remainder%1000000000);
            if (remainder!=0) strcat(say_string," ");
        }
        if (remainder > 999999) {
            strcat(say_string,hundreds(remainder/1000000));
            strcat(say_string," million");
            remainder=(remainder%1000000);
            if (remainder!=0) strcat(say_string," ");
        }
        if (remainder > 999) {
            strcat(say_string,hundreds(remainder/1000));
            strcat(say_string," thousand");
            remainder=(remainder%1000);
            if (remainder!=0) strcat(say_string," ");
        }
        if (remainder > 0 || (remainder ==0 && strlen(say_string)==0)) strcat(say_string,hundreds(remainder));
    }
    strcpy(*ans,say_string);
    //strcpy(say_string, hundreds(185));
    return exit_code;
}
