.model small
.stack 100h
.data
rem db ?
quo db ?
.code
main proc
    
    mov bl,2
    mov al,3
    mul bl
    mov dx,ax
    add dx,48
    mov ah,2
    int 21h
    mov ah,4ch
    int 21h
    
    main endp
end main

    





