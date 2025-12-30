INCLUDE DOS.H
.MODEL SMALL
.STACK
.DATA
	STRING DB 3, 0, 3 DUP (?)
    N DB ?
    SUM DB 0
    MSG DB 'please input a number(2~20): $'
    CRLF DB 0Dh,0Ah,'$'
.CODE
main:   
	mov ax, @data
	mov ds, ax

	PRINT MSG
    INPUT STRING
    PRINT CRLF

    ; 將字串轉換成數字
    mov al, 0
    mov cx, 0
    mov cl, [STRING+1]
    lea si, STRING+2
    
convert_loop:
    mov dl, 10
    mul dl

    mov bl, [si]
    sub bl, '0'
    
    add al, bl
    
    inc si
    loop convert_loop
    
    mov N, al

    ; 計算從1加到N的總和
    mov bl, 1
	
SUM_LOOP:
    ; 輸出目前的加數
    mov ax, 0
	mov dh, bl
    cmp dh, 10
	jb SUM_LOOP_LESS10

    mov ax, 0
	mov al, dh
	mov dl, 10
	div dl
	mov dx, ax
	
	add dl, '0'
	PUTCHAR dl

SUM_LOOP_LESS10:
	mov dl, dh
	add dl, '0'
	PUTCHAR dl
    
    ; 將目前的加數加入總和
    add SUM, bl
	inc bl
	cmp bl, N
    ja END_LOOP

    PUTCHAR '+'
	jmp SUM_LOOP
END_LOOP:

    PUTCHAR '='
    ; 輸出總和
    mov dh, SUM

	cmp dh, 10
	jb LESS10
	cmp dh, 100
	jb LESS100

	mov ax, 0
	mov al, dh
	mov dl, 100
	div dl
	mov dx, ax
	
	add dl, '0'
	mov ah, 02h
	int 21h
	
LESS100:
	mov ax, 0
	mov al, dh
	mov dl, 10
	div dl
	mov dx, ax
	
	add dl, '0'
	mov ah, 02h
	int 21h

LESS10:
	mov dl, dh
	add dl, '0'
	mov ah, 02h
	int 21h

	mov ah, 4ch
	int 21h
END main
