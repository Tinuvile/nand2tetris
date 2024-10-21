// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@SCREEN      // 将屏幕的基地址加载到 A 寄存器  

(LOOP)       // 无限循环开始  
    @KBD     // 获取键盘输入地址  
    D=M      // 读取键盘输入到 D 寄存器  
    @BLACK   // 检查键盘输入是否大于 0  
    D;JGT    // 如果 D > 0，跳转到 BLACK  
    @WHITE   // 如果没有按键，则跳转到 WHITE  
    0;JMP    // 继续循环  

(WHITE)      // 清屏部分  
    @i       // 使用变量 i 作为计数器  
    M=0      // 初始化 i 为 0  
(WHITE_LOOP)  
    @8192    // 8192 是屏幕的总像素数量  
    D=A  
    @i       // 加载计数器 i 的值  
    D=D-M    // D = 8192 - i  
    @CHECK_WHITE  
    D;JEQ    // 如果 i == 8192，结束循环  

    @i       // 加载计数器 i  
    D=M  
    @SCREEN   // 计算屏幕地址  
    A=A+D     // A = SCREEN + i  
    M=0       // 将当前像素值设置为 0（白色）  
    
    @i  
    M=M+1     // i++  
    @WHITE_LOOP  
    0;JMP     // 返回循环  

(BLACK)      // 黑屏部分  
    @i       // 使用变量 i 作为计数器  
    M=0      // 初始化 i 为 0  
(BLACK_LOOP)  
    @8192    // 8192 是屏幕的总像素数量  
    D=A  
    @i       // 加载计数器 i 的值  
    D=D-M    // D = 8192 - i  
    @CHECK_BLACK  
    D;JEQ    // 如果 i == 8192，结束循环  

    @i       // 加载计数器 i  
    D=M  
    @SCREEN   // 计算屏幕地址  
    A=A+D     // A = SCREEN + i  
    M=-1      // 将当前像素值设置为 1（黑色）  

    @i  
    M=M+1     // i++  
    @BLACK_LOOP  
    0;JMP     // 返回循环  

(CHECK_WHITE)  // 检查是否从 WHITE 退出  
    @LOOP        // 返回主循环  

(CHECK_BLACK)  // 检查是否从 BLACK 退出  
    @LOOP        // 返回主循环  