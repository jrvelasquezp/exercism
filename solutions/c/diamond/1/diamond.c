#include "diamond.h"

char **make_diamond(const char letter){
    //Check if the entries are valid
    if (letter >= 'A' && letter <='Z') {
        //Allocate memory and check the position of the letter in the edges
        int diamond_size=2*(letter - 'A')+1;
        char **diamond = (char **)calloc(diamond_size, sizeof(char *));
        //Allocate memory for each of the individual strings
        for (int i = 0; i < diamond_size; i++) {
            diamond[i] = (char *)calloc(diamond_size+1, sizeof(char));
        }
        int i,j;
        for (i=0;i<diamond_size;i++) {
            for (j=0; j<diamond_size; j++) {
                if (abs(i-j)==letter-'A' || abs(i+j)==letter-'A' || abs(i+j)==letter-'A'+diamond_size-1) {
                    if ('A'+i <= letter)
                        diamond[i][j]='A'+i;
                    else
                        diamond[i][j]='A'+diamond_size-1-i; // here is the value to be calculated - letters in descendant order
                }    
                else
                    diamond[i][j]=' ';      
            }
            diamond[i][j]='\0';
        }
        return diamond;
    }
    //error condition
    else {
        //point to null thing
        return NULL;
    }
}

void free_diamond(char **diamond) {
    free(diamond);
}
