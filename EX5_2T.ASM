.MODEL SMALL
.STACK
.DATA
	N1 DB 1
	N2 DB 10
	SUM DB ?

.CODE
main:   
	mov ax, @data
	mov ds, ax

	mov dl, N1
	
sum_loop:
	add SUM, dl
	inc dl
	cmp dl, N2
	jle sum_loop

	mov ah, 4ch
	int 21h
END main
