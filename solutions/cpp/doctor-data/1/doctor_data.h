#include <string>
#pragma once
namespace star_map {
        enum System {
            Sol,
            BetaHydri,
            EpsilonEridani,
            AlphaCentauri,
            DeltaEridani,
            Omicron2Eridani
        };
    }

namespace heaven {
    class Vessel {
        public:
            std::string name;
            int generation;
            star_map::System current_system;
            int busters=0;
            Vessel(std::string name, int gen);
            Vessel(std::string name, int gen, star_map::System system);
            Vessel replicate(std::string name);
            void make_buster();
            bool shoot_buster();      
    };
    std::string get_older_bob(Vessel bob1, Vessel bob2);
    bool in_the_same_system(Vessel bob1, Vessel bob2);
}
