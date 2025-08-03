#include "roman_numerals.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

char *to_roman_numeral(unsigned int number){
    char *str1;
    char *str2;
    char numeral[80]="";
    char roman[80]="";
    str1=numeral;
    str2=roman;
    do{
        sprintf(str1,"%d",number);
        if(strlen(str1)>0){
            if(number>=1000){
                strcat(str2,"M");
                number=number-1000;
            }
            else if(number>=900){
                strcat(str2,"C");
                number=number+100; 
            }
            else if(number>=500){
                strcat(str2,"D");
                number=number-500;                
            }
            else if(number>=400){
                strcat(str2,"C");
                number=number+100;
            }
            else if(number>=100){
                strcat(str2,"C");
                number=number-100;
            }
            else if(number>=90){
                strcat(str2,"X");
                number=number+10; 
            }
            else if(number>=50){
                strcat(str2,"L");
                number=number-50;                
            }
            else if(number>=40){
                strcat(str2,"X");
                number=number+10;
            }
            else if(number>=10){
                strcat(str2,"X");
                number=number-10;
            }
            else if(number>=9){
                strcat(str2,"I");
                number=number+1; 
            }
            else if(number>=5){
                strcat(str2,"V");
                number=number-5;                
            }
            else if(number>=4){
                strcat(str2,"I");
                number=number+1;
            }
            else{
                strcat(str2,"I");
                number=number-1;
            }
        }
    }while(number>0);
    char *result=malloc(sizeof(char)*strlen(str2));
    strcpy(result,str2);
    return result;
}