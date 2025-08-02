#ifndef KINDERGARTEN_GARDEN_H
#define KINDERGARTEN_GARDEN_H
#include <stdlib.h>

typedef enum { CLOVER = 0, GRASS = 1, RADISHES = 2, VIOLETS = 3 } plant_t;

typedef struct {
   plant_t plants[4];
} plants_t;

int number_of_student(const char *student);
plants_t plants(const char *garden, const char *student);
plant_t get_plant(char letter);

#endif
