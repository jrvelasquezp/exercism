#include "isogram.h"
#include <string.h>
#include <ctype.h>

bool is_isogram(const char phrase[]){
    const char *pPtr = phrase;
    int i,j,lon;
    //check for null character
    bool isIso=true;
    if (pPtr==NULL){
        isIso=false;
    }
    //check for zero size string
    else if (strlen(phrase)==0){
        isIso=true;
    }
    else {
        lon=strlen(phrase);
        for (i=0;i<lon;i++){
            for (j=0;j<lon;j++){
                //for characters in different position that are letters and converted to lowercase
                //if the characters are equal, the word is not an isogram
                if(i!=j && tolower(phrase[i])==tolower(phrase[j]) && isalpha(phrase[i])){
                    isIso=false;
                    i=lon+1;
                    j=lon+1;
                }
            }
        }
    }
    return isIso;
}
