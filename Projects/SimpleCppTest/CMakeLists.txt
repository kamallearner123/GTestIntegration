
cmake_minimum_required(VERSION 3.10)

# Set the project name
project(SimpleCppTest)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add the test executable
#add_executable(SimpleCppTest test_example.cpp test_suite2.cpp src)
add_executable(SimpleCppTest mock_example.cpp src_mock_example.cpp)

# Link the GoogleTest library
target_link_libraries(SimpleCppTest gtest gtest_main)

# Enable testing
enable_testing() 

# Add a test
add_test(NAME SimpleCppTest COMMAND SimpleCppTest)

# Enable testing output
set(CTEST_CUSTOM_TESTS_IGNORE LastTest.xml)
set(CTEST_OUTPUT_ON_FAILURE ON)