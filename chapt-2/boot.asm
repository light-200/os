mov ah, 0x0e
mov al, 'A'
int 0x10

alphabet: 
    inc al
    cmp al, 'Z' + 1
    jge exit
    test al, 1
    jz small
    int 0x10
    jmp alphabet

small: 
    add al, 32
    int 0x10
    sub al, 32
    jmp alphabet

exit:
    ; Infinite loop (e9 fd ff)
    jmp $

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; Magic number
db 0x55,0xaa 