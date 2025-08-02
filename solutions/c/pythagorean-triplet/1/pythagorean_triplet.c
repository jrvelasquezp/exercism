#include "pythagorean_triplet.h"
#include <stdlib.h>
#include <stdio.h>

triplets_t* triplets_with_sum(int sum){
    triplets_t *answer=malloc(10*sizeof(triplets_t));
    triplet_t triplet, *tPtr;
    tPtr=&(answer->triplets[0]);
    answer->triplets[0].a=2;
    answer->triplets[0].b=2;
    answer->triplets[0].c=2;
    answer->count=0;
    if(sum%2==1){
        answer->count=0;    
    }
    else{
        triplet.a=0;
        do{
            triplet.a++;
            triplet.b=triplet.a;
            do{
                triplet.b++;
                triplet.c=sum-(triplet.a+triplet.b);
                if(triplet.c > triplet.b && triplet.a*triplet.a+triplet.b*triplet.b==triplet.c*triplet.c){
                    //printf("%d %d %d is a triplet\n",triplet.a,triplet.b,triplet.c);
                    *tPtr=triplet;
                    tPtr++;
                    answer->count++;
                }
            }while(triplet.c>triplet.b);
        }while(triplet.c>triplet.a);
    }
    return answer;
}

void free_triplets(triplets_t *t){
    free(t);
}
