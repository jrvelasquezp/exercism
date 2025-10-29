#include "power_of_troy.h"

namespace troy {}
auto give_new_artifact(troy::human& human, std::string artifact)->void {
    human.possession=std::make_unique<troy::artifact>(artifact);
}

auto exchange_artifacts(std::unique_ptr<troy::artifact>& p1, std::unique_ptr<troy::artifact>& p2)->void {
    std::swap(p1,p2);
}

auto manifest_power(troy::human& human, std::string power)->void {
    human.own_power=std::make_shared<troy::power>(power);
}

auto use_power(troy::human& src, troy::human& dest)->void {
    dest.influenced_by=src.own_power;
}

auto power_intensity(troy::human& human)->int {
    auto counter=0;
    if (human.own_power != nullptr)
        counter=human.own_power.use_count();
    return counter;
}