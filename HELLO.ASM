.model small                                                                                                                                                                        .model small

.data
mssg db 10,13,"HelloWorld$"
mssg1 db 10,13,"Vit$"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

.code
mov ax, @data         ;initialization of data segment                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
mov ds, ax

mov ah, 09h
lea dx, mssg
int 21h

mov ah, 09h
lea dx, mssg1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
int 21h

mov ah,4ch
int 21h

end
