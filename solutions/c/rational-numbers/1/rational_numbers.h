#include <stdint.h>
#include <math.h>
#include <stdlib.h>
#ifndef RATIONAL_NUMBERS_H
#define RATIONAL_NUMBERS_H

typedef struct rational{
    int numerator;
    int denominator;
} rational_t;

#endif
int gcd(int a,int b);
rational_t absolute(rational_t r1);
rational_t add(rational_t r1, rational_t r2);
rational_t subtract(rational_t r1, rational_t r2);
rational_t multiply(rational_t r1, rational_t r2);
rational_t divide(rational_t r1, rational_t r2);
rational_t exp_rational(rational_t r1, int16_t r2);
float exp_real(float x, rational_t r);
rational_t reduce(rational_t r1);
