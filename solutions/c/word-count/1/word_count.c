#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include "word_count.h"
int first_non_space_at(const char *sentence) {
    int first_char=0;
    for(size_t i=0;i<strlen(sentence);i++){
        if (*(sentence+i) == ' ')
            first_char++;
        else
            break;
    }
    return first_char;
}

int last_non_space_at(const char *sentence) {
    size_t last_char=strlen(sentence)-1;
    for(size_t i=strlen(sentence);i>0;i--){
        if (*(sentence+i) == ' ')
            last_char--;
        else
            break;
    }
    return (int)last_char;
}

int unique_word(char *word, word_count_word_t *word_list, int size) {
    int word_at=-1;
    for (int i=0; i<size; i++) {
        if (strcmp((word_list+i)->text,word) == 0) {
            word_at=i;
            break;
        }
    }
    return word_at;
}

char *remove_quotation(char *sentence) {
    char *cleaned;
    cleaned=malloc(1+strlen(sentence));
    if (*sentence == '\'' && *sentence == '\'') {
        int j=0;
        for(size_t i=1;i<strlen(sentence)-1;i++) {
            *(cleaned+j)=*(sentence+i);
            j++;
        }
        *(cleaned+j)='\0';
    }
    else
        strcpy(cleaned,sentence);
    return cleaned;
}

int count_words(const char *sentence, word_count_word_t *words) {
    int count=0;
    char *cleaned_sentence;
    cleaned_sentence=malloc(1+strlen(sentence));
    if (strlen(sentence)>0) {
        //1. removing all unnecessary characters
        int j=0;
        char c;
        for(size_t i=0;i<=strlen(sentence);i++){
            c=*(sentence+i);
            if (ispunct(c) && c!='\'')
                *(cleaned_sentence+j)=' ';
            else if (isspace(c) && c!=' ')
                *(cleaned_sentence+j)=' ';
            else if (isupper(c)) 
                *(cleaned_sentence+j)=tolower(c);
            else
                *(cleaned_sentence+j)=c;
            j++;
        }
        //2. removing extra spaces
        j=0;
        char *pch;
        pch=strtok (cleaned_sentence," ");
        while (pch != NULL) {
            if(unique_word(remove_quotation(pch), words, count)<0) {
                strcpy((words+count)->text, remove_quotation(pch));
                (words+count)->count=1;
                count++;    
            }
            else {
                (words+unique_word(remove_quotation(pch), words, count))->count++;
            }
            pch = strtok (NULL, " ");
        }
    }
    free(cleaned_sentence);
    return count;
}