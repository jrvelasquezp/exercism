#include "reverse_string.h"

namespace reverse_string {
    std::string reverse_string(std::string str){
        std::string rev_str="";
        for(std::string::reverse_iterator rit=str.rbegin();rit!=str.rend();++rit){
            rev_str.push_back(*rit);    
        }
        return rev_str;
    }
}  // namespace reverse_string
