 .MODEL SMALL
 .STACK 100H
 .DATA
 .CODE
 
  MAIN PROC    
    MOV AL, 5 ; 0000 0101
    
    SHR AL, 1 ; CF = 1   
    JC L2     ; Jump if CF=1
    
  L1:
    MOV DL, '*'
    MOV AH, 2
    INT 21H
    JMP L3
    
  L2:
    MOV DL, '#'
    MOV AH, 2
    INT 21H
  L3:
    
    
  MAIN ENDP
 
 END MAIN