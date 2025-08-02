#include "rna_transcription.h"
#include <stdlib.h>

char *to_rna(const char *dna){
    int i=0;
    char* rna = malloc(20*sizeof(char));
    while (*(dna+i)!='\0'){
        if (*(dna+i) == 'A'){
            *(rna+i)='U';            
        }
        else if (*(dna+i) == 'G'){
            *(rna+i)='C';            
        }
        else if (*(dna+i) == 'C'){
            *(rna+i)='G';            
        }
        else if (*(dna+i) == 'T'){
            *(rna+i)='A';            
        } 
        i++;
    }
    return rna;
}
