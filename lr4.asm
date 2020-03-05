masm
model small
.stack 256 
.data
mes db 'Input your second name -->$'
buf db 20
    db ?
    db 256 dup('?')
mes1 db 10,13,'input your name$'
mes2 db 10,13,'input your middle name$'
.code
begin : 
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,mes
    int 21h
    mov ah,10
    lea dx,buf
    int 21h
    mov bl,buf+1
    mov bh,0
    mov buf[bx+2],'$'
    mov ah,9
    lea dx,mes1
    int 21h
    mov ah,10
    lea dx,buf+2
    int 21h
end begin