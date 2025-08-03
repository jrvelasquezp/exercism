#include <string>

namespace log_line {
    std::string message(std::string log){
        std::size_t found = log.find_first_of(": ");
        std::string linelog=log.substr(found+2,log.length()-(found+2));
        return linelog;
    }
    std::string log_level(std::string log){
        std::size_t found_start = log.find_first_of("[");
        std::size_t found_end = log.find_first_of("]");
        std::string linelog=log.substr(found_start+1,found_end-found_start-1);
        return linelog;
    }
    std::string reformat(std::string log){
        std::string linelog=log_line::message(log);
        linelog.append(" (");
        linelog.append(log_line::log_level(log));
        linelog.append(")");
        return linelog;
    }
    

} // namespace log_line
