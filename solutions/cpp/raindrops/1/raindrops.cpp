#include "raindrops.h"

namespace raindrops {
    std::string convert(int n){
        std::string answer="";
        if (n<3)
            answer=std::to_string(n);
        else if (n%3 == 0 || n%5 == 0 || n%7 == 0){
            if (n%3 == 0)
                answer.append("Pling");
            if (n%5 == 0)
                answer.append("Plang");
            if (n%7 == 0)
                answer.append("Plong");  
        }
        else
            answer=std::to_string(n);
        return answer;
    }
}  // namespace raindrops
