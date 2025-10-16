#include "hexadecimal.h"

namespace hexadecimal {
    int convert(std::string decimal) {
        int answer=0;
        int pos=0;
        int pow_16=0;
        for (int i=0;decimal.size();i++) {
            int c=(int)decimal.back();
            if (pos==0)
                pow_16=1;
            else if (pos==1)
                pow_16=16;
            else
                 pow_16*=16;
            if (c>=48 && c<=57) {
                answer+=pow_16*(c-48);    
            }
            else if (c>=97 && c<=102) {
                answer+=pow_16*(c-87);
            }
            else {
                answer=0;
                break;
            }
            pos++;
            decimal.pop_back();
        }
        return answer;
    }
}
