define hello_pc
prefix=$(cur__install)
exec_prefix=$${prefix}
includedir=$${prefix}/lib
libdir=$${exec_prefix}/lib

Name: hello
Description: The hello library
Version: 1.0.0
Cflags: -I$${includedir}
Libs: -L$${libdir} -ldep
endef
export hello_pc

# the compiler: gcc for C program, define as g++ for C++
CC = gcc

# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
CFLAGS  = -g -Wall

# the build target executable:
TARGET = hello

build: $(TARGET)

$(TARGET): $(TARGET).c
	$(CC) $(CFLAGS) -o $(TARGET) $(TARGET).c

install:
	echo "$$hello_pc" > $(cur__install)/lib/hello.pc

clean:
	$(RM) $(TARGET)