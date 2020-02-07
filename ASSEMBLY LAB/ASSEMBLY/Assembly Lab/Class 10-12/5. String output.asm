.MODEL SMALL

.STACK 100H  

.DATA

STR DB 80 DUP(0) 
CRLF DB 0DH,0AH,'HERE IT IS: $'
LEN DW ?
  
.CODE 


;
;****STRING INPUT*****
;                       
;## STORE STARTS IN THE OFFSET ADDRESS DI
;## TOTAL NUMBER OF CHAR READ IS IN BX 
;

READ_STR PROC
    PUSH AX
    PUSH DI
   
    CLD         ;PROCESS FROM LEFT TO RIGHT
    XOR BX,BX   ;NUMBER OF CHARACTER READ
    
    MOV AH,1
    INT 21H    
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
    POP DI
    POP AX
    RET
READ_STR ENDP


;
;****STRING OUTPUT*****
;                       
;## OFFSET ADDRESS OF STRING TO BE DISPLAYED IS  DI
;## TOTAL NUMBER OF CHARS IS IN BX 
;


DISPLAY_STR PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    
    MOV CX,BX			;NO. OF CHARS
    JCXZ DISPLAY_END    ;EXIT IF CX IS 0
    
    CLD
    MOV AH,2
TOP:
    LODSB			;CHAR IN AL
    MOV DL,AL
    INT 21H
    LOOP TOP

DISPLAY_END:
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_STR ENDP    

;
;####### MAIN PROCEDURE ######
;

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    LEA DI,STR
    CALL READ_STR 
    
    
    MOV LEN,BX 
    
    LEA DX,CRLF
    MOV AH,9
    INT 21H
    
    LEA SI,STR
    MOV BX,LEN
    CALL DISPLAY_STR
   
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN