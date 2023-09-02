toupper:
	mkdir -p ./build
	as -o ./build/toupper.o toupper.s
	ld -o ./build/toupper ./build/toupper.o

toupper-debug:	
	mkdir -p ./build
	as -g -o ./build/toupper.o toupper.s
	ld -o ./build/toupper ./build/toupper.o
	gdb ./build/toupper
