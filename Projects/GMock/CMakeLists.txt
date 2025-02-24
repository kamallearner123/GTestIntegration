cmake_minimum_required(VERSION 3.10)
project(MathServiceLib CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include directories
include_directories(include)

# Create the library
add_library(math_service STATIC src/math_service.cpp)
target_include_directories(math_service PUBLIC include)

# Enable testing
enable_testing()

# Find GTest
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# Add test executable
add_executable(test_math_service tests/test_math_service.cpp)
target_link_libraries(test_math_service math_service gtest gtest_main pthread)

# Add test to CTest
add_test(NAME MathServiceTest COMMAND test_math_service)