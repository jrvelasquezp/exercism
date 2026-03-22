#ifndef INTERGALACTIC_TRANSMISSION_H
#define INTERGALACTIC_TRANSMISSION_H

#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>

#define WRONG_PARITY -1
int popcount7(uint8_t number);
int parity_checker(uint8_t number);
int transmit_sequence(uint8_t *buffer, const uint8_t *message,
                      int message_length);

int decode_message(uint8_t *buffer, const uint8_t *message, int message_length);

#endif
