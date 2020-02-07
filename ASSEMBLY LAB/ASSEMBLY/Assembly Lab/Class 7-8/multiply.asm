 ; multiply.asm
 
 MULTIPLY PROC
    
    PUSH AX
    PUSH BX
    
    XOR DX, DX  ; DX = 0
    
    Repeat:
      TEST BX, 1
      JZ L
      
      ADD DX, AX
      
    L:
      SHL AX, 1
      
      SHR BX, 1
      JNZ Repeat
      
    POP BX
    POP AX        
    
    RET
 MULTIPLY ENDP