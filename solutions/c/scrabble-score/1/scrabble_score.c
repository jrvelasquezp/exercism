#include "scrabble_score.h"
#include <ctype.h>

unsigned int score(const char *word){
    unsigned int score=0;
    char points[]="02210313074020029000033739";
    for(int i=0;i<30;i++){
        if ((*word)=='\0'){
            i=31;
        }
        else {
            score=score+points[tolower(*word)-97]-47;
            word++;          
        }
    }
    return score; 
}
