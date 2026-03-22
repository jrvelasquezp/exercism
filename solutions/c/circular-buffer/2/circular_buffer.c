#include "circular_buffer.h"
/*
 * New circular buffer
 * Checks up for the capacity parameter, if the value is positive a new
 * buffer is created and the pointers are defined.
 */
circular_buffer_t* new_circular_buffer(buffer_value_t capacity){
    circular_buffer_t* buffer;
    // Invalid buffer sizes shall reflect an error
    if (capacity < 1) {
        errno=EINVAL;
    }
    // Buffer size > 0 -> buffer can be created
    else {
        //circular_buffer_t* buffer=calloc(1+capacity,sizeof(circular_buffer_t));
        buffer=calloc(1+capacity,sizeof(circular_buffer_t));
        buffer->capacity=capacity;
        buffer->head=buffer->circular_buffer;
        buffer->tail=buffer->head;
        buffer->used_slots=0;   
    }
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
/*
 * Overwrite buffer
 * Takes the older element and overwrites it, then increases head and tail 
 * pointers.
 */
int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value){
    int16_t status=0;
    if(buffer->used_slots==buffer->capacity){
        *(buffer->tail)=value;
        buffer->tail++;
        buffer->head++;
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
/*
 * Delete buffer
 * Clean up the pointers, the size and the allocated memory
 */
void delete_buffer(circular_buffer_t *buffer){
    buffer->tail=NULL;
    buffer->head=NULL;
    buffer->used_slots=0;    
    free(buffer);
}

