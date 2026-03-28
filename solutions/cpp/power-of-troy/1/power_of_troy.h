#include <memory>
#pragma once
#include <string>

namespace troy {

struct artifact {
    // constructors needed (until C++20)
    artifact(std::string name) : name(name) {}
    std::string name;
};

struct power {
    // constructors needed (until C++20)
    power(std::string effect) : effect(effect) {}
    std::string effect;
};

struct human {
    std::unique_ptr<artifact> possession;
    std::shared_ptr<power> own_power;
    std::shared_ptr<power> influenced_by;
};
}

void give_new_artifact(troy::human& human, std::string artifact);
void exchange_artifacts(std::unique_ptr<troy::artifact>& p1, std::unique_ptr<troy::artifact>& p2);
void manifest_power(troy::human& human, std::string power);
void use_power(troy::human& src, troy::human& dest);
int power_intensity(troy::human& human);
