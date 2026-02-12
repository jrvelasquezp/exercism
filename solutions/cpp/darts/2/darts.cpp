#include "darts.h"

namespace darts {
    int score(double x, double y){
        double sum_sq=x*x+y*y;
        if (sum_sq <= 1.0)
            return 10;
        else if (sum_sq <= 25.0)
            return 5;
        else if (sum_sq <= 100.0)
            return 1;
        else
            return 0;
    }
}
