[org 0x7c00]                ;offset for memory location

mov ah, 0x0e                ;tty mode *telitype mode 
mov bx, message             ;storing message in buffer
mov al, [bx]                ;pointer to the first character
int 0x10                    ;video interrupt 

printMessage: 
    inc bx
    mov al, [bx]
    cmp al,0
    je exit
    int 0x10
    jmp printMessage

exit:
    jmp $                       ;infinite loop 


message:
    db "Light Os !)", 0


times 510-($-$$) db 0       ;padding (extra space filled with zeroes)

db 0x55,0xaa                ;hex digits for boot sector