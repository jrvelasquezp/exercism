#ifndef RESISTOR_COLOR_TRIO_H
#define RESISTOR_COLOR_TRIO_H

typedef enum color_band{
    BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE
}resistor_band_t;

typedef enum resistor_unit{
    OHMS, KILOOHMS, MEGAOHMS, GIGAOHMS    
}resistor_unit_t;

typedef struct resistor{
    unsigned long value;
    resistor_unit_t unit;
} resistor_value_t;

resistor_value_t color_code(resistor_band_t *resist);

#endif
