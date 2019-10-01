  Port equ P2      ;port LCD D0-D7
  ;Port.0 = D0
  ;Port.1 = D1
  ;Port.2 = D2
  ;Port.3 = D3
  ;Port.4 = D4
  ;Port.5 = D5
  ;Port.6 = D6
  ;Port.7 = D7
  RS equ P1.0      ;RS pin 
  RW equ P1.1      ;RW pin 
  EN equ P1.2      ;EN pin 
;+++++++++++++++++++++++++++++++++++++

   ORG 0000H
   
  CLR RW
  ACALL init
  MOV A,#00
   
START:
 JB P1.3,START
REPEAT:
 JNB P1.3,REPEAT
 SJMP COUNT
 
DECREASE:
 
  MOV B,#100
  DIV AB
  ADD A,#48
  ;MOV A,#'1'  
  ACALL lcd_data
  MOV A,B  
  MOV B,#10
  DIV AB
  ADD A,#48
  ACALL lcd_data
  MOV A,B
  MOV B,#1
  DIV AB
  ADD A,#48
  ACALL lcd_data
  
  MOV A, #02H         ;PINDAH KE HOME
  ACALL lcd_cmd 

  
  SJMP START    

COUNT:
 MOV A,#00
INCREASE:
 INC A
 NOP
 NOP
 NOP
 NOP
 NOP
 NOP
 JB P1.3,INCREASE
 SJMP DECREASE

  
;separator:
;   MOV U,A        ;simpan high
;   ANL U,#0F0H    ;and high dengan F0
;   SWAP A         ;dibalik dengan swap
;   ANL A,#0F0H    ;and low dengan F0
;   MOV L,A        ;untuk low
;   RET            

;++++++++++++++++++++++++++Move To Port 
;++++++++++++++++++++++++++++++++++++++

move_to_Port:
   MOV port,A       
   SETB EN    
   ACALL DELAY   
   CLR EN    
   ACALL DELAY   
   RET     

            
;++++++++++++++++++++++++++LCD command 
;++++++++++++++++++++++++++++++++++++++

   lcd_cmd:
    CLR RS       ;RS = 0, INTRUKSI
    ;ACALL separator     ;untuk memisah
    ;MOV A, U      ;copy U ke A
    ;ACALL move_to_port  ;pindah ke port 
    ;MOV A, L            ;copy L ke A
    ACALL move_to_port  ;pindah
    RET       
 
;++++++++++++++++++++++++++++++LCD data
;++++++++++++++++++++++++++++++++++++++

  lcd_data:
   SETB RS            ;RS=1, DATA
   ;ACALL separator    
   ;MOV A, U           
   ;ACALL move_to_port 
   ;MOV A, L           
   ACALL move_to_port 
   RET                

;+++++++++++++++++++++++++Initilization
;++++++++++++++++++++++++++++++++++++++

init:
   ACALL delay     ;some delay to lcd after power on
   ACALL delay

   MOV port, #30h  ;20H = MODE 8 BIT
   CLR RS   
   SETB EN        
   ACALL delay
   CLR EN

   MOV A, #38H ;28H = 2 LINE
   ACALL lcd_cmd
   MOV A, #0CH ;0CH = DISPLAY ON
   ACALL lcd_cmd
   MOV A, #06H ;06H = SET CURSOR
   ACALL lcd_cmd
   MOV A, #01H ;01H = CLEAR
   ACALL lcd_cmd
   RET

;+++++++++++++++++++++++++++++++++Delay
;++++++++++++++++++++++++++++++++++++++

delay:
   MOV R0, #10H
  L2: MOV R1,#0FH
  L1: DJNZ R1, L1
   DJNZ R0, L2
   RET

;+++++++++++++++++++++++++++++++++++++++

end