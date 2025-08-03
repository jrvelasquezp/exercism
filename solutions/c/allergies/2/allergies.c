#include "allergies.h"

bool is_allergic_to(allergen_t allergen, int score){
    return get_allergens(score).allergens[allergen];
}

allergen_list_t get_allergens(int score){
    allergen_list_t list;
    list.count = 0;
    for(int i=0;i<8;i++) {
        if (score & (1 << i)) {
            list.count++;
            list.allergens[i]=true;
        }
        else list.allergens[i]=false;
    }
    return list;
}