data    segment ;??????? ??????
message db 'Hello$' 
mes     db 'Korobeynikov$'
per1    dw -480
bnm     dd 33355566
data ends
stk  segment stack
    db 256 dup('?') 
stk ends
code segment
main:
    assume cs:code,ds:data,ss:stk
        mov ax,data
        mov ds,ax
        mov ax,1278h
        mov di,ax
        xchg al,ah
        mov dx, word ptr [bnm+2]
        mov bx, word ptr [bnm+0]
        mov dx,per1
        push si
        mov si,di
        mov dl,bl
        mov ah,9
        mov dx,offset mes
        int 21h
        mov ah,7
        mov ax,4c00h
        int 21h
code ends
end main