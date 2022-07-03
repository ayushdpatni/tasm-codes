        .model small

.data
a db 10,13, "Enter FIRST no.:$"
b db 10,13, "Enter SECOND no.:$" 
c db 10,13, "ADDITION IS :$"

.code
mov ax,@data
mov ds,ax

mov ah,09h
lea dx,a
int 21h

mov ah,01h
int 21h

mov bl,al
sub bl,30h
cmp bl,09h
JLE X1
sub bl,07h

X1:mov ah,09h
lea dx,b
int 21h

mov ah,01h
int 21h

mov bh,al
sub bh,30h
                                                                                                                                                
mov ah,09h
lea dx,c
int 21h

add bh,bl
add bh,30h
mov dl,bh
cmp dl,39h
JLE X2
add dl,07h

X2:mov ah,02h
int 21h

mov ah,4ch
int 21h
end






















        
