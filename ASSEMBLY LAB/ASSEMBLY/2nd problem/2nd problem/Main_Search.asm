.MODEL SMALL
.STACK 100H 
.DATA  

M1: DB 'FOUND $'   
M2: DB 'NOT FOUND $'
M3: DB 'ENTER FiVE ELEMNTS?  $ '
M4: DB 'ENTER SEARCHED NUMBER?  $ '


H DB ? 
H4 DW 5
H5 DW ? 

W DW  H DUP(?)

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX    
    
    XOR AX,AX
    
   MOV DX,M3  
   MOV AH,09H
   INT 21H
    
    XOR AX,AX
    XOR DX,DX    
    
    CALL ARRAY_INPUT  
    XOR AX,AX      
    
    MOV DX,0AH
    MOV AH,02
    INT 21H
    MOV DX,0DH
    MOV AH,02
    INT 21H 
    
    
    MOV DX,M4  
    MOV AH,09H
    INT 21H
    
   
    
    XOR AX,AX  
    
    MOV AH,01
    INT 21H  
    
    
    MOV AH,0 
      
  
    MOV H5,AX
    ADD H,48
              
    XOR AX,AX 
    
    
   XOR AX,AX
   XOR BX,BX
   
   MOV CX,H4 
   MOV AX,H5

SUM:
   
	CMP AX,W[BX] 
	JE L
	
	ADD BX,2
	LOOP SUM  

    
    MOV DX,0AH
    MOV AH,02
    INT 21H 
    MOV DX,0DH
    MOV AH,02
    INT 21H
	
   MOV DX,M2  
   MOV AH,09H
   INT 21H

   MOV AH,4CH
   INT 21H
	
  L:

    MOV DX,0AH
    MOV AH,02
    INT 21H  
    MOV DX,0DH
    MOV AH,02
    INT 21H

   MOV DX,M1  
   MOV AH,09H
   INT 21H

   MOV AH,4CH
   INT 21H
   
	
MAIN ENDP 
 INCLUDE ARRAY_INPUT.ASM    
 

END MAIN

