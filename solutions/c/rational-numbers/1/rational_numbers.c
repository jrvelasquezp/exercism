#include "rational_numbers.h"

int gcd(int a,int b){
    int i, limit, divisor;
    a=abs(a);
    b=abs(b);
    i=0;
    divisor=1;
    if (a>b)
        limit=b;
    else
        limit=a;
    for(i=2;i<=limit;i++){
        if(a%i==0 && b%i==0)
            divisor=i;
    }
    return divisor;
}

rational_t absolute(rational_t r1){
    r1.numerator=abs(r1.numerator);
    r1.denominator=abs(r1.denominator);   
    return reduce(r1); 
}

rational_t reduce(rational_t r1){
    rational_t result=r1;
    if (r1.numerator==0){
        result.numerator=0;
        result.denominator=1;
    }
    if(r1.denominator<0){
        result.numerator=(-1)*result.numerator;
        result.denominator=(-1)*result.denominator;
    }
    if(gcd(r1.numerator,r1.denominator)!=1){
        result.numerator=result.numerator/gcd(r1.numerator,r1.denominator);
        result.denominator=result.denominator/gcd(r1.numerator,r1.denominator);
    }
    return result; 
}

rational_t add(rational_t r1, rational_t r2){
    rational_t result={0,1};
    result.numerator=r1.numerator*r2.denominator+r2.numerator*r1.denominator;
    result.denominator=r1.denominator*r2.denominator;
    return reduce(result); 
}

rational_t subtract(rational_t r1, rational_t r2){
    rational_t result={0,1};
    result.numerator=r1.numerator*r2.denominator-r2.numerator*r1.denominator;
    result.denominator=r1.denominator*r2.denominator;
    return reduce(result); 
}

rational_t multiply(rational_t r1, rational_t r2){
    rational_t result={0,1};
    result.numerator=r1.numerator*r2.numerator;
    result.denominator=r1.denominator*r2.denominator;
    return reduce(result); 
}

rational_t divide(rational_t r1, rational_t r2){
    rational_t result={0,1};
    result.numerator=r1.numerator*r2.denominator;
    result.denominator=r1.denominator*r2.numerator;
    return reduce(result); 
}

rational_t exp_rational(rational_t r1, int16_t n){
    rational_t result={0,1};
    if(n>=0){
        result.numerator=pow(r1.numerator,n);
        result.denominator=pow(r1.denominator,n);   
    }
    else{
        result.numerator=pow(r1.denominator,-n);
        result.denominator=pow(r1.numerator,-n);     
    }
    return reduce(result); 
}

float exp_real(float x, rational_t r){
    float result=x;
    return pow(pow(result,r.numerator),1/(float)r.denominator); 
}
