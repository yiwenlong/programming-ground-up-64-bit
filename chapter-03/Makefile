exit:
	mkdir -p ./build
	as -o ./build/exit.o exit.s
	ld -o ./build/exit ./build/exit.o

exit-debug:
	mkdir -p ./build
	as -g -o ./build/exit.o exit.s
	ld -o ./build/exit-debug ./build/exit.o


maximum:
	mkdir -p ./build
	as -o ./build/maximum.o maximum.s
	ld -o ./build/maximum ./build/maximum.o

clean:
	rm -fr ./build
