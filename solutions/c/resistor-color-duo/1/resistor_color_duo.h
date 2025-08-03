#ifndef RESISTOR_COLOR_DUO_H
#define RESISTOR_COLOR_DUO_H
#include <stdint.h>

typedef enum color_band{
    BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE
}resistor_band_t;

typedef struct resistor{
    unsigned long value;
}resistor_value_t;

uint16_t color_code(resistor_band_t *resist);

#endif
