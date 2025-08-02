#include "pig_latin.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

bool is_vowel(char ch){
    bool vowel;
    vowel=(ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u');
    return vowel;
}

char *rotate_left_one(char *phrase){
    char *pig_answer=(char *)malloc(100);
    char temp;
    unsigned int i;
    strcpy(pig_answer,phrase);
    temp=*pig_answer;
    for(i=1;i<strlen(pig_answer);i++){
        *(pig_answer+i-1)=*(pig_answer+i);
    }
    *(pig_answer+strlen(pig_answer)-1)=temp;
    return pig_answer;    
}

char *rotate_left(char *phrase, unsigned int n){
    char *pig_answer=(char *)malloc(100);
    unsigned int i;
    strcpy(pig_answer,phrase);
    for(i=0;i<n;i++){
        pig_answer=rotate_left_one(pig_answer);
    }
    return pig_answer;    
}

char *rule_picker(char *phrase){
    char *pig_answer=(char *)malloc(100);
    unsigned int i,j;
    strcpy(pig_answer,phrase);
    j=0;
    if(is_vowel(*pig_answer) || (*pig_answer=='y' && *(pig_answer+1)=='t') || (*pig_answer=='x' && *(pig_answer+1)=='r')){
        
    }
    else if((!is_vowel(*pig_answer) && *(pig_answer+1)=='q' && *(pig_answer+2)=='u')){
        pig_answer=rotate_left(pig_answer,3);
    }
    else if(*pig_answer=='q' && *(pig_answer+1)=='u'){
        pig_answer=rotate_left(pig_answer,2);
    }
    else if(!is_vowel(*pig_answer)){
        for(i=1;i<strlen(pig_answer);i++){
            if(is_vowel(*(pig_answer+i)) || *(pig_answer+i)=='y'){
                j=i;
                i=strlen(pig_answer)+1;
            }
        }
        pig_answer=rotate_left(pig_answer,j);
    }
    strcat(pig_answer,"ay");
    return pig_answer;
}

unsigned int word_count(char *phrase){
    unsigned int i;
    unsigned int n=1;
    for(i=0;i<strlen(phrase);i++){
        if (*(phrase+i)==' '){
            n++;
        }
    }
    return n;
}

char *translate(const char *phrase){
    unsigned int space=0, begin=0;
    unsigned int words, i,j;
    char *pig_answer=(char *)malloc(100);
    char *temp_word=(char *)malloc(100);
    char *answer=(char *)malloc(100);
    strcpy(pig_answer,phrase);
    if(strchr(pig_answer,' ')==NULL){
        pig_answer=rule_picker(pig_answer);        
    }
    else{
        words=word_count(pig_answer);
        for(j=words;j>=1;j--){
            for(i=begin;i<strlen(pig_answer);i++){
                if (*(pig_answer+i)==' '){
                    space=i;
                    i=strlen(pig_answer);
                }
                else{
                    space=strlen(pig_answer);
                }
            }
            for(i=begin;i<space;i++){
                *(temp_word+i-begin)=*(pig_answer+i);
            }
            *(temp_word+space-begin)='\0';
            temp_word=rule_picker(temp_word);
            strcat(answer,temp_word);
            if(j>1){
                strcat(answer," ");
                begin=space+1;    
            }            
        }
        strcpy(pig_answer,answer);
    }
    return pig_answer;
}
