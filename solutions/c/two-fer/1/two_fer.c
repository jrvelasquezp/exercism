#include "two_fer.h"
#include <string.h>
#include <stdlib.h>

void two_fer(char *buffer, const char *name){
    strcpy(buffer,"One for ");
    name == NULL ? strcat(buffer, "you") : strcat(buffer, name);
    strcat(buffer,", one for me.");
}
