#include "triangle.h"

bool is_triangle(triangle_t triangle){
    double a=triangle.a;
    double b=triangle.b;
    double c=triangle.c;
    if(a>0 && b>0 && c>0){
        return (inequality(a,b,c) && inequality(b,c,a) && inequality(a,c,b));
    }
    else{
        return false;
    }  
}

bool inequality(double a, double b, double c){
    return (a+b>=c);
}

bool is_equal(double a, double b){
    return a==b;
}

bool is_scalene(triangle_t triangle){
    if(is_triangle(triangle)){
            return (!is_equal(triangle.a,triangle.b) && !is_equal(triangle.b,triangle.c) && !is_equal(triangle.a,triangle.c));    
    }
    else{
        return false;
    }
}

bool is_equilateral(triangle_t triangle){
    if(is_triangle(triangle)){
        return (is_equal(triangle.a,triangle.b) && is_equal(triangle.b,triangle.c));
    }
    else{
        return false;
    }
}

bool is_isosceles(triangle_t triangle){
    if(is_triangle(triangle)){
        if(triangle.a==triangle.b){
            return true;
        }
        else if(triangle.a==triangle.c || triangle.b==triangle.c){
            return true;
        }
        else{
            return false;
        }
    }
    else{
        return false;
    }
}
