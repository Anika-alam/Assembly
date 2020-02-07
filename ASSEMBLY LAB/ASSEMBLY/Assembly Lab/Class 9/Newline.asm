

New_Line PROC
    
    PUSH AX
    PUSH DX
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    POP DX
    POP AX 
    
    RET

New_Line ENDP