
.MODEL SMALL
.STACK 100H

.DATA

.CODE

 MAIN PROC
    MOV AX, 4
    MOV BX, 2
    
    CALL MULTIPLY
    
    ADD DX, 30H
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
       
 MAIN ENDP
 
 INCLUDE multiply.asm

 
END MAIN