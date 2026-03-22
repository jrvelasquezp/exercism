#include "etl.h"


int cmp_new_map(const void *a, const void *b) {
    const new_map *x = a;
    const new_map *y = b;
    return x->key - y->key;
}

int convert(const legacy_map *input, const size_t input_len, new_map **output) {
    new_map *stru=malloc(26*sizeof(new_map));
    int output_size=0;
    *output=stru;
    const legacy_map *ptr;
    if (input_len == 0 || input == NULL) {
        output_size=-1;
    }
    else {
        for(ptr=input; ptr<input+input_len; ptr++) {
            const char *ch;
            for(ch=ptr->keys; ch<ptr->keys+strlen(ptr->keys); ch++) {
                stru->value=ptr->value;
                stru->key=tolower(*ch);
                stru++;
                output_size++;
            }
        }  
        qsort(*output, output_size, sizeof(new_map), cmp_new_map);
    }
    return output_size;
}
