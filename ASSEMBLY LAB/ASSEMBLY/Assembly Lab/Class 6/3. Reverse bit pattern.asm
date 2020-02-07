.MODEL SMALL
.STACK 100H
.DATA
    
    
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AL,11011100B	;WANT 00111011 IN AL
    
    MOV CX,8
    
REVERSE:
    SHL AL,1
    RCR BL,1
    LOOP REVERSE
	
    MOV AL,BL
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
        
    