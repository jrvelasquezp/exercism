#ifndef PIG_LATIN_H
#define PIG_LATIN_H
#include <stdbool.h>

char *translate(const char *phrase);
bool is_vowel(char ch);
char *rule_one(char *phrase);
char *rule_three(char *phrase);
char *rotate_left_one(char *phrase);
char *rotate_left(char *phrase, unsigned int n);
char *rule_two_four(char *phrase);
unsigned int rule_picker(char *phrase);

#endif
