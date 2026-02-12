#include "doctor_data.h"

using namespace heaven;
using namespace star_map;

Vessel::Vessel(std::string name, int gen) {
    this->name = name; 
    this->generation=gen;
}

Vessel::Vessel(std::string name, int gen, star_map::System system) {
    this->name = name; 
    this->generation=gen; 
    this->current_system=system;
}

Vessel Vessel::replicate(std::string name) {
    Vessel clone=Vessel(name, this->generation+1, this->current_system);
    return clone;
}

void heaven::Vessel::make_buster() {
    this->busters=1;
}

bool heaven::Vessel::shoot_buster() {
    if (this->busters == 0)
        return false;
    else {
        this->busters=0;
        return true;
    }
}

std::string heaven::get_older_bob(Vessel bob1, Vessel bob2) {
    if (bob1.generation < bob2.generation)
        return bob1.name;
    return bob2.name;
}

bool heaven::in_the_same_system(Vessel bob1, Vessel bob2) {
    return bob1.current_system==bob2.current_system;
}
    
