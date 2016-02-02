CPP_CODE_FILES := $(wildcard *.cpp)
CPP_OBJ_FILES := $(addsuffix .o,$(basename $(CPP_CODE_FILES)))
H_FILES := $(wildcard *.h)

.PHONY: all run

all: build run

build: program

program: $(CPP_OBJ_FILES) 
	g++ $(CPP_OBJ_FILES) -std=c++11 PUT_LINKER_ARGS_HERE -o program

%.o: %.cpp $(H_FILES)
	@echo "Building $@"
	g++ $< -std=c++11 PUT_COMPILER_ARGS_HERE -c -o $@ -g

clean:
	-rm -rf *.o
	-rm program

run: program
	./program
