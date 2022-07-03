.model small

.data
n1 db 17h
n2 db 02h
p dw ?

.code
mov ax, @data
mov ds, ax

mov ah,00h
mov al,n1
mul n2
mov p,ax

mov ah,4ch
int 21h

end
