.MODEL SMALL
.STACK
.DATA
	SEA DB 51, 32, 23

.CODE
main:   
	mov ax, @data
	mov ds, ax

	mov cx, 3
    dec cx
outer_loop:
    push cx
    lea si, SEA
    mov cx, 2
inner_loop:
    mov dl, [si]
    mov bl, [si+1]
    cmp dl, bl
    jle no_swap
    ; 交換
    mov [si], bl
    mov [si+1], dl
no_swap:
    inc si
    loop inner_loop
    pop cx
    loop outer_loop

	mov ah, 4ch
	int 21h
END main