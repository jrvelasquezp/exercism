#include "allergies.h"

bool is_allergic_to(allergen_t allergen, int score){
    bool allergic;
    allergen_list_t list;
    list=get_allergens(score);
    allergic=list.allergens[allergen];
    return allergic;
}

allergen_list_t get_allergens(int score){
    allergen_list_t list;
    list.count = 0;
    list.allergens[0]=true;
    for(int i=0;i<8;i++) {
        if (score & (1 << i)) {
            list.count++;
            list.allergens[i]=true;
        }
        else list.allergens[i]=false;
    }
    return list;
}
