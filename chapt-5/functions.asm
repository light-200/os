[org 0x7c00]                ; offset for bootsector code 


mov bx, smsg
call print 
call println

mov bx, message
call print
call println


jmp $

%include "print.asm"

message: 
    db "some string", 0    

smsg: 
    db "starting program", 0

times 510-($-$$) db 0
db 0x55,0xaa
