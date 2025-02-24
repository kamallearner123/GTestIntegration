#include "gtest/gtest.h"
#include "gmock/gmock.h"
#include "math_service.hpp"

using ::testing::Return;

// Mock class for Calculator
class MockCalculator : public Calculator {
public:
    MOCK_METHOD(int, compute, (int a, int b), (const override));
};

TEST(MathServiceTest, PerformOperation) {
    MockCalculator mockCalc;
    MathService service(&mockCalc);

    // Set expectation
    EXPECT_CALL(mockCalc, compute(2, 3)).WillOnce(Return(5));

    // Test the service
    EXPECT_EQ(5, service.performOperation(2, 3));
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}