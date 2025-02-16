cmake_minimum_required(VERSION 3.10)
project(Monitor)
set(CMAKE_CXX_STANDARD 11)

# Assign source files
set(source_files
    src/main.c
    src/utils.c
)

# Assign executable name
set(executable_name monitor.out)

# Add executable
add_executable(${executable_name} ${source_files})

# Include directories
target_include_directories(${executable_name} PRIVATE include)

# Link libraries
target_link_libraries(${executable_name} PRIVATE pthread)

# Set output directory
set_target_properties(${executable_name} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Set install directory
install(TARGETS ${executable_name} DESTINATION bin)

# Set install directory for header files
install(DIRECTORY include/ DESTINATION include)

message("The executable file will be located at: ${CMAKE_BINARY_DIR}/bin/${executable_name}")
