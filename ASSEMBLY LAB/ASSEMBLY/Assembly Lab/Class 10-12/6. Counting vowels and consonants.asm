.MODEL SMALL

.STACK 100H  

.DATA

STR DB 80 DUP(0) 

VOWELS DB 'AEIOU'
CONSONANTS DB 'BCDFGHJKLMNPQRSTVWXYZ'
OUT1 DB 0DH,0AH,'VOWELS: $'
OUT2 DB 0DH,0AH,'CONSONANTS: $'

VOWELCOUNT DW 0
CONSONANTCOUNT DW 0
  
.CODE 


;
;****STRING INPUT*****
;                       
;## STORE STARTS IN THE OFFSET ADDRESS DI
;## TOTAL NUMBER OF CHAR IS IN BX 
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
;****DECIMAL OUTPUT****
;
;## INPUT IN BX
;## PRINT OUTPUT

OUTPUT_DECIMAL PROC 
       
    XOR CX,CX   ;COUNTS TOTAL DIGITS
    XOR AX,AX
    MOV AX,BX
    MOV BX,10D
    
@REPEAT:
    XOR DX,DX
    DIV BX    ;DIVIDES DX:AX BY BX. AFTER THAT AX = QUOTIENT AND BX = REMAINDER
    PUSH DX   ;PUSH REMAINDER ON STACK
    INC CX
    OR AX,AX  
    JNZ @REPEAT ;IF QUOTIENT != 0 JUMP TO LOOP
    MOV AH,2
PRINT:
    POP DX    ;DIGIT IN DL
    OR DL,30H
    INT 21H
    LOOP PRINT
    
     
    RET
OUTPUT_DECIMAL ENDP   


;
;##MAIN PROC#####
;


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    
    LEA DI,STR
    CALL READ_STR 
    
    MOV SI,DI   ;SI POINTS TO STRING
    CLD
    
REPEAT:
    LODSB       ;CHAR IN AL
    
    ;IF VOWEL
    LEA DI,VOWELS
    MOV CX,5
    REPNE SCASB     ;IS CHAR A VOWEL??
    JNZ CHK_CONSONANT
    
    INC VOWELCOUNT
    JMP UNTIL
    
    ;IF CONSONANT
CHK_CONSONANT:
    LEA DI,CONSONANTS
    MOV CX,21
    REPNE SCASB
    JNZ UNTIL
    
    INC CONSONANTCOUNT
    
UNTIL:
    DEC BX		;BX CONTAINS NO. OF CHARS LEFT IN STR
    JNZ REPEAT
    
    

    
    LEA DX,OUT1
    MOV AH,9
    INT 21H 
    MOV BX,VOWELCOUNT
    CALL OUTPUT_DECIMAL 
    
    
     
    LEA DX,OUT2
    MOV AH,9
    INT 21H 
    MOV BX,CONSONANTCOUNT
    CALL OUTPUT_DECIMAL  
    
       
    
    MOV AH,4CH
    INT 21H
MAIN ENDP

END MAIN