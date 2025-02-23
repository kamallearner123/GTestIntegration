#include <gtest/gtest.h>

// Define the Test Fixture class
class MathTest : public ::testing::Test {
protected:
    int a, b;

    // Called before each test
    void SetUp() override {
        a = 10;
        b = 20;
    }

    // Called after each test (cleanup)
    void TearDown() override {
        // Any cleanup code (if needed)
    }
};

// Test cases using the fixture
TEST_F(MathTest, Addition) {
    EXPECT_EQ(a + b, 30);
}

TEST_F(MathTest, Subtraction) {
    EXPECT_EQ(b - a, 10);
}

// Main
int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}