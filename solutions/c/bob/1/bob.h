#ifndef BOB_H
#define BOB_H
#include <stdbool.h>
char *hey_bob(char *greeting);
bool is_shouting(char *greeting);
bool is_silence(char *greeting);
bool is_lower_score(char letter);
bool is_upper_score(char letter);
bool is_a_letter(char letter);
char *clean_extra_spaces(char *greeting);
#endif
