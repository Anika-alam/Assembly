.MODEL SMALL

.STACK 100H 

.DATA 
CR EQU 0DH
LF EQU 0AH

MSG1 DB 'ENTER NUMBER: $' 
MSG2 DB CR,LF,'EVEN $'
MSG3 DB CR,LF,'ODD $' 

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX  
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H  
    
    MOV AH,1    
    INT 21H  
    
    AND AL,0FH
    
    TEST AL,1
    JZ EVEN
    LEA DX,MSG3
    JMP PRINT
    
EVEN:
    LEA DX,MSG2

PRINT:
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN