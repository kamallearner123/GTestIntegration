cmake_minimum_required(VERSION 3.10)
project(MyGTestProject)

enable_testing()

# Find GoogleTest (Includes GoogleMock)
find_package(GTest REQUIRED)


# Find Threads library (for Linux/Mac)
find_package(Threads REQUIRED)

# Add the test executable
add_executable(my_tests test_main.cpp)

# Include GoogleMock headers
target_include_directories(my_tests PRIVATE ${GTEST_INCLUDE_DIRS} ../include)

# Link GoogleTest, and Threads
target_link_libraries(my_tests PRIVATE GTest::GTest GTest::Main Threads::Threads)

# Add tests
add_test(NAME my_tests COMMAND my_tests)

# Set output directory
set_target_properties(my_tests PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
