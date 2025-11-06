.MODEL SMALL
.STACK
.DATA
	n1 db 25
	n2 db 36
	n3 db 57
.CODE
main:   
	mov ax, @data
	mov ds, ax

	mov dl, n1
	xchg dl, n2
	xchg dl, n3
	xchg dl, n1
	
	mov ah, 4ch
	int 21h
END main