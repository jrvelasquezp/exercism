#include "difference_of_squares.h"

namespace difference_of_squares {
    int square_of_sum(int n) {
        int sq_sum=0;
        for(int i=1;i<=n;i++) {
            sq_sum+=i;
        }
        sq_sum=sq_sum*sq_sum;
        return sq_sum;
    }

    int sum_of_squares(int n) {
        int sq_sum=0;
        for(int i=1;i<=n;i++) {
            sq_sum+=i*i;
        }
        //sq_sum=sq_sum*sq_sum;
        return sq_sum;
    }

    int difference(int n) {
        return -1*(sum_of_squares(n)-square_of_sum(n));
    }
}
