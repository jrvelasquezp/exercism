#include <memory>
#include <string>
#pragma once

namespace troy {
    struct artifact {
        artifact(std::string name) : name(name) {}
        std::string name;
    };
    
    struct power {
        power(std::string effect) : effect(effect) {}
        std::string effect;
    };
    
    struct human {
        std::unique_ptr<artifact> possession;
        std::shared_ptr<power> own_power;
        std::shared_ptr<power> influenced_by;
    };
}

auto give_new_artifact(troy::human& human, std::string artifact)->void;
auto exchange_artifacts(std::unique_ptr<troy::artifact>& p1, std::unique_ptr<troy::artifact>& p2)->void;
auto manifest_power(troy::human& human, std::string power)->void;
auto use_power(troy::human& src, troy::human& dest)->void;
auto power_intensity(troy::human& human)->int;
