.section .text
.code32

.globl outb
.globl inb 
.globl outw
.globl inw


outb:
  push %ebp
  mov %esp, %ebp
  
  # do not need to subtract anything cause this function
  # has no local variables on its frame
  
  mov 12(%ebp), %edx # PORT NUMBER
  mov 8(%ebp), %eax # DATA
  out %al, %dx 

  mov %ebp, %esp
  pop %ebp

  ret

inb:

  push %ebp
  mov %esp, %ebp

  # clearing the result register
  xor %eax, %eax

  mov 8(%ebp), %edx 
  in %dx, %al

  mov %ebp, %esp
  pop %ebp

  ret

outw:
  push %ebp
  mov %esp, %ebp

  mov 12(%ebp), %edx # PORT NUMBER
  mov 8(%ebp), %eax # DATA

  out %ax, %dx

  mov %ebp, %esp
  pop %ebp

  ret

inw: 
  push %ebp
  mov %esp, %ebp

  xor %eax, %eax

  mov 8(%ebp), %edx # PORT NUMBER
  in %dx, %ax # moving content of port dx into ax 

  mov %ebp, %esp
  pop %ebp
  
  ret

