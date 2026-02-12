#include "lasagna_master.h"

namespace lasagna_master {

}  

int preparationTime(const std::vector<std::string>& layers, const int& prep_time) {
    return prep_time*layers.size();
}
int preparationTime(const std::vector<std::string>& layers) {
    return 2*layers.size();
}
lasagna_master::amount quantities(const std::vector<std::string>& layers) {
    lasagna_master::amount answer;
    answer.noodles=0;
    answer.sauce=0.0;

    for( std::string layer : layers ) {
        if (layer == "noodles")
            answer.noodles+=50;
        if (layer == "sauce")
            answer.sauce+=0.2;
    }
    
    return answer;
}

void addSecretIngredient(std::vector<std::string>& myList, std::vector<std::string> friendsList){
    myList.back()=friendsList.back();
}

void addSecretIngredient(std::vector<std::string>& myList, std::string secretIngredient) {
    myList.back()=secretIngredient;
}

std::vector<double> scaleRecipe(const std::vector<double> quantities, int portions) {
    std::vector<double> new_quantities;
    for (long unsigned int i=0; i<quantities.size(); i++) {
        new_quantities.push_back(quantities.at(i)*portions/2.0);
    }
    return new_quantities;
}