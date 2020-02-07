.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER BINARY NUMBER(NOT MORE THAN 8 BIT): $'
    MSG2 DB 0DH,0AH,'HERE IT IS: $'
    
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    XOR BL,BL	;CLEARS BL
    MOV AH,1
    INT 21H
TOP:
    CMP AL,0DH
    JE END_
    AND AL,0FH	;CONVERTING FROM ASCII TO NUMERIC VALUE
    SHL BL,1
    OR  BL,AL
    INT 21H
    JMP TOP
    
END_:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV CX,8
    MOV AH,2 
OUTPUT:
    SHL BL,1
    JC ONE
    MOV DL,'0'
    JMP NEXT 
ONE:
    MOV DL,'1'
    
NEXT:
    INT 21H
    LOOP OUTPUT
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN
        
    