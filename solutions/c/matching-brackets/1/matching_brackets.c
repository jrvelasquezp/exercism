#include "matching_brackets.h"

int find_bracket(char* text) {
  int i;
  for (i=0;i<(int)strlen(text);i++) {
    if (*(text+i)=='(' && *(text+i+1)==')') break;
    if (*(text+i)=='{' && *(text+i+1)=='}') break; 
    if (*(text+i)=='[' && *(text+i+1)==']') break;  
  }
  if (i>=(int)strlen(text)) i=-1;
  return i;
}

char* remove_bracket(char* text, int pos) {
  char* new_text=malloc(strlen(text)+1);
  if (pos>-1 && pos<=(int)strlen(text)) {
    for (int i=0;i<pos;i++) {
      *(new_text+i)=*(text+i);
    }
    for (int i=pos+2;i<(int)strlen(text);i++) {
      *(new_text+i-2)=*(text+i);
    }
    *(new_text+strlen(text)-2)='\0';
  }
  else {
    strcpy(new_text,text);
  }
  return new_text;
}

char* remove_non_bracket(const char* text) {
    char* new_text = malloc(strlen(text) + 1);
    size_t j = 0;
    for (size_t i = 0; i < strlen(text); i++) {
        if (text[i] == '(' || text[i] == ')' ||
            text[i] == '{' || text[i] == '}' ||
            text[i] == '[' || text[i] == ']') {
            new_text[j++] = text[i];
        }
    }
    new_text[j] = '\0';
    return new_text;
}

bool is_paired(const char *input) {
    if (strlen(input) == 0) return true;

    char *brackets_only = remove_non_bracket(input);
    char *new_txt = brackets_only;

    while (find_bracket(new_txt) >= 0) {
        int index = find_bracket(new_txt);
        char *temp = remove_bracket(new_txt, index);  // returns new malloc'ed string
        free(new_txt);  // free the old string
        new_txt = temp; // update pointer
    }

    bool result = (strlen(new_txt) == 0);
    free(new_txt);
    return result;
}
