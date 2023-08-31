# purpose: 	This program finds the maximum number of a 
#	   	set of data items
#
# variables:	The registers have the following uses:
#  
#  %rax - Holds the index of the data item being examined
#  %rdi - Largest data item found
#  %rbx - Current data item
#  
#  The following memory locations are used:
#
#  data_items - contains the item data. A 0 is used 
#		to terminate the data

.section .data

data_items:					# These are the data items
.quad 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
_start:
 movq $0,			%rax		# move 0 into the index register %rax
 movq data_items(, %rax, 8), 	%rbx		# load the first item of data
 movq %rbx, 			%rdi		# since this is the first item, %rdi
						# is the biggest

start_loop:
 cmpq $0, 			%rbx		# check to see if we've hit the end
 je loop_exit
 incq %rax					# load next value
 movq data_items(, %rax, 8),	%rbx
 cmpq %rdi, 			%rbx		# compare value
 jle start_loop					# jump to loop beginning if the new 
						# one isn't bigger
 movq %rbx, 			%rdi		# move the value as the largest
 jmp start_loop					# jump to loop beginning

loop_exit:
 # %rdi is the status code for the exit system call
 # and it already has the maximum number
 movq $60, 			%rax		# 60 is the exit syscall
 syscall
 
 
