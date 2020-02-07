.MODEL SMALL

.STACK 100H  

.DATA

STR DB 80 DUP(0) 
  
.CODE

;
;****STRING INPUT*****
;                       
;## STORE STARTS IN THE OFFSET ADDRESS DI
;## TOTAL NUMBER OF CHAR READ IS IN BX 
;

READ_STR PROC
    PUSH AX
	PUSH BX
    PUSH DI
   
    CLD         ;PROCESS FROM LEFT TO RIGHT
    XOR BX,BX   ;COUNTS NUMBER OF CHARACTER READ
    
    MOV AH,1
    INT 21H     ;READ CHAR IN AL
WHILE1:
    CMP AL,0DH   ;CR?
    JE READ_END
    
    CMP AL,8H    ;BACKSPACE?
    JNE ELSE1
    DEC DI       ;MOV STR POINTER BACK
    DEC BX
    JMP READ_
ELSE1:
    STOSB       ;STORE CHAR OF AL IN STR AND INCREMENTS DI
    INC BX      ;INCREMENT COUNT
READ_:
    INT 21H
    JMP WHILE1

READ_END:
    POP DI		;NOW DI POINTS TO THE STARTING OF STR 
	POP BX
    POP AX
    RET
READ_STR ENDP



MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    LEA DI,STR
    CALL READ_STR 
    
   
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN