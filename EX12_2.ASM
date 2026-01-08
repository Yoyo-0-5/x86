INCLUDE DOS.H
.MODEL SMALL
.STACK
.DATA
	STRING DB 30, 0, 30 DUP (?)
    MSG1 DB 'please input a string: $'
    MSG2 DB 'The new string is: $'
    CRLF DB 0Dh,0Ah,'$'

.CODE
main:   
	mov ax, @data
	mov ds, ax

	PRINT MSG1
    INPUT STRING
    PRINT CRLF

    ; 轉換大寫字母為小寫
    lea si, [STRING+2]
    mov cl, [STRING+1]
    xor ch, ch              ; CX = 字串長度

convert_loop:
    mov al, [si]            ; 載入字元
    cmp al, 'A'
    jb skip_convert
    cmp al, 'Z'
    ja skip_convert
    add al, 20h             ; 轉換為小寫
    mov [si], al            ; 寫回記憶體
skip_convert:
    inc si                  ; 移動到下一個字元
    loop convert_loop       ; CX 自動遞減，為 0 時結束

    mov al, '$'
    mov [si], al

    ; 輸出轉換後的字串
    PRINT MSG2
    PRINT STRING+2

	mov ah, 4ch
	int 21h
END main

