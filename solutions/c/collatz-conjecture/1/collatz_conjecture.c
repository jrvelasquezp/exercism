#include "collatz_conjecture.h"

int steps(int start) {
    int steps=0;
    if (start < 1) steps=ERROR_VALUE;
    else {
        while (start > 1) {
            if (start % 2 == 0) start=start/2;
            else start=3*start+1;
            steps++;
        }
    }
    return steps;
}
