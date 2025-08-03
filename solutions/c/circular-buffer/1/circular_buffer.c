#include "circular_buffer.h"

circular_buffer_t* new_circular_buffer(buffer_value_t capacity){
    circular_buffer_t* buffer=calloc(10+capacity,sizeof(buffer_value_t));
    buffer->capacity = capacity;
    buffer->head = buffer->circular_buffer;
    buffer->tail = buffer->head;
    buffer->used_slots=0;
    return buffer;
}

int16_t write(circular_buffer_t *buffer, buffer_value_t value){
    int16_t status=0;
    if(buffer->used_slots==buffer->capacity){
        status=1;
        errno=ENOBUFS;
    }
    else{
        *(buffer->head)=value;
        buffer->head++;
        if(buffer->head==buffer->circular_buffer+buffer->capacity){
            buffer->head=buffer->circular_buffer;
        }
        buffer->used_slots++;    
    }
    return status;
}

int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value){
    int16_t status=0;
    if(buffer->used_slots==buffer->capacity){
        *(buffer->tail)=value;
        buffer->tail++;
        if(buffer->tail==buffer->circular_buffer+buffer->capacity){
            buffer->tail=buffer->circular_buffer;
        }
    }
    else{
        status=write(buffer, value);
    }
    return status;
}

int16_t read(circular_buffer_t *buffer, buffer_value_t *read_value){
    int16_t status=0;
    if(buffer->used_slots==0){
        status=1;
        errno=ENODATA;
    }
    else{
        *read_value=*(buffer->tail);
        *(buffer->tail)=0;
        buffer->tail++;
        if(buffer->tail==buffer->circular_buffer+buffer->capacity){
            buffer->tail=buffer->circular_buffer;
        }
        buffer->used_slots--;
        status=0;
    }
    return status;
}

void clear_buffer(circular_buffer_t *buffer){
    if(buffer->used_slots>0){
        *(buffer->tail)=0;
        buffer->tail++;
        if(buffer->tail==buffer->circular_buffer+buffer->capacity){
            buffer->tail=buffer->circular_buffer;
        }
        buffer->used_slots--;    
    }
}

void delete_buffer(circular_buffer_t *buffer){
    free(buffer);
}

