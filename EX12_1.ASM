INCLUDE DOS.H
.MODEL SMALL
.STACK
.DATA
	STRING DB 6, 0, 6 DUP (?)
    N DW ?
    MSG DB 'please input a Nber(0~65535): $'
    CRLF DB 0Dh,0Ah,'$'
.CODE
main:   
	mov ax, @data
	mov ds, ax

	PRINT MSG
    INPUT STRING
    PRINT CRLF

    ; 輸出以輸入的數字
    mov bx, 0
    mov bl, [STRING+1]
    lea si, STRING+2
    mov byte ptr [si+bx], '$'
    
    PRINT STRING+2

    PUTCHAR '='

    ; 將字串轉換成數字
    mov ax, 0
    mov cx, 0
    mov bx, 0
    mov cl, [STRING+1]
    lea si, STRING+2
    
convert_loop:
    mov dx, 10
    mul dx

    mov bl, [si]
    sub bl, '0'
    
    add ax, bx
    
    inc si
    loop convert_loop
    
    mov N, ax

    ; 輸出二進位
    mov cx, 16
    mov bx, N
binary_loop:
    shl bx, 1
    jc output_one
    
    PUTCHAR '0'
    jmp continue_shift
output_one:
    PUTCHAR '1'

continue_shift:
    loop binary_loop

    ; 輸出八進位（16位 = 6個八進位數字）
    PUTCHAR 'B'
    PUTCHAR '='
    
    ; 第1位：bit 15
    mov ax, N
    mov cl, 15
    shr ax, cl
    and al, 1
    add al, '0'
    PUTCHAR al
    
    ; 第2位：bit 14-12
    mov ax, N
    mov cl, 12
    shr ax, cl
    and al, 00000111b
    add al, '0'
    PUTCHAR al
    
    ; 第3位：bit 11-9
    mov ax, N
    mov cl, 9
    shr ax, cl
    and al, 00000111b
    add al, '0'
    PUTCHAR al
    
    ; 第4位：bit 8-6
    mov ax, N
    mov cl, 6
    shr ax, cl
    and al, 00000111b
    add al, '0'
    PUTCHAR al
    
    ; 第5位：bit 5-3
    mov ax, N
    mov cl, 3
    shr ax, cl
    and al, 00000111b
    add al, '0'
    PUTCHAR al
    
    ; 第6位：bit 2-0
    mov ax, N
    and al, 00000111b
    add al, '0'
    PUTCHAR al
    PUTCHAR 'O'
    PUTCHAR '='

	; 輸出十六進位（16位 = 4個十六進位數字）
    ; 第1位：bit 15-12
    mov ax, N
    mov cl, 12
    shr ax, cl
    and al, 00001111b
    cmp al, 10
    jb hex1_less_a
    add al, 7
hex1_less_a:
    add al, '0'
    PUTCHAR al
    
    ; 第2位：bit 11-8
    mov ax, N
    mov cl, 8
    shr ax, cl
    and al, 00001111b
    cmp al, 10
    jb hex2_less_a
    add al, 7
hex2_less_a:
    add al, '0'
    PUTCHAR al
    
    ; 第3位：bit 7-4
    mov ax, N
    mov cl, 4
    shr ax, cl
    and al, 00001111b
    cmp al, 10
    jb hex3_less_a
    add al, 7
hex3_less_a:
    add al, '0'
    PUTCHAR al
    
    ; 第4位：bit 3-0
    mov ax, N
    and al, 00001111b
    cmp al, 10
    jb hex4_less_a
    add al, 7
hex4_less_a:
    add al, '0'
    PUTCHAR al
    PUTCHAR 'H'

	mov ah, 4ch
	int 21h
END main
