// Create a test case file for testing main module
// Start writing the test cases

#include <gtest/gtest.h>


using namespace testing;

TEST(MainTest, Test1)
{
    EXPECT_EQ(1, 1);
}

TEST(MainTest, Test2)
{
    EXPECT_EQ(2, 2);
}


int main(int argc, char **argv)
{
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}



