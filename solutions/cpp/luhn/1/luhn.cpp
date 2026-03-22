#include "luhn.h"

namespace luhn {
    bool valid(std::string card) {
        bool valid=true;
        int double_at=0;
        int digit=0;
        bool flip=false;
        int sum=0;
        std::string card_cleaned="";
        //clean and reject invalid cards
        for (char c : card) {
            if (c >= 48 && c <= 57) {
                card_cleaned.push_back(c);
            }
            else if (c==' ')
                continue;
            else {
                valid=false;
                break;
            }
        }
        //reject all size 1 strings
        if (card_cleaned.size() <= 1)
            return card_cleaned.size() > 1;
        else  {
            double_at = (int)(card_cleaned.size()%2 != 0);
            //double all digits that match with double_at
            for (char c : card_cleaned) {
                digit=(int)(c-'0');
                if ((int)flip == double_at) {
                    digit*=2;
                    if (digit>9)
                        digit-=9;
                }
                flip=!flip;
                sum+=digit;
            }
            return (sum%10 == 0 && valid);
        }
    }
}
