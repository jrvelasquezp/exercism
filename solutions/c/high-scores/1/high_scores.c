#include "high_scores.h"

int32_t latest(const int32_t *scores, size_t scores_len){
    return *(scores+scores_len-1);
}

int32_t personal_best(const int32_t *scores, size_t scores_len){
    int32_t best_score=0;
    for (size_t i=0;i<scores_len;i++){
        if (*(scores+i)>best_score) best_score=*(scores+i);
    }
    return best_score;
}

size_t personal_top_three(const int32_t *scores, size_t scores_len,
                          int32_t *output){
    size_t entries=0;
    if (scores_len <3) entries=scores_len;
    else entries=3;
    for (size_t i=0;i<scores_len;i++){
        if (*(scores+i)>=*(output)){
            *(output+2)=*(output+1);
            *(output+1)=*output;
            *output=*(scores+i);
        }
        else if (*(scores+i)>=*(output+1)){
            *(output+2)=*(output+1);
            *(output+1)=*(scores+i);
        }
        else if (*(scores+i)>=*(output+2)){
            *(output+2)=*(scores+i);
        }
    }
    return entries;
}
