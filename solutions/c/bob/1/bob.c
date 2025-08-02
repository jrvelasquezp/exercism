#include "bob.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>

char *hey_bob(char *greeting){
    char *answer;
    //look for question mark at the end
    if(*(greeting+strlen(greeting)-1)=='?'){
        if(is_shouting(greeting)){
            answer="Calm down, I know what I'm doing!";
        }
        else{
            answer="Sure.";
        }
    }
    else if(is_silence(greeting)){
        answer="Fine. Be that way!";
    }
    else if(is_shouting(greeting)){
        answer="Whoa, chill out!";
    }
    else if(*(greeting+strlen(greeting)-1)==' '){
        answer=hey_bob(clean_extra_spaces(greeting));
    }
    else{
        answer="Whatever.";
    }
    return answer;
}

bool is_shouting(char *greeting){
    unsigned int i;
    char ch;
    bool anyletter=false;
    bool shout=true;
    for(i=0;i<strlen(greeting);i++){
        ch=*(greeting+i);
        if(is_a_letter(ch) && is_lower_score(ch)){
            shout=false;
            i=strlen(greeting)+1;
        }
        else if(is_a_letter(ch)){
            anyletter=true;
        }  
    }
    return (shout && anyletter);
}

bool is_silence(char *greeting){
    unsigned int i;
    bool silence=true;
    if(strlen(greeting)==0){
        silence=true;
    }
    else{
        for(i=0;i<strlen(greeting);i++){
            if((*(greeting+i)==' ' || *(greeting+i)=='\r' || *(greeting+i)=='\n' || *(greeting+i)=='\t') && silence){
                silence=true;
            }
            else{
                silence=false;
            }
        }
    }
    return silence;
}

bool is_lower_score(char letter){
    if(letter<=122 && letter>=97){
        return true;
    }
    else{
        return false;
    }
}

bool is_upper_score(char letter){
    if(letter<=90 && letter>=65){
        return true;
    }
    else{
        return false;
    }
}

bool is_a_letter(char letter){
    return (is_lower_score(letter) || is_upper_score(letter));
}

char *clean_extra_spaces(char *greeting){
    unsigned int i,j;
    char *answer;
    answer=(char*) malloc(sizeof(char)*100);
    j=0;
    for(i=0;i<=strlen(greeting);i++){
        if(!(*(greeting+i)==' ')){
            *(answer+j)=*(greeting+i);
            j++;
        }
    }
    return answer;
}
