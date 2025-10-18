# Assembly2
Assembly language and computer organization

## Read and Print a File

🧩 Project Overview
This RISC-V assembly program reads the contents of a small ASCII text file (example.txt) and displays it.
The program also prints out the file descriptor number and a termination message, showing how system-level file operations work in RISC-V assembly.

⚙️ Program Purpose
The main purpose of this program is to show how to use RISC-V system calls to:
- Open and read a file
- Display file content on the console
- Handle file descriptors
- Properly terminate a program

By using different system call numbers (1024, 63, 64, 93, etc., depending on Jupiter’s system call mapping), the program demonstrates:
- File opening and reading
- Buffer handling
- Writing data to the screen
- Exiting the program cleanly

🧠 Program Flow
1. Open the input file example.txt and obtain its file descriptor number.
2. Print the line:
   `The file descriptor number: [number]`
3. Read the file’s content (up to 1024 bytes) into a memory buffer.
4. Display the exact file content on the screen — line by line or as one continuous block.
5. Print the closing message:
  `Program is terminated normally.`

💻 Example Interaction
`example.txt` contains
```
-4584 -88 -90 -55 -32 -12 
123 54 -90 55 
636 129 65 
```
Output will be:
```
** The file descriptor number: NUM
-4584 -88 -90 -55 -32 -12 
123 54 -90 55 
636 129 65 
** Program is terminated normally.
```

🧩 Key Concepts Demonstrated
- System calls for file I/O (open, read, write, exit)
- Use of registers for passing syscall parameters
- Memory buffer management for file reading
- String and console output using ecall
- Program termination with a clean exit status
