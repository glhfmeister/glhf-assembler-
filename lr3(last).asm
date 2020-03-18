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
        mov ax,1278h ;v AX 1278
        mov di,ax ; soderzh AX v DI
        xchg al,ah ;obmen starsh i mladsh v AX
        mov si, word ptr [bnm+2] ;star slovo v si
        mov di, word ptr [bnm+0] ;mlad slovo v di
        mov dx,per1 ; -480 v DX
        push si ;obmen soderzhimogo
        push di ;obmen soderzhimogo
        pop si ;obmen soderzhimogo
        pop di ;obmen soderzhimogo
        mov dl,bh ;starsh BX v mladsh DX
        mov ah,9
        mov dx,offset mes
        int 21h
        mov ah,7
        mov ax,4c00h
        int 21h
code ends
end main