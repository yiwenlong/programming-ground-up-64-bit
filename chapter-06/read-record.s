.include linux.s 
.include record-def.s 

# PROPOSE:  This function read record from the file
#           descriptor
#
# INPUT:    The file descriptor and a buffer
#           %rsi:   the file descriptor
#           %rdi:   the pointer of the buffer
#
# OUTPUT:   The function writes the data to the buffer
#           and return a status code
#           %rax:   the status code
# 

.section .text
.globl read_record
.type read_record, @function
read_record:
    # the file descriptor already in %rdi
    # the buffer already in %rsi
    movq    $RECORD_SIZE,       %rdx
    movq    $SYS_READ,          %rax
    syscall
    
    ret 

