#include "intergalactic_transmission.h"
#include <stdio.h>
#include <string.h>

int popcount7(uint8_t number) {
    int count=0;
    for (uint8_t i=0;i<7;i++) {
        if (((number << i) & 0x80) == 0x80)
            count++;
    }
    return count;
}

int parity_checker(uint8_t number) {
    if ((popcount7(number) % 2 == 0) && ((number & 0x01) == 0x00)) {
        return 1;
    }
    else if((popcount7(number) % 2 != 0) && ((number & 0x01) == 0x01)) {
        return 1;
    }
    else
        return 0;
}

int transmit_sequence(uint8_t *buffer, const uint8_t *message,
                      int message_length) {
    int parity_bits=0; //number of parity bits inserted
    int transmitted_bytes=0; //number of transmitted words
    int i=0;
    int remaining_bits=0;
    int msb_bits=7;
    //int test_word=0xcb;
    uint8_t mask=0xfe; // mask for 7 bits
    uint8_t remaining=0; //value that stores remaining bits
    uint8_t carry;
    uint8_t data=0; //data to be transmitted
    uint8_t buf_size=message_length*8/7;
    if (message_length*8 % 7 > 0)
        ++buf_size;
    while (i<message_length) {
        if (remaining_bits==0) {
            mask=(mask << 0) & 0xff;
            data=*message & mask;
            remaining=(*message-data) << msb_bits;
            remaining_bits++;
            msb_bits--;
            if (popcount7(data) % 2 != 0)
                data = data | 0x01;
            parity_bits++;
            transmitted_bytes++;
            *buffer=data;
            buffer++;
            i++;
            message++;
        }
        else if (remaining_bits==7) {
            parity_bits++;
            data=remaining;
            if (popcount7(data) % 2 != 0)
                data = data | 0x01;
            *buffer=data;
            buffer++;
            transmitted_bytes++;
            msb_bits=7;
            remaining_bits=0;
            mask=0xfe;
        }
        else {
            carry=remaining;
            mask=(mask << 1) & 0xff;
            data=*message & mask;
            remaining=((*message-data) << msb_bits) & 0xff;
            data=(carry | (data >> remaining_bits)) & 0xff;
            remaining_bits++;
            msb_bits--;
            if (popcount7(data) % 2 != 0)
                data = data | 0x01;
            parity_bits++;
            *buffer=data;
            buffer++;
            transmitted_bytes++;
            i++;
            message++;
        }
    }
    if (remaining_bits != 0) {
        data=remaining;
        if (popcount7(data) % 2 != 0)
            data = data | 0x01;
        parity_bits++;
        *buffer=data;
        buffer++;
        transmitted_bytes++;
    }
    return transmitted_bytes;
}

int decode_message(uint8_t *buffer, const uint8_t *message, int message_length) {
    int i=0;
    int decoded_words=0;
    int read_bits=7;
    int carry_bits=0;
    int remaining_bits=1;
    uint8_t data_in, data_out, carry;
    carry=0;
    while(i<message_length && decoded_words != -1) {
        data_in=*message; //ready to be modified in any way
        //check parity
        if (parity_checker(data_in)==0) {
            decoded_words=-1;
        }
        //parity is valid from here
        else {
            //ignore the last bit 
            data_in=data_in & 0xfe;
            //take carry
            if (carry_bits != 0) {
                carry=(data_in & (0xfe << (7-carry_bits))) >> (8-carry_bits);
                //prepare data out and send it to the buffer 
                data_out=data_out | carry;
                *buffer=data_out;
                buffer++;
                decoded_words++;
                data_out=0;
                data_in=(data_in & (0xff >> carry_bits)) << carry_bits;
            }
            if (read_bits==0) {
                read_bits=7;
                carry_bits=0;
                remaining_bits=1;
                data_out=0;
            }
            else {
                data_out=data_in;
                carry_bits=remaining_bits;
                read_bits--;
                remaining_bits++;
            }
        }
        message++;
        i++;
    }
    return decoded_words;
}
