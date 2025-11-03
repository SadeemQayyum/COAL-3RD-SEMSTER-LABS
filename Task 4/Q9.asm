mov ax,6
cmp ax,5
js exit
mov ax,1
exit:
mov ax, 0x4c00
int 0x21