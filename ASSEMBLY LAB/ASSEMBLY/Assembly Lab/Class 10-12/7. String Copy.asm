.MODEL SMALL

.STACK 100H  

.DATA

MSG DB 'HelloWorld!!$'  ;String ended with DOLLAR sign    
STRING1 DB  12 DUP(?),'$'  
  
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX  
    MOV ES, AX
    
    LEA SI, MSG    ;SI POINTS TO SOURCE STRING
    LEA DI, STRING1 ;DI POINTS TO DESTINATION STRING
    
    CLD    ;CLEAR DF
    MOV CX,12	;NUMBER OF BYTES IN MSG IS 12
    REP MOVSB
    
    
    MOV AH,9        
    LEA DX,STRING1  ;LOAD EFFECTIVE ADDRESS 
    INT 21H  
    
   
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN