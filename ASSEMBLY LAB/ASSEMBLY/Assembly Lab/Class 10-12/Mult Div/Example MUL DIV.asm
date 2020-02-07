.MODEL SMALL
.STACK 100H
.DATA
.CODE
 MAIN PROC
   CALL INDEC
   MOV BX, AX ; BX <- 1ST INPUT
   CALL New_Line
   
   CALL INDEC ; AX <- 2ND INPUT
   CALL New_Line
   
   MUL BX ; AX = AX * BX
   
   CALL OUTDEC
   ;-----------------------------
   
   CALL New_Line
   CALL New_Line
   
   CALL INDEC
   PUSH AX ; STACK <- 3RD INPUT
   CALL New_Line
   
   CALL INDEC  
   MOV BX, AX  ; BX <- 4TH INPUT 
   CALL New_Line
   
   MOV DX, 0
   POP AX ; AX <- 3RD INPUT
   DIV BX ;  
   ; Ax = (DX:Ax)/BX,DX = AX % X
   ; AX = AX / BX
   CALL OUTDEC
   ;-----------------------------
  
   MOV AH,4CH
   INT 21H
   
 MAIN ENDP
 
 INCLUDE Indec.asm 
 
 INCLUDE Newline.asm  
 
 INCLUDE Outdec.asm
 
END MAIN