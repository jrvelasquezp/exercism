#ifndef MATCHING_BRACKETS_H
#define MATCHING_BRACKETS_H

#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

bool is_paired(const char *input);
int find_bracket(char* );
char* remove_bracket(char*, int);
char* remove_non_bracket(const char*);

#endif
