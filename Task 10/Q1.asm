.model small
.stack 100h
.data


username db 30
         db ?
         db 30 dup(?)
         
usersap db 20
        db ?
        db 20 dup(?)
       
usercourse db 40 
           db ?
           db 40 dup(?)



nameMsg db "Enter your Name: $"
sapMsg  db "Enter your SAP ID: $"
courseMsg db "Enter your Course: $"


.code

;NewLine Function
newline proc
    mov dl,13      
    mov ah,2
    int 21h

    mov dl,10     
    mov ah,2
    int 21h
    ret
newline endp


main proc
    mov ax,@data
    mov ds,ax

    ;Name Input 

    mov dx,offset nameMsg
    mov ah,9
    int 21h

    call newline

    mov dx,offset username
    mov ah,0Ah
    int 21h

    ; ADD '$' Terminator
    mov bl, username+1
    mov byte ptr username+2[bx], '$'

    call newline



    ;Sap Input               
    mov dx,offset sapMsg
    mov ah,9
    int 21h

    call newline

    mov dx,offset usersap
    mov ah,0Ah
    int 21h

    ; ADD '$' Terminator
    mov bl, usersap+1
    mov byte ptr usersap+2[bx], '$'

    call newline



  ;Course Input 

    mov dx,offset courseMsg
    mov ah,9
    int 21h

    call newline

    mov dx,offset usercourse
    mov ah,0Ah
    int 21h

 
    mov bl, usercourse+1
    mov byte ptr usercourse+2[bx], '$'

    call newline



; Print Result


    ; Print name
    call newline
    mov dx,offset username+2
    mov ah,9
    int 21h
    call newline

    ; Print SAP
    mov dx,offset usersap+2
    mov ah,9
    int 21h
    call newline

    ; Print course
    mov dx,offset usercourse+2
    mov ah,9
    int 21h
    call newline


    mov ah,4Ch
    int 21h

main endp
end main