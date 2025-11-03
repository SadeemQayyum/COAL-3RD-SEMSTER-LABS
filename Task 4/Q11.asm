mov ax, 4
mov bx,4
cmp ax, bx
jz move
jnz exit
move:
mov dx,3
exit:
mov ax, 0x4c00
int 0x21