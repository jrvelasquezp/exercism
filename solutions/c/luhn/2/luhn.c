#include "luhn.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

bool luhn(const char *num){
    bool is_valid_card;
    char *num_nospace=remove_spaces(num);
    char ch;
    unsigned int i,len, digit, sum;
    is_valid_card=false;
    len=strlen(num_nospace);
    sum=0;
    if(len>1){
        for(i=0;i<len;i++){
            ch=*(num_nospace+i);
            if(!(isdigit(ch) || isspace(ch))){
                is_valid_card=false;
                i=len+1;
                sum=9;
            }
            else{
                if(i%2==0 && len%2==0){
                    digit=2*(ch-48);
                    if(digit>=9){
                        digit=digit-9;
                    }
                    ch=digit+48;
                }
                else if(i%2!=0 && len%2!=0){
                    digit=2*(ch-48);
                    if(digit>=9){
                        digit=digit-9;
                    }
                    ch=digit+48;
                }
                sum=sum+(int)(ch-48);
            }    
        }
        if(sum%10==0){
            is_valid_card=true;
        }
        else{
            is_valid_card=false;
        }
    }
    else{
        is_valid_card=false;
    }
    return is_valid_card;
}

char *remove_spaces(const char *num){
    char *answer=malloc(30*sizeof(char));
    unsigned int i,j;
    j=0;
    for(i=0;i<=strlen(num);i++){
        if(*(num+i)!=' '){
            *(answer+j)=*(num+i);
            j++;
        }
    }
    return answer; 
}