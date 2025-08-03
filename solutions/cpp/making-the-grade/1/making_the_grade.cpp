#include <array>
#include <string>
#include <vector>
#include <cmath>
#include <iterator>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    std::vector<int> answer;
    for(int i=0;i<student_scores.size();i++){
        answer.push_back(floor(student_scores.at(i)));
    }
    return answer;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    int failed=0;
    for(int i=0;i<student_scores.size();i++){
        if(student_scores.at(i)<41)
            failed++;
    }
    return failed;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
    std::vector<int> answer;
    for(int i=0;i<student_scores.size();i++){
        if(student_scores.at(i)>=threshold)
            answer.push_back(student_scores.at(i));
    }
    return answer;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    // TODO: Implement letter_grades
    std::array<int,4> answer;
    int step=static_cast<int>((highest_score-40)/4);
    for(int i=0;i<4;i++){
        if(i==0)
            answer.at(i)=41;
        else
            answer.at(i)=step+answer.at(i-1);
    }
    return answer;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::vector<std::string> answer;
    std::string text="";
    for(int i=0;i<student_scores.size();i++){
        text=std::to_string(i+1);
        text.append(". ");
        text.append(student_names.at(i));
        text.append(": ");
        text.append(std::to_string(student_scores.at(i)));
        answer.push_back(text);
    }
    return answer;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    std::string perfect="";
    for(int i=0;i<student_scores.size();i++){
        if(student_scores.at(i)==100){
            perfect=student_names.at(i);
            i=student_scores.size()+2;
        }
    }
    return perfect;
}
