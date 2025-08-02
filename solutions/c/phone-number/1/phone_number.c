#include "phone_number.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

char *phone_number_clean(const char *input) {
    size_t out_size=0;
    char *output=malloc((strlen(input)+1)*sizeof(int));
    strcpy(output,input);
    //step 1 - remove non numbers
    for (size_t i=0;i<strlen(output);i++) {
        if (isdigit(*(input+i))) {
            *(output+out_size)=*(input+i);
            out_size++;
        } 
    }
    *(output+out_size)='\0';
    //step 2 - length validations
    if (strlen(output)<10) strcpy(output,"0000000000");
    if (strlen(output)>11) strcpy(output,"0000000000");
    if (strlen(output)==11 && *output!='1') strcpy(output,"0000000000");
    if (strlen(output)==10 && (*output=='0' || *output=='1')) strcpy(output,"0000000000");
    if (strlen(output)==10 && (*(output+3)=='0' || *(output+3)=='1')) strcpy(output,"0000000000");
    if (strlen(output)==11 && (*(output+4)=='0' || *(output+4)=='1')) strcpy(output,"0000000000");
    if (strlen(output)==11 && (*(output+1)=='0' || *(output+1)=='1')) strcpy(output,"0000000000");
    //step 3 - remove area code
    if (strlen(output)==11) strcpy(output,output+1);
    return output;
}
