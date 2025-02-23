#include <iostream>
// Source code
class Calculator {
    public:
        virtual ~Calculator() = default;
        virtual int Add(int a, int b) = 0;
        virtual int Subtract(int a, int b) = 0;
    };

};

class myCalculator : public Calculator {
    public:
        int Add(int a, int b) override {
            return a + b;
        }
        int Subtract(int a, int b) override {
            return a - b;
        }
};

int function(int a, int b) {
    myCalculator calc;
    return calc.Add(a, b);
}

