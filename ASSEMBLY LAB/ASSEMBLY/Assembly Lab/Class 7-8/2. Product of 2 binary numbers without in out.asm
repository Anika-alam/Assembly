.MODEL SMALL

.STACK 100H 

.DATA 
   
    PRODUCT DW ?  
    MSG3 DB 0DH,0AH,'PRODUCT IS:  $'
 
    
.CODE  

   
;
;****MULTIPLECATION****
;  
;##MULTIPLIES NUM1 AND NUM2. RESULT IS IN PRODUCT

MULT PROC
         
    PUSH AX
    PUSH BX  
    PUSH CX
    PUSH DX
    
    MOV AX,111B
    MOV BX,1101B
   
    XOR DX,DX
    
REPEAT:
    TEST BX,1  
    JZ END_IF
    ADD DX,AX
    
END_IF:
    SHL AX,1
    SHR BX,1    
    JNZ REPEAT     
    
    MOV PRODUCT,DX 
    
    POP DX
    POP CX
    POP BX
    POP AX  
    
    RET       

MULT ENDP    

;
;*****MAIN PROC*****
;

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX 
    
    CALL MULT  
  
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN