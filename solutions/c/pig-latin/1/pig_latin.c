#include "pig_latin.h"
#include <string.h>
#include <stdlib.h>

bool is_vowel(char ch){
    if(ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u'){
        return true;
    }
    else{
        return false;
    }
}

char *rotate_left_one(char *phrase){
    //this function shifts one character to the end
    char *pig_answer=(char *)malloc(100);
    char temp;
    unsigned int i;
    strcpy(pig_answer,phrase);
    //step one, copy first character to temp
    temp=*pig_answer;
    //step two, copy each charactewr to the left
    for(i=1;i<strlen(pig_answer);i++){
        *(pig_answer+i-1)=*(pig_answer+i);
    }
    //step 3, copy temp character to last position
    *(pig_answer+strlen(pig_answer)-1)=temp;
    return pig_answer;    
}

char *rotate_left(char *phrase, unsigned int n){
    //this function shifts one character to the end
    char *pig_answer=(char *)malloc(100);
    unsigned int i;
    strcpy(pig_answer,phrase);
    for(i=0;i<n;i++){
        pig_answer=rotate_left_one(pig_answer);
    }
    return pig_answer;    
}

char *rule_one(char *phrase){
    char *pig_answer=(char *)malloc(100);
    strcpy(pig_answer,phrase);
    if(is_vowel(*pig_answer)){
        strcat(pig_answer,"ay");
    }
    else if(*pig_answer=='y' && *(pig_answer+1)=='t'){
        strcat(pig_answer,"ay");
    }
    else if(*pig_answer=='x' && *(pig_answer+1)=='r'){
        strcat(pig_answer,"ay");
    }    
    return pig_answer;
}

char *rule_three(char *phrase){
    char *pig_answer=(char *)malloc(100);
    strcpy(pig_answer,phrase);
    if(!is_vowel(*pig_answer) && *(pig_answer+1)=='q' && *(pig_answer+2)=='u'){
        pig_answer=rotate_left(pig_answer,3);
        strcat(pig_answer,"ay");
    }
    else if(*pig_answer=='q' && *(pig_answer+1)=='u'){
        pig_answer=rotate_left(pig_answer,2);
        strcat(pig_answer,"ay");
    }
    return pig_answer;
}

char *rule_two_four(char *phrase){
    char *pig_answer=(char *)malloc(100);
    unsigned int i,j;
    strcpy(pig_answer,phrase);
    j=0;
    if(!is_vowel(*pig_answer)){
        //find the first location of vowel
        for(i=1;i<strlen(pig_answer);i++){
            if(is_vowel(*(pig_answer+i)) || *(pig_answer+i)=='y'){
                j=i;
                //*(pig_answer+i)=j+50;
                i=strlen(pig_answer)+1;
            }
        }
        pig_answer=rotate_left(pig_answer,j);
        strcat(pig_answer,"ay");
    }
    return pig_answer;
}

unsigned int rule_picker(char *phrase){
    char *pig_answer=(char *)malloc(100);
    strcpy(pig_answer,phrase);
    if(is_vowel(*pig_answer)){
        return 1;
    }
    else if(*pig_answer=='y' && *(pig_answer+1)=='t'){
        return 1;
    }
    else if(*pig_answer=='x' && *(pig_answer+1)=='r'){
        return 1;
    }
    else if(!is_vowel(*pig_answer) && *(pig_answer+1)=='q' && *(pig_answer+2)=='u'){
        return 3;
    }
    else if(*pig_answer=='q' && *(pig_answer+1)=='u'){
        return 3;
    }
    else if(!is_vowel(*pig_answer)){
        return 2;
    }
    else{
        return 1;
    }
}

char *translate(const char *phrase){
    const char delim[2]=" ";
    char *pig_answer=(char *)malloc(100);
    char *pig_answer_2=(char *)malloc(100);
    char *token;
    strcpy(pig_answer,phrase);
    strcpy(pig_answer_2,"");
    token=strtok(pig_answer, delim);
    while(token!=NULL) {
        switch(rule_picker(token)){
            case 1:
                token=rule_one(token);
                break;
            case 2:
                token=rule_two_four(token);
                break;
            case 3:
                token=rule_three(token);
                break;
        }
        strcat(pig_answer_2,token);
        strcat(pig_answer_2," ");
        token = strtok(NULL, delim);
    }
    *(pig_answer_2+strlen(pig_answer_2)-1)='\0';

    return pig_answer_2;
}
