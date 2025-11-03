mov ax, 0FFFFh
mov bx,1
mov cx,5
jmp shift_loop
exit:
mov dx,ax
shift_loop:
add ax,ax
add bx,bx
dec cx
jnz shift_loop
jmp exit
