#ifndef ETL_H
#define ETL_H

#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

typedef struct {
   int value;
   const char *keys;
} legacy_map;

typedef struct {
   char key;
   int value;
} new_map;

int cmp_new_map(const void *a, const void *b);
int convert(const legacy_map *input, const size_t input_len, new_map **output);

#endif
