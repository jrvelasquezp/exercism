#include <stdbool.h>
#ifndef TRIANGLE_H
#define TRIANGLE_H

typedef struct {
   double a;
   double b;
   double c;
} triangle_t;

bool is_scalene(triangle_t triangle);
bool is_equilateral(triangle_t triangle);
bool is_isosceles(triangle_t triangle);
bool is_triangle(triangle_t triangle);
bool inequality(double a, double b, double c);
bool is_equal(double a, double b);

#endif
