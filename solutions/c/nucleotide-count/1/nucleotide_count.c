#include "nucleotide_count.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char *count(const char *dna_strand){
    char *ans=malloc(20*sizeof(int));
    int a_count,g_count,c_count,t_count;
    a_count=0;
    g_count=0;
    c_count=0;
    t_count=0;
    strcpy(ans,"");
    for(size_t i=0;i<strlen(dna_strand);i++){
        switch (*(dna_strand+i)) {
            case 'A':
                a_count++;
                break;
            case 'G':
                g_count++;
                break;
            case 'C':
                c_count++;
                break;
            case 'T':
                t_count++;
                break;
            default:
                a_count=-1;
                i=strlen(dna_strand)+2;
        }
    }
    if (a_count!=-1) {
        sprintf(ans,"A:%d C:%d G:%d T:%d", a_count, c_count, g_count, t_count);
    }
    return ans;
}
