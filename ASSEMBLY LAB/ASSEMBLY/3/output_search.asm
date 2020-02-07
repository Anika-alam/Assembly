
;output

output_search proc
    mov cx,temp
    XOR bx,bx 
    Xor ax,ax
    
    loop2:
    
    ;mov W[bx],temp1
		
    mov ah,02
    mov dx,W[bx]
    int 21h

    mov ah,0
    add bx,12        
    loop loop2 
    
    
    
endp
ret



