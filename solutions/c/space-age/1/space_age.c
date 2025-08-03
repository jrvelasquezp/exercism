#include "space_age.h"

float age(planet_t planet, int64_t seconds){
    float age_year=0.0;
    switch (planet){
        case MERCURY:
            age_year=age(EARTH,seconds)/0.2408467;
            break;
        case VENUS:
            age_year=age(EARTH,seconds)/0.61519726;
            break;
        case EARTH:
            age_year=seconds/31557600;
            break;
        case MARS:
            age_year=age(EARTH,seconds)/1.8808158;
            break;
        case JUPITER:
            age_year=age(EARTH,seconds)/11.862615;
            break;
        case SATURN:
            age_year=age(EARTH,seconds)/29.447498;
            break;
        case URANUS:
            age_year=age(EARTH,seconds)/84.016846;
            break;
        case NEPTUNE:
            age_year=age(EARTH,seconds)/164.79132;
            break;
        default:
            age_year=-1;
            break;
    }
    return age_year;
}
