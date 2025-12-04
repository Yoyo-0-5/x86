.MODEL SMALL
.STACK
.DATA
	N1 db 20
	N2 db 35
	ans db ?
.CODE
main: 
	mov ax, @data
	mov ds, ax

	; operation
	mov dl, N1
	add dl, N2
	mov ans, dl

	; output '20'
	mov ax, 0
	mov al, N1
	mov dl, 10
	div dl
	mov dx, ax
	
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, dh
	add dl, '0'
	mov ah, 02h
	int 21h

	; output '+'
	mov dl, '+'
	mov ah, 02h
	int 21h

	; output '35'
	mov ax, 0
	mov al, N2
	mov dl, 10
	div dl
	mov dx, ax
	
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, dh
	add dl, '0'
	mov ah, 02h
	int 21h

	; output '='
	mov dl, '='
	mov ah, 02h
	int 21h

	; output 'ans'
	mov ax, 0
	mov al, ans
	mov dl, 10
	div dl
	mov dx, ax
	
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, dh
	add dl, '0'
	mov ah, 02h
	int 21h

	mov ah, 4ch
	int 21h
END main