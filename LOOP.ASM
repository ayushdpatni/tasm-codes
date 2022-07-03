.model small
.data
.code

mov cx,9
mov bl,1
P: mov dl,bl
   add dl,48

   mov ah,02h
   int 21h
   mov dl,32
   mov ah,02h
   int 21h
   inc bl

   loop P

mov ah,ch
int 21h
end
