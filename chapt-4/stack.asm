mov ah, 0x0e                        ;tty mode

mov bp, 0x8000
mov sp, bp                          ;top at base when stack is empty

push 'H'
push 'e'
push 'l'

pop bx
mov al, bl
int 0x10
pop bx
mov al, bl
int 0x10
pop bx
mov al, bl
int 0x10

; data that has been pop'd from the stack is garbage now
mov al, [0x8000]
int 0x10

exit: 
    jmp $

times 510-($-$$) db 0
db 0x55,0xaa
