mov ax,5
mov bx,2
MOV CX,ax
jmp calculate
modify:
sub ax,bx
mov dx,ax
jmp Finish
calculate:
add ax,bx
jmp modify
Finish:

