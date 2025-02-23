#include <stdio.h>
#include "utils.h"

// Write functions here related to math operations
int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int multiply(int a, int b) {
    return a * b;
}

int divide(int a, int b) {
    return a / b;
}

// Write functions here related to string operations
int string_length(char *str) {
    int length = 0;
    while (*str != '\0') {
        length++;
        str++;
    }
    return length;
}

// Write functions here related to file operations
int read_file(char *filename) {
    FILE *file = fopen(filename, "r");
    if (file == NULL) {
        return -1;
    }
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        printf("%c", ch);
    }
    fclose(file);
}




