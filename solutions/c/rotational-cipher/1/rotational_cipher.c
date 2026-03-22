#include "rotational_cipher.h"
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

char *rotate(const char *text, int shift_key) {
    char *encrypted=malloc(strlen(text));
    strcpy(encrypted,text);
    if(shift_key>0 && shift_key<26) {
        for (size_t i=0;i<strlen(text); i++) {
            if(!(isalpha(*(text+i))))
                 *(encrypted+i)=*(text+i);   
            else {
                int new_char=*(text+i)+shift_key;
                if ((new_char > 122 && islower(*(text+i))) || (new_char > 90 && isupper(*(text+i))))
                    new_char-=26;
                *(encrypted+i)=new_char;
            }
        }
    }
    return encrypted;
}
