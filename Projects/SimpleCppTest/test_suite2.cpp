// This file is to test the functions in utils.c

# include <gtest/gtest.h>

int subtract(int a, int b) {
    return a - b;
}

TEST (MathOperations_sub, Subtract1) {
    EXPECT_EQ(1, subtract(3, 2));
    EXPECT_EQ(2, subtract(4, 2));
    EXPECT_EQ(3, subtract(5, 2));
}
