#include "dnd_character.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>

int modifier(int score){
    return (int)floor(((float)score-10.0)/2.0);
}

int ability(void){
    srand(time(NULL));
    int dice_1 = 1+rand() % 5;
    int dice_2 = 1+rand() % 5;
    int dice_3 = 1+rand() % 5;
    int dice_4 = 1+rand() % 5;
    return dice_2+dice_3+dice_4-dice_1;
}

dnd_character_t make_dnd_character(void){
    dnd_character_t character;
    character.strength=ability();
    character.dexterity=ability();
    character.constitution=ability();
    character.intelligence=ability();
    character.wisdom=ability();
    character.charisma=ability();
    character.hitpoints=10+modifier(character.constitution);
    return character;
}