#include "eliuds_eggs.h"

unsigned int egg_count(unsigned int bucket){
    unsigned int counter = bucket;
    unsigned int eggs = 0;
    while (counter > 2) {
        eggs = eggs + counter%2 ;
        counter = counter / 2;
    }
    if (counter%2 == 1) eggs++;
    if (counter/2 == 1) eggs++;
    return eggs;
}
