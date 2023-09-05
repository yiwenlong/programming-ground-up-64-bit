.section .text

.globl factorial
.type factorial, @function
factorial:
  pushq	%rbp
  movq	%rsp,		%rbp

  movq	%rdi,		%rax
  cmpq	$1,		%rdi
  je	end_factorial
 
  pushq	%rdi
  decq	%rax
  movq	%rax,		%rdi
  call	factorial
  
  popq	%rdi
  imulq	%rdi,		%rax

end_factorial:
  movq	%rbp,		%rsp
  popq	%rbp
  ret

