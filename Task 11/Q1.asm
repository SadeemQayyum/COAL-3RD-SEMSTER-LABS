org 100h

mov ax,0012h
int 10h

mov al,15


mov cx,260
mov dx,60
mov bx,400
OF1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz OF1

mov cx,459
mov dx,60
mov bx,400
OF2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz OF2

mov cx,260
mov dx,60
mov bx,200
OF3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz OF3

mov cx,260
mov dx,500
mov bx,200
OF4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz OF4


mov cx,270
mov dx,70
mov bx,380
IN1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz IN1

mov cx,449
mov dx,70
mov bx,380
IN2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz IN2

mov cx,270
mov dx,70
mov bx,180
IN3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz IN3

mov cx,270
mov dx,490
mov bx,180
IN4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz IN4


mov cx,285
mov dx,130
mov bx,150
TL1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TL1

mov cx,349
mov dx,130
mov bx,150
TL2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TL2

mov cx,285
mov dx,130
mov bx,65
TL3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TL3

mov cx,285
mov dx,280
mov bx,65
TL4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TL4


mov cx,290
mov dx,135
mov bx,140
TLD1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TLD1

mov cx,344
mov dx,135
mov bx,140
TLD2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TLD2

mov cx,290
mov dx,135
mov bx,55
TLD3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TLD3

mov cx,290
mov dx,275
mov bx,55
TLD4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TLD4


mov cx,370
mov dx,130
mov bx,150
TR1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TR1

mov cx,434
mov dx,130
mov bx,150
TR2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TR2

mov cx,370
mov dx,130
mov bx,65
TR3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TR3

mov cx,370
mov dx,280
mov bx,65
TR4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TR4


mov cx,375
mov dx,135
mov bx,140
TRD1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TRD1

mov cx,429
mov dx,135
mov bx,140
TRD2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz TRD2

mov cx,375
mov dx,135
mov bx,55
TRD3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TRD3

mov cx,375
mov dx,275
mov bx,55
TRD4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz TRD4


mov cx,285
mov dx,310
mov bx,150
BL1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BL1

mov cx,349
mov dx,310
mov bx,150
BL2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BL2

mov cx,285
mov dx,310
mov bx,65
BL3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BL3

mov cx,285
mov dx,460
mov bx,65
BL4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BL4


mov cx,290
mov dx,315
mov bx,140
BLD1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BLD1

mov cx,344
mov dx,315
mov bx,140
BLD2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BLD2

mov cx,290
mov dx,315
mov bx,55
BLD3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BLD3

mov cx,290
mov dx,455
mov bx,55
BLD4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BLD4


mov cx,370
mov dx,310
mov bx,150
BR1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BR1

mov cx,434
mov dx,310
mov bx,150
BR2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BR2

mov cx,370
mov dx,310
mov bx,65
BR3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BR3

mov cx,370
mov dx,460
mov bx,65
BR4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BR4


mov cx,375
mov dx,315
mov bx,140
BRD1:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BRD1

mov cx,429
mov dx,315
mov bx,140
BRD2:
    mov ah,0Ch
    int 10h
    inc dx
    dec bx
    jnz BRD2

mov cx,375
mov dx,315
mov bx,55
BRD3:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BRD3

mov cx,375
mov dx,455
mov bx,55
BRD4:
    mov ah,0Ch
    int 10h
    inc cx
    dec bx
    jnz BRD4


mov al,14

mov dx,285
mov bx,20
H1:
    mov cx,272
    mov si,8
H2:
        mov ah,0Ch
        int 10h
        inc cx
        dec si
        jnz H2
    inc dx
    dec bx
    jnz H1


mov al,15
mov cx,260
mov dx,60
mov bx,20
S1:
    mov ah,0Ch
    int 10h
    inc cx
    dec dx
    dec bx
    jnz S1

mov cx,459
mov dx,60
mov bx,20
S2:
    mov ah,0Ch
    int 10h
    dec cx
    dec dx
    dec bx
    jnz S2


mov ah,0
int 16h

mov ax,0003h
int 10h
ret
