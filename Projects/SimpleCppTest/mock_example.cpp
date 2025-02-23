

#include <gtest/gtest.h>
#include <gmock/gmock.h>
#include "src_mock_example.cpp"

class MockCalculator : public Calculator {
public:
    MOCK_METHOD(int, Add, (int a, int b), (override));
    MOCK_METHOD(int, Subtract, (int a, int b), (override));
};


TEST(CalculatorTest, AddTest) {
    MockCalculator mockCalc;

    // Expect Add(3, 5) to be called and return 8
    EXPECT_CALL(mockCalc, Add(3, 5)).WillOnce(testing::Return(8));

    // Call the mock function
    EXPECT_EQ(mockCalc.Add(3, 5), 8);
}

// main 
int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
