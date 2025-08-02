#include "acronym.h"

char *abbreviate(const char *phrase){
    size_t i=0;
    size_t j=0;
    char *phrase_copy=malloc(30*(1+sizeof(char*)));
    char *acron=malloc(10*(1+sizeof(char*)));
    //acron="";
    if(phrase==NULL || strlen(phrase)==0)
    {
        acron=NULL;
    }
    else
    {
        strcpy(phrase_copy,phrase);   
        if(strlen(phrase_copy)>0){
                for(i=0;i<strlen(phrase_copy);i++){
                    if(isalpha(*(phrase_copy+i)))
                        *(phrase_copy+i)=toupper(*(phrase_copy+i));
                    else if(ispunct(*(phrase_copy+i)) && *(phrase_copy+i)!='-' && *(phrase_copy+i)!='\'')
                        *(phrase_copy+i)=' ';
                    if(i==0)
                    {
                        *(acron+j)=*(phrase_copy+i);
                        j++;    
                    }
                    else if (isspace(*(phrase_copy+i)) && isalpha(*(phrase_copy+i+1)))
                    {
                        *(acron+j)=toupper(*(phrase_copy+i+1));
                        j++;
                    }
                    else if (*(phrase_copy+i)=='-' && isalpha(*(phrase_copy+i+1)))
                    {
                        *(acron+j)=toupper(*(phrase_copy+i+1));
                        j++;
                    }
                }
            }
            *(acron+j)='\0';
    }   
    return acron;
}

