#ifndef MATH_SERVICE_HPP
#define MATH_SERVICE_HPP

#include "calculator.hpp"

class MathService {
public:
    explicit MathService(Calculator* calc) : calculator(calc) {}
    int performOperation(int a, int b) const;

private:
    Calculator* calculator;
};

#endif // MATH_SERVICE_HPP