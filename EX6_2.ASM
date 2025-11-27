.MODEL SMALL
.STACK
.DATA
	NUM db 207

.CODE
main:   
	mov ax, @data
	mov ds, ax

	; output NUM in decimal format
	mov dh, NUM

	cmp dh, 10
	jb LESS10
	cmp dh, 100
	jb LESS100

	; NUM >= 100
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

	; output '='
	mov dl, '='
	mov ah, 02h
	int 21h

	; output NUM in octal format
	mov dl, NUM
	shr dl, 6
	add dl, '0'
	mov ah, 02h
	int 21h
	mov dl, NUM
	and dl, 00111000b
	shr dl, 3
	add dl, '0'
	mov ah, 02h
	int 21h
	mov dl, NUM
	and dl, 00000111b
	add dl, '0'
	mov ah, 02h
	int 21h

	; output 'O'
	mov dl, 'O'
	mov ah, 02h
	int 21h

	; output '='
	mov dl, '='
	mov ah, 02h
	int 21h

	; output NUM in hexadecimal format
	mov dl, NUM
	and dl, 11110000b
	shr dl, 4
	cmp dl, 10
	jb HEX_LESS_A
	add dl, 7
HEX_LESS_A:
	add dl, '0'
	mov ah, 02h
	int 21h

	mov dl, NUM
	and dl, 00001111b
	cmp dl, 10
	jb HEX_LESS_A2
	add dl, 7
HEX_LESS_A2:
	add dl, '0'
	mov ah, 02h
	int 21h

	; output 'H'
	mov dl, 'H'
	mov ah, 02h
	int 21h


	mov ah, 4ch
	int 21h
END main