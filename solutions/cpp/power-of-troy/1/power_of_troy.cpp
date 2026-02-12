#include "power_of_troy.h"

namespace troy {}  // namespace troy
void give_new_artifact(troy::human& human, std::string artifact) {
    human.possession=std::make_unique<troy::artifact>(artifact);
}

void exchange_artifacts(std::unique_ptr<troy::artifact>& p1, std::unique_ptr<troy::artifact>& p2) {
    std::swap(p1,p2);
}

void manifest_power(troy::human& human, std::string power) {
    human.own_power=std::make_shared<troy::power>(power);
}

void use_power(troy::human& src, troy::human& dest) {
    dest.influenced_by=src.own_power;
}

int power_intensity(troy::human& human) {
    int counter=0;
    if (human.own_power != nullptr)
        counter=human.own_power.use_count();
    return counter;
}