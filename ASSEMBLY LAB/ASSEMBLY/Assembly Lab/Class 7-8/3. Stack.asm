.MODEL SMALL

.STACK 100H 

.DATA   
    CR EQU 0DH
    LF EQU 0AH
	MSG DB 0DH,0AH,'Reverse of Input: $' 
     
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX 
    
    MOV AH,2 
    MOV DL,'?'
    INT 21H 
    
    XOR CX,CX   ;INITIALIZES CHARACTER COUNT
    
    MOV AH,1
    INT 21H
    
WHILE_:
    CMP AL,CR
    JE END_
    
    PUSH AX
    INC CX
    INT 21H
    JMP WHILE_
    
END_:
    LEA DX,MSG
    MOV AH,9
    INT 21H 
    
    MOV AH,2
TOP:    
    POP DX
    INT 21H
    LOOP TOP
   
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN