#include "vehicle_purchase.h"

namespace vehicle_purchase {

    // needs_license determines whether a license is needed to drive a type of vehicle. Only "car" and "truck" require a license.
    bool needs_license(std::string kind){
        // TODO: Return true if you need a license for that kind of vehicle.
        if(kind.compare("car")==0 || kind.compare("truck")==0)
            return true;
        else
            return false;
    }

    // choose_vehicle recommends a vehicle for selection. It always recommends the vehicle that comes first in lexicographical order.
    std::string choose_vehicle(std::string option1, std::string option2) {
        std::string selection;
        if(option1.compare(option2)<0)
            selection=option1;
        else
            selection=option2;
        selection.append(" is clearly the better choice.");
        return selection;
    }

    // calculate_resell_price calculates how much a vehicle can resell for at a certain age.
    double calculate_resell_price(double original_price, double age) {
        if(age < 3)
            return original_price*0.8;
        else if(age < 10)
            return original_price*0.7;
        else
            return original_price*0.5;
    }

}  // namespace vehicle_purchase