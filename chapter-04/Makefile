power:
	as -o ./build/power.o power.s
	ld -o ./build/power ./build/power.o

call_power_func:
	gcc call_power_func.c power_func.s -o ./build/call_power_func

call_factorial:
	gcc call_factorial.c factorial.s -o ./build/call_factorial

clean:
	rm -fr ./build
