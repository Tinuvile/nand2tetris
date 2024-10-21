// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

@tmp  
M=0           // 初始化 tmp 为 0，用于存储中间结果  

@i  
M=0           // 初始化 i 为 0，作为计数器  

(LOOP)  
@i  
D=M           // 将 i 的值加载到 D 寄存器  
@R0  
D=D-M         // D = i - R0：检查 i 是否小于 R0  
@MOVE  
D;JEQ         // 如果 i 等于 R0，跳转到 MOVE 标签  

@R1  
D=M           // 将 R1 的值加载到 D 寄存器  
@tmp  
M=M+D         // tmp = tmp + R1：累加 R1 的值到 tmp（即乘积）  

@i  
M=M+1         // i = i + 1：增加计数器  
@LOOP  
0;JMP         // 循环回到 LOOP 继续执行  

(MOVE)  
@tmp  
D=M           // 将 tmp 的值加载到 D 寄存器  
@R2  
M=D           // 将 D 的值存储到 R2，完成乘法操作  

(END)  
@END  
0;JMP         // 程序结束，进行无限循环