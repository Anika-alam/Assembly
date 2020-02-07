.MODEL SMALL

.STACK 100H  

.DATA

MSG DB 'HelloWorld!!$'  ;String ended with DOLLAR sign    
REV DB  12 DUP(?),'$'  
  
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX  
    MOV ES, AX
    
    LEA SI, MSG+11
    LEA DI, REV
    
    STD         ;RIGHT TO LEFT PROCESSING - DF=1
    MOV CX,12 
    
MOVE:
    MOVSB
    ADD DI,2
    LOOP MOVE
    
    
    MOV AH,9        
    LEA DX,REV  
    INT 21H  
    
   
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN