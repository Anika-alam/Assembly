
.MODEL SMALL
.STACK 100H
.DATA 
 
.CODE
  
  MAIN PROC
    
    CALL INDEC   
    PUSH AX  ; STACK : 5
    
    CALL New_Line
    
    MOV AX, 1  ; AX = 1
    
    POP CX  ; CX : 5
  L:
    MUL CX ; AX = AX * CX
  LOOP L         ; GO TO L
    
    CALL OUTDEC
    
    MOV AH,4CH
    INT 21H
    
  MAIN ENDP
  
 INCLUDE Indec.asm 
 
 INCLUDE Newline.asm  
 
 INCLUDE Outdec.asm
  
END MAIN