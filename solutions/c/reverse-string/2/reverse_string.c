#include "reverse_string.h"
#include <string.h>
#include <stdlib.h>

char *reverse(const char *text){
    char *rtext=malloc(1+strlen(text));
    char *tp, *rtp, temp;
    strcpy(rtext, text);
    tp=rtext;
    rtp=rtext+strlen(rtext)-1;
    while(tp < rtp) {
        temp=*tp;
        *tp=*rtp;
        *rtp=temp;
        rtp--;
        tp++;
    }
    return rtext;
}
