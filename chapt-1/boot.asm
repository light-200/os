; Infinite loop (e9 fd ff)
jmp $

; Fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; Magic number
db 0x55,0xaa 