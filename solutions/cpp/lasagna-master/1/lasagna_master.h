#include <string>
#include <vector>
#pragma once

namespace lasagna_master {

struct amount {
    int noodles;
    double sauce;
};

}  // namespace lasagna_master
int preparationTime(const std::vector<std::string>& layers, const int& prep_time);
int preparationTime(const std::vector<std::string>& layers);
lasagna_master::amount quantities(const std::vector<std::string>& layers);
std::vector<double> scaleRecipe(const std::vector<double> quantities, int portions);
void addSecretIngredient(std::vector<std::string>& myList, std::vector<std::string> friendsList);
void addSecretIngredient(std::vector<std::string>& myList, std::string secretIngredient);