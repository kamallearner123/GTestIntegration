#include "math_service.hpp"

int MathService::performOperation(int a, int b) const {
    return calculator->compute(a, b);
}
        