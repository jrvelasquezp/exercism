#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>

typedef int buffer_value_t;

typedef struct {
    buffer_value_t* head;
    buffer_value_t* tail;
    buffer_value_t capacity;
    buffer_value_t used_slots;
    buffer_value_t circular_buffer[];
} circular_buffer_t;

circular_buffer_t* new_circular_buffer(buffer_value_t capacity);
int16_t write(circular_buffer_t *buffer, buffer_value_t value);
int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value);
int16_t read(circular_buffer_t *buffer, buffer_value_t *read_value);
void clear_buffer(circular_buffer_t *buffer);
void delete_buffer(circular_buffer_t *buffer);


#endif
