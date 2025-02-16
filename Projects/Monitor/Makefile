CC=gcc
CFLAGS=-Iinclude -Wall -Wextra
SRC=$(wildcard src/*.c)
OBJ=$(SRC:src/%.c=build/%.o)
EXEC=bin/Monitor

all: $(EXEC)

build/%.o: src/%.c
	@mkdir -p build bin
	$(CC) $(CFLAGS) -c $< -o $@

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

clean:
	rm -rf build bin
