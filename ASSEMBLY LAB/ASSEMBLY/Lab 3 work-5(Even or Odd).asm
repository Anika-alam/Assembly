 
.MODEL SMALL 
ORG 100H
.STACK 100H
.DATA  
 
 shohag1:  db "Even",0dh,0ah,24h
 shohag2:  db "ODD",0dh,0ah,24h
 
.CODE
MAIN PROC
 
  
   
   MOV BL,8
           
          
   L:
   
    dec bl
    dec bl 
    
    cmp bl,1
    JE L1  
    
    cmp bl,0
    JE  L2
    jmp L 
   
     
   L2:
   mov ah,9
   mov dx,shohag1
   int 21h
   jmp exit 
   
   
   L1:
    
   mov ah,9
   mov dx,shohag2
   int 21h
   jmp exit 
   
 
   exit:
 
ENDP  
END MAIN
RET




