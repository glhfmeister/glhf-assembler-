data    segment
    mes db 'Input first word -->$'
    
buf db 20
    db ?
    db 256 dup('?')
    
    mes1 db 10,13,'input second word$'
    end1 db 10,13,'$'
data ends
stk  segment stack
    db 256 dup('?') 
stk ends
code segment
main:
    assume cs:code,ds:data,ss:stk
        mov ax,data
        mov ds,ax
        
        mov ah,9
        mov dx,offset mes
        int 21h
        mov cx,offset end1
        
        mov ah,9
        lea dx,buf
        int 21h
        mov cx,offset end1
        
        mov ax,offset mes1
        int 21h
        mov cx,offset end1
        
        lea ax,buf
        int 21h
        mov cx,offset end1
        
        mov ax,offset buf
        int 21h
        mov cx,offset end1
        
        ;mov bl,buf+0
        mov dx,offset buf+0
        int 21h
        
        mov ax,4c00h
        int 21h
code ends
end main