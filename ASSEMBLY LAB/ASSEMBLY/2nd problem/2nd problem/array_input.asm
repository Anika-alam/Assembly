array_input proc
    mov cx,h4
    XOR bx,bx
    
    loop1:
    
    mov ah,01
    int 21h
    mov ah,0 
   
    
    mov W[bx],ax
    add bx,2        
    loop loop1 
    
    
    
endp
ret