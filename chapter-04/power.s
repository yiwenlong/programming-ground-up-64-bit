# purpose:	Program to illustrate how functions work
#		This program will compute the value of 
#		2^3 + 5 ^2
#

# Everything in the main program is stored in registers,
# so the data section doesn't have anything.
.section .data

.section .text

.globl _start
_start:
  pushq	$3					# push second argument
  pushq $2					# puth first argument
  call 	power					# call the function
  addq	$16,		%rsp			# move the stack pointer back 

  pushq	%rax					# save the first answer before
						# calling the next function

  pushq $2					# push second argument
  pushq	$5					# push first argument
  call	power					# call the function
  addq 	$16,		%rsp			# move the stack pointer back

  popq 	%rdi					# The seconde answer is already 
						# in %rax. We save the 
						# first answer onto the stack,
						# so now we can just pop it 
						# out into %rdi

  addq 	%rax,		%rdi			# add them together 
						# the result is in %rdi
  
  movq	$60,		%rax			# exit syscall
  syscall 

# purpose:	This function is used to compute
# 		the value of a number raised to 
#		a power.
#
# input:	First argument - the base number
#		Second argument - the power to raise it to
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

  movq	16(%rbp),	%rbx			# put first argument in %rbx
  movq	24(%rbp),	%rcx			# put second argument in %rcx

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
