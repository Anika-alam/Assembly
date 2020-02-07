
.MODEL SMALL

.STACK 100H 

.DATA  

MSG1 DB 'Found ?$'   
MSG2 DB 'Not Found ?$'
MSG3 DB 'Enter 5 numbers of array?$ '
MSG4 DB 'Enter searched number?$ '

A DW 0  
TEMP DB ? 
TEMP1 DB ?
TEMP2 DB ? 

temp4 dw 5
temp5 dw ? 

W DW  temp DUP(?)

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX    
    
    xor ax,ax
    
   MOV dx,OFFSET MSG3  ; LEA dx,msg1
   mov ah,09h
   int 21h
    
    
    
    mov dx,0ah
    mov ah,02
    int 21h
    mov dx,0dh
    mov ah,02
    int 21h  
    
    xor ax,ax
    xor dx,dx    
    
    CALL input_search  
    XOR AX,AX      
    
    mov dx,0ah
    mov ah,02
    int 21h
    mov dx,0dh
    mov ah,02
    int 21h 
    
    
    MOV dx,OFFSET MSG4  ; LEA dx,msg1
    mov ah,09h
    int 21h
    
    
    mov dx,0ah
    mov ah,02
    int 21h 
    mov dx,0dh
    mov ah,02
    int 21h 
    
    XOR AX,AX  
    
    mov ah,01
    int 21h  
    
    
    mov ah,0 
      
  
    mov temp5,ax
    add temp,48
              
    xor ax,ax 
    
    
   XOR AX,AX
   XOR BX,BX
   
   MOV CX,temp4 
   mov ax,temp5

SUM:
   
	cmp ax,W[BX] 
	je label1
	
	ADD BX,2
	LOOP SUM  

    
    mov dx,0ah
    mov ah,02
    int 21h 
    mov dx,0dh
    mov ah,02
    int 21h
	
   MOV dx,OFFSET MSG2   ; LEA dx,msg1
   mov ah,09h
   int 21h

   mov ah,4ch
   int 21h
    
	 
	 
	 
	
label1:

    mov dx,0ah
    mov ah,02
    int 21h  
    mov dx,0dh
    mov ah,02
    int 21h

   MOV dx,OFFSET MSG1  ; LEA dx,msg1
   mov ah,09h
   int 21h

   mov ah,4ch
   int 21h
   
	
MAIN ENDP 
 INCLUDE input_search.asm    
 ; INCLUDE multi_digit.asm

END MAIN

