
;output

output_search_minor proc
    mov cx,temp
    XOR bx,bx 
    Xor ax,ax
    mov bx,8  
    mov temp,8
    loop3:
    
    ;mov W[bx],temp1
		
    mov ah,02
    mov dx,W[bx]
    int 21h

    mov ah,0
    ;sub temp,2
    add bx,8       
    loop loop3 
    
    
    
endp
ret
