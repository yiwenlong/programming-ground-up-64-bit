.section .text

.globl power
# purpose:	This function is used to compute
# 		the value of a number raised to 
#		a power.
#
# input:	First argument 	- %rdi
#		Second argument - %rsi
#
# output:	Will give the result as a return value
#
# notes:	The power must be 1 or greater
#
# variables:	%rbx - holds the base number
#		%rcx - holder the power
#
#		-8(%rbp) - holds the current result
#		
# 		%rax is used for temporary storage
#
.type power, @function
power:
  pushq	%rbp					# save old base pointer
  movq	%rsp,		%rbp			# make stack pointer the base pointer
  subq	$8,		%rsp			# get room for out local storage

  movq	%rdi,		%rbx			# put first argument in %rbx
  movq	%rsi,		%rcx			# put second argument in %rcx

  movq	%rbx,		-8(%rbp)		# store current result

power_loop_start:
  cmpq	$1,		%rcx			# if the power is 1, we are done
  je	end_power
  movq	-8(%rbp),	%rax			# move the current result into %rax
  imulq	%rbx,		%rax			# multiply the current result by 
						# the base number
  movq	%rax,		-8(%rbp)		# store the current result

  decq 	%rcx					# decrease the power
  jmp 	power_loop_start			# run for the next power

end_power:
  movq	-8(%rbp),	%rax			# return value goes in %rax
  movq	%rbp,		%rsp			# restore the stack pointer
  popq	%rbp					# restore the basse pointer
  ret
