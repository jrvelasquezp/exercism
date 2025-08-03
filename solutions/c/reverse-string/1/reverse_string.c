#include "reverse_string.h"
#include <string.h>
#include <stdlib.h>

char *reverse(const char *value){
    int i,lon;
    char *rvalue;
    lon=strlen(value);
    rvalue=(char *) malloc(lon+1);
    for (i=0;i<lon;i++){
        *(rvalue+i)=*(value+lon-i-1);   
    }
    *(rvalue+lon)=*(value+lon);
    return rvalue;
}
