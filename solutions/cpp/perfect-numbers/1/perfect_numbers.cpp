#include "perfect_numbers.h"

namespace perfect_numbers {
    classification classify(int number) {
        if ( number <= 0 ) {
                throw std::domain_error("");
        }
        int sum=1;
        int quotient=number/2;
        int divider=2;
        while (divider < quotient) {
            if (number % divider == 0) {
                quotient = number / divider;
                if (quotient != divider)
                    sum += quotient;
                sum += divider;
            }
            divider++;
        }
        if (number < 5)
            return classification::deficient;
        else if (number > sum)
            return classification::deficient;
        else if (number == sum)
            return classification::perfect;
        else
            return classification::abundant;
    }
} 