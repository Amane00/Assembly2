# input file name : example.txt
.globl __start

.rodata
  O_RDWR:  .word 0b0000100 #Open the file so that it can be read from and written to
  O_CREAT: .word 0b0100000 #If the file does not exist, create it
  
  # Depends on each computer where example.txt exits
   
  msg1: .asciz "**The file descriptor number: "
  msg2: .asciz "**Program terminated normally."
  
.data
  Input: .space 1024 #Memory that holds data read from a file temporarily

.text
__start:
  # Print msg1 by using ecall 4:print string
  li a0, 4
  la a1, msg1
  ecall

  #Open the file by using ecall 13
  li a0, 13
  la a1, path #Load the address of the file path in path into register a1
  lw a2, O_RDWR
  lw t0, O_CREAT
  or a2, a2, t0 
  #OR operation of O_RDWR and O_CREAT flags in register a2 
  # and the file to be opened in read-write mode or if it does not exist, new one is created
  ecall
  
  # Move file descriptor a0 to t1 and print the num
  mv t1, a0 #t1:num
  li a0, 1
  mv a1, t1# move to a1 to print
  ecall

  # Read from the file by using ecall 14
  li a0, 14
  mv a1, t1 #Specified file descriptor to be read from the file
  la a2, Input #Load the address indicated by Input into a2
  # The data will be stored a2
  li a3, 1024 #Set buffer size to 1024 bytes
  ecall
  
  #Print newlinw by using ecall 11
  li a0, 11
  li a1, '\n'
  ecall
  
  # Print data as character 
  addi x25, x25, 10 # Use ascii 10 to check there is newline or not

Print:
  lb t1, 0(a2)  # Load a byte from the Input(a2)

  # if byte is LF(newline) go to Newline
  beq t1,x25, Newline 
  
  #if byte is 0(NULL) it means the end of Input so go to Exit
  beq t1,x0, Exit
  
 #Print by using ecall 11
  li a0, 11
  mv a1, t1
  ecall
    
  #move to next byte (i++)
  addi a2, a2, 1
  j Print
    
Newline:
  #if these is newline in Input then output two newlines
  li a0, 11
  li a1, '\n'
  ecall
  
  #do i++ and back to Print
  addi a2, a2, 1
  j Print 
    
Exit:
  li a0, 11
  li a1, '\n'
  ecall

  #Print msg2
  li a0, 4
  la a1, msg2
  ecall

  # Exit
  li a0, 10
  ecall