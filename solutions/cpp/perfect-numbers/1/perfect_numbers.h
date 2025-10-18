#include <stdexcept>
#pragma once

namespace perfect_numbers {
    enum classification {
        perfect,
        abundant,
        deficient
    };
    classification classify(int number);   
}
