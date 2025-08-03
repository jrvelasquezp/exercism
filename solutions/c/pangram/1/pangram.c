#include "pangram.h"

bool is_pangram(const char *sentence){
    bool answer = false;
    //test null case
    if (sentence != NULL) {
        if (strlen(sentence)>0){
            //replace non alphanumeric chatacters with ~ and lowercase alphanumeric
            unsigned int i=0;
            char *phrase=malloc(100*sizeof(char));
            strcpy(phrase,sentence);
            while (*(phrase+i)!='\0'){
                if (*(phrase+i)>=65 && *(phrase+i)<=90) *(phrase+i)=*(phrase+i)+32;
                else if (!(*(phrase+i)>=97 && *(phrase+i)<=122)) *(phrase+i)='~';
                i++;
            }
            //sort
            unsigned int j=0;
            char temp=0;
            while (j<strlen(phrase)){
                i=0;
                while (*(phrase+i)!='\0'){
                    if(*(phrase+i)>*(phrase+i+1) && *(phrase+i+1)!='\0') {
                        temp=*(phrase+i);
                        *(phrase+i)=*(phrase+i+1);
                        *(phrase+i+1)=temp;
                        }
                    i++;
                }
                j++;
            }
            //check if there are more than one alphanumeric character
            i=0;
            unsigned int count=0;
            while (*(phrase+i)!='\0'){
                if (*(phrase+i)!=*(phrase+i+1)) count++;
                i++;
            }
            if ((count==26) && *(phrase+i-1)=='z') answer=true;
            else if ((count==27) && *(phrase+i-1)=='~') answer=true;
        }
        
    }
    return answer;
}
