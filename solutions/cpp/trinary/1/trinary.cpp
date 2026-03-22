#include "trinary.h"

namespace trinary {
    int to_decimal(std::string number) {
        bool isnumber=true;
        for (char c: number) {
            if (!isdigit(c)) {
                isnumber=false;
                break;
            }
        }
        if (!isnumber)
            return 0;
        else {
            int answer=0;
            int n=0;
            for (int i=0;number.size();i++) {
                n=(int)(number.back()-48);
                if (i==0) 
                    answer+=(int)(number.back()-48);
                else {
                    n=3;
                    for (int j=1; j<i; j++)
                        n=3*n;
                    answer+=n*(int)(number.back()-48);
                    }
                number.pop_back();
            }
            return answer;
        }
    }
}
