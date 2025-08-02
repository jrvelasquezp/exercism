#ifndef PIG_LATIN_H
#define PIG_LATIN_H
#include <stdbool.h>

char *translate(const char *phrase);
bool is_vowel(char ch);
char *rotate_left_one(char *phrase);
char *rotate_left(char *phrase, unsigned int n);
char *rule_picker(char *phrase);
unsigned int word_count(char *phrase);
#endif
