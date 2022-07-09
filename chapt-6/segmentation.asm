mov ah, 0x0e    ; telitype mode 

mov al, [the_secret]
int 0x10

call printnl

mov bx, 0x7c0 
mov ds, bx ; telling the cpu that the data starts at bx

; after this the data is offset by 'ds' implicitly 

mov al, [the_secret]
int 0x10

call printnl

mov al, [es:the_secret]
int 0x10

call printnl

mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
int 0x10

jmp $

the_secret: 
    db "z"


printnl:
    pusha 
    mov al, 0x0a  ; new line
    int 0x10

    mov al, 0x0d  ; carriage return is also required for new line to work 
    int 0x10
    popa
    ret


times 510-($-$$) db 0
db 0x55,0xaa
