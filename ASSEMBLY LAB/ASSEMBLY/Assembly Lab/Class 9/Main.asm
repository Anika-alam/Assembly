
.MODEL SMALL
.STACK 100H
.DATA
.CODE

 MAIN PROC
    
    CALL INDEC
    PUSH AX
    
    CALL New_Line
    
    POP AX 
    CALL OUTDEC
    
   
    MOV AH,4CH
    INT 21H
    
 MAIN ENDP 

 
 INCLUDE Indec.asm 
 
 INCLUDE Newline.asm
 
 INCLUDE Outdec.asm  



END MAIN