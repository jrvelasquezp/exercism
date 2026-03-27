#include <string>
#include <vector>

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};

int vote_count(ElectionResult& result) {
   return result.votes; 
}

void increment_vote_count(ElectionResult& result, int votes) {
    result.votes += votes;
}

ElectionResult& determine_result(std::vector<ElectionResult>& final_count) {
    int index_winner=0;
    for (int i=1;i<final_count.size(); i++) {
        if (vote_count(final_count.at(i)) > vote_count(final_count.at(index_winner))) {
            index_winner=i;
        }
    }
    ElectionResult& w{final_count.at(index_winner)};
    w.name="President " + w.name;
    return w;
    }
}
