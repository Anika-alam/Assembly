
.MODEL SMALL
.STACK 100H
.DATA  
  
   MSG1 DB "Major:$" 
   MSG2 DB "Minor:$" 
   MSG3 DB "Enter Array elements$" 
   
 temp4 dw 25 
 temp dw 5 
 temp1 dw 0 
 temp2 dw 0;
 
	W DW 25  DUP(?)
	  
	ROW DB 0 
	
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX     
	
	xor ax,ax
	
	lea dx,MSG3
    mov ah,09h
    int 21h
    
	
	XOR AX,AX  
	
	mov dx,0ah
	mov ah,02
	int 21h
	mov dx,0dh
	mov ah,02
	int 21h
	
	call input_search 
	
	mov dx,0ah
	mov ah,02
	int 21h
	mov dx,0dh
	mov ah,02
	int 21h
	
	xor ax,ax
	          
	lea dx,MSG1
    mov ah,09h
    int 21h          
    
    xor ax,ax
    
    call output_search   
    
    mov dx,0ah
	mov ah,02
	int 21h
	mov dx,0dh
	mov ah,02
	int 21h
    xor ax,ax 
    
	
	lea dx,MSG2
    mov ah,09h
    int 21h
    
	
	XOR AX,AX  
	
    call output_search_minor

	MOV AH,4CH
    INT 21H         
    MAIN ENDP   
    
    INCLUDE input_search.asm 
    
    INCLUDE output_search.asm    
    
    INCLUDE output_search_minor.asm
    
END MAIN
