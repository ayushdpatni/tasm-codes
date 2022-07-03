.model small

.data
mssg db 10,13,"Hello Ayush!$"
mssg1 db 10,13,"12011056,Roll:46$"
num1 db 05h

.code
mov ax,@data;
mov ds, ax

mov ah,09h
lea dx, mssg
int 21h

mov ah, 09h
lea dx, mssg1
int 21h

mov al, num1
mov bl,04h
add al,bl
mov ah,4ch
int 21h
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
