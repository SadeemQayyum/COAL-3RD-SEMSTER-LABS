.model small
.stack 100h
.data
evenn db "Even Number$"
odd db "Odd Number$"
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,1
    int 21h
    mov bl,2
    div bl
    
    cmp ah,0
    je evennumber
    
    mov dx,10
    mov ah,2
    int 21h
    mov dx,13
    mov ah,2
    int 21h
    mov dx,offset odd
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    evennumber:
        mov dx,10
        mov ah,2
        int 21h
        mov dx,13
        mov ah,2
        int 21h
        mov dx,offset evenn
        mov ah,9
        int 21h
        mov ah,4ch
        int 21h
        
    

    
    main endp
end main

    





