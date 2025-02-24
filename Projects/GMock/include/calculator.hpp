#ifndef CALCULATOR_HPP
#define CALCULATOR_HPP

class Calculator {
public:
    virtual ~Calculator() = default;
    virtual int compute(int a, int b) const = 0;
};

#endif // CALCULATOR_HPP