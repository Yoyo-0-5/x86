.MODEL SMALL
.STACK
.DATA
	N1 db 3
	N2 db 2
	ans db ?
.CODE
begin:
	mov ax, @data
	mov ds, ax

	; ¹Bºâ
	mov dl, N1
	add dl, N2
	mov ans, dl
	
	; ¿é¥X
	mov dl, N1
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, '+'
	mov ah, 02h
	int 21h

	mov dl, N2
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, '='
	mov ah, 02h
	int 21h

	mov dl, ans
	add dl, '0'
	mov ah, 02h
	int 21h

	mov ah, 4ch
	int 21h
END begin