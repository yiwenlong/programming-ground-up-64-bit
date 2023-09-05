power:
	as -o ./build/power.o power.s
	ld -o ./build/power ./build/power.o

call_power_func:
	gcc call_power_func.c power_func.s -o ./build/call_power_func

clean:
	rm -fr ./build
