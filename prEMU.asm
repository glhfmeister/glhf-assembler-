data    segment
    a db 106
    b db -38
    c db -13
    chastn db '?'
    ost db '?'
data ends
stk  segment stack
    db 256 dup('?') 
stk ends
code segment
main:
    assume cs:code,ds:data,ss:stk
        mov ax,data
        mov ds,ax
        mov al,a
        cbw
        mov dx,ax
        mov al,b
        cbw     
        mov bx,ax
        mov ax,dx
        add ax,bx
        idiv c
        mov chastn,al
        mov ost, ah
        int 21h
        mov ax,4c00h
        int 21h
code ends
end main