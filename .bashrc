
############### Related to GTEST############################
alias gtest_term='PS1="GTestTutorial: \w$>"'
# Function to check if GTest is installed
function check_gtest_installed() {
    if pkg-config --exists gtest; then
        echo "✅ Google Test is installed!"
        echo "Version: $(pkg-config --modversion gtest)"
        echo "Include Path: $(pkg-config --cflags gtest)"
        echo "Library Path: $(pkg-config --libs gtest)"
    else
        echo "❌ Google Test is NOT installed!"
    fi
}

# Function to locate GTest files
function find_gtest_files() {
    echo "🔍 Searching for GTest headers and libraries..."
    find /usr/include /usr/local/include -name "gtest.h" 2>/dev/null
    find /usr/lib /usr/local/lib -name "libgtest*.a" 2>/dev/null
}

# Function to list installed GTest packages
function list_gtest_packages() {
    echo "📦 Checking installed GTest packages..."
    if command -v dpkg &>/dev/null; then
        dpkg -l | grep -i gtest || echo "No GTest package found."
    elif command -v rpm &>/dev/null; then
        rpm -qa | grep -i gtest || echo "No GTest package found."
    elif command -v dnf &>/dev/null; then
        dnf list installed | grep -i gtest || echo "No GTest package found."
    elif command -v yum &>/dev/null; then
        yum list installed | grep -i gtest || echo "No GTest package found."
    else
        echo "Package manager not detected."
    fi
}

# Shortcut alias to check GTest status quickly
alias gtest-check="check_gtest_installed"
alias gtest-find="find_gtest_files"
alias gtest-list="list_gtest_packages"


#
# Function to install Google Test
function gtest-install() {
    echo "📦 Checking if Google Test is already installed..."
    if pkg-config --exists gtest; then
        echo "✅ Google Test is already installed! Version: $(pkg-config --modversion gtest)"
        return
    fi

    echo "🚀 Installing Google Test..."
    if command -v apt &>/dev/null; then
        sudo apt update
        sudo apt install libgtest-dev -y
        cd /usr/src/gtest
        sudo cmake CMakeLists.txt
        sudo make
        sudo cp lib/*.a /usr/lib
        echo "✅ Google Test installed successfully!"
    elif command -v dnf &>/dev/null; then
        sudo dnf install gtest-devel -y
        echo "✅ Google Test installed successfully!"
    elif command -v yum &>/dev/null; then
        sudo yum install gtest-devel -y
        echo "✅ Google Test installed successfully!"
    elif command -v pacman &>/dev/null; then
        sudo pacman -S googletest --noconfirm
        echo "✅ Google Test installed successfully!"
    else
        echo "❌ Package manager not found. Please install manually."
    fi
}

# Shortcut alias
alias gtest-install="gtest-install"

# Function to create a GTest C project
function gtest-create-c-project() {
    if [ $# -lt 1 ]; then
        echo "Usage: gtest-create-c-project <project_name> [src_dir] [include_dir] [lib_dir]"
        return 1
    fi

    PROJECT_NAME=$1
    SRC_DIR=${2:-"./src"}
    INCLUDE_DIR=${3:-"./include"}
    LIB_DIR=${4:-"/usr/lib"}

    mkdir -p "$PROJECT_NAME"/{src,include,tests,build}
    cd "$PROJECT_NAME"

    # Create a sample test file
    cat <<EOF > tests/test_main.c
#include <gtest/gtest.h>

TEST(SampleTest, BasicAssertions) {
    EXPECT_EQ(1, 1);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
EOF

    # Create a CMakeLists.txt file
    cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project($PROJECT_NAME C)

set(CMAKE_C_STANDARD 11)

include_directories(${INCLUDE_DIR})
link_directories(${LIB_DIR})

add_executable(${PROJECT_NAME}_test tests/test_main.c)
target_link_libraries(${PROJECT_NAME}_test gtest gtest_main pthread)
EOF

    echo "✅ Google Test C project '$PROJECT_NAME' created successfully!"
    echo "👉 To build: cd $PROJECT_NAME/build && cmake .. && make"
    cd ..
}

# Function to create a GTest C++ project
function gtest-create-cpp-project() {
    if [ $# -lt 1 ]; then
        echo "Usage: gtest-create-cpp-project <project_name> [src_dir] [include_dir] [lib_dir]"
        return 1
    fi

    PROJECT_NAME=$1
    SRC_DIR=${2:-"./src"}
    INCLUDE_DIR=${3:-"./include"}
    LIB_DIR=${4:-"/usr/lib"}

    mkdir -p "$PROJECT_NAME"/{src,include,tests,build}
    cd "$PROJECT_NAME"

    # Create a sample test file
    cat <<EOF > tests/test_main.cpp
#include <gtest/gtest.h>

TEST(SampleTest, BasicAssertions) {
    EXPECT_EQ(1, 1);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
EOF

    # Create a CMakeLists.txt file
    cat <<EOF > CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project($PROJECT_NAME CXX)

set(CMAKE_CXX_STANDARD 17)

include_directories(${INCLUDE_DIR})
link_directories(${LIB_DIR})

add_executable(${PROJECT_NAME}_test tests/test_main.cpp)
target_link_libraries(${PROJECT_NAME}_test gtest gtest_main pthread)
EOF

    echo "✅ Google Test C++ project '$PROJECT_NAME' created successfully!"
    echo "👉 To build: cd $PROJECT_NAME/build && cmake .. && make"
    cd ..
}

# Shortcuts
alias gtest-new-c="gtest-create-c-project"
alias gtest-new-cpp="gtest-create-cpp-project"

#!/bin/bash

# Function to create directory structure
create_directories() {
    local project_name=$1
    mkdir -p "$project_name"/{src,include,bin,build,tests,docs}
}

# Function to create sample main.c file
create_main_c() {
    local project_name=$1
    cat > "$project_name/src/main.c" <<EOL
#include <stdio.h>
#include "utils.h"

int main() {
    printf("Hello, World!\\n");
    print_message();
    return 0;
}
EOL
}

# Function to create a sample header file
create_header_file() {
    local project_name=$1
    cat > "$project_name/include/utils.h" <<EOL
#ifndef UTILS_H
#define UTILS_H

void print_message();

#endif
EOL
}

# Function to create a sample source file
create_source_file() {
    local project_name=$1
    cat > "$project_name/src/utils.c" <<EOL
#include <stdio.h>
#include "utils.h"

void print_message() {
    printf("This is a utility function.\\n");
}
EOL
}

# Function to create a Makefile
create_makefile() {
    local project_name=$1
    cat > "$project_name/Makefile" <<EOL
CC=gcc
CFLAGS=-Iinclude -Wall -Wextra
SRC=\$(wildcard src/*.c)
OBJ=\$(SRC:src/%.c=build/%.o)
EXEC=bin/$project_name

all: \$(EXEC)

build/%.o: src/%.c
	@mkdir -p build bin
	\$(CC) \$(CFLAGS) -c \$< -o \$@

\$(EXEC): \$(OBJ)
	\$(CC) \$(OBJ) -o \$(EXEC)

clean:
	rm -rf build bin
EOL
}

# Function to create a README file
create_readme() {
    local project_name=$1
    cat > "$project_name/README.md" <<EOL
# $project_name

A simple C project structure.

## Build

\`\`\`sh
make
\`\`\`

## Run

\`\`\`sh
./bin/$project_name
\`\`\`

## Clean

\`\`\`sh
make clean
\`\`\`
EOL
}

# Main function to create a C project
create_c_project() {
    if [ -z "$1" ]; then
        echo "Usage: $0 <project_name>"
        return -1
    fi

    local project_name=$1
    echo "Creating C project: $project_name"

    create_directories "$project_name"
    create_main_c "$project_name"
    create_header_file "$project_name"
    create_source_file "$project_name"
    create_makefile "$project_name"
    create_readme "$project_name"

    echo "C project '$project_name' created successfully!"
}

# Execute the main function with project name as argument
alias gtest-c-project='create_c_project'


############### Related to GTEST : Done############################
