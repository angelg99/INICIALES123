#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program
I EQU 0x20
J EQU 0x21
K EQU 0x22
CONT EQU 0x23
L EQU 0x30
M EQU 0x31
N EQU 0x32
i equ 0x40
j equ 0x42
k equ 0x44
c equ 0x45
 
 
START

    BANKSEL PORTA ;
    CLRF PORTA ;Init PORTA
    BANKSEL ANSEL ;
    CLRF ANSEL ;digital I/O
    CLRF ANSELH
    BANKSEL TRISA ;
    CLRF TRISA
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    CLRF TRISE
    BCF STATUS,RP1
    BCF STATUS,RP0
    CLRF PORTA
    CLRF PORTB
    CLRF PORTC
    CLRF PORTD
    CLRF PORTE
    MOVLW D'50'
    MOVWF c
INICIO:
    LETRA1:
    ;1			;A
    MOVLW B'01111111'
    MOVWF PORTB ;LINEAS
    MOVLW B'00011100'
    MOVWF PORTD ;COLUMNAS
    CALL DELAY1 
   
    ;2			;A
    MOVLW B'10000000'
    MOVWF PORTB ;LINEAS
    MOVLW B'00100010'
    MOVWF PORTD ;COLUMNAS
    CALL DELAY1
    
    ;3			;A
    MOVLW B'11011111';LINEAS
    MOVWF PORTB
    MOVLW B'00111110';COLUMNAS
    MOVWF PORTD
    CALL DELAY1 
    
    ;///////ESPERA
    ;///////ESPERA
    DECFSZ c,1
    GOTO LETRA1
    MOVLW D'50'
    MOVWF c
    LETRA2:
      ;///////ESPERA G
    MOVLW B'01111111';LINEAS
    MOVWF PORTB
    MOVLW B'00111100';COLUMNA
    MOVWF PORTD
    CALL DELAY1
    ;/////////////////////////////
    ;5			G
    MOVLW B'10000001';LINEAS
    MOVWF PORTB
    MOVLW B'01000000';COLUMNA
    MOVWF PORTD
    CALL DELAY1
    ;6			  G
    MOVLW B'11111110'
    MOVWF PORTB;LINEAS
    MOVLW B'00111100'
    MOVWF PORTD;COLUMNA
    CALL DELAY1
    ;7			    G
    MOVLW B'11111001'
    MOVWF PORTB;LINEAS
    MOVLW B'00000100'
    MOVWF PORTD;COLUMNA
    CALL DELAY1
    ;8		    G
    MOVLW B'11110111'
    MOVWF PORTB;LINEAS
    MOVLW B'00111100'
    MOVWF PORTD;COLUMNA
    CALL DELAY1
    
    ;///////ESPERA
    DECFSZ c,1
    GOTO LETRA2
    MOVLW D'50'
    MOVWF c
    LETRA3:
    ;/////////////////////////////
     MOVLW B'01111111';LINEAS C
    MOVWF PORTB
    MOVLW B'00111100';COLUMNA
    MOVWF PORTD
    CALL DELAY1
    ;/////////////////////////////
    ;5			C
    MOVLW B'10000001';LINEAS C
    MOVWF PORTB
    MOVLW B'01000000';COLUMNA
    MOVWF PORTD
    CALL DELAY1
    ;6			  C
    MOVLW B'11111110'
    MOVWF PORTB;LINEAS
    MOVLW B'00111100'
    MOVWF PORTD;COLUMNA
    CALL DELAY1
   
    ;///////ESPERA
    DECFSZ c,1
    GOTO LETRA3
    MOVLW D'50'
    MOVWF c
    LETRA4:
    ;/////////////////////////////
     MOVLW B'01111111';LINEAS C
    MOVWF PORTB
    MOVLW B'00111100';COLUMNA
    MOVWF PORTD
    CALL DELAY1
    ;/////////////////////////////
    ;5			C
    MOVLW B'10000001';LINEAS C
    MOVWF PORTB
    MOVLW B'01000000';COLUMNA
    MOVWF PORTD
    CALL DELAY1
    ;6			  C
    MOVLW B'11111110'
    MOVWF PORTB;LINEAS
    MOVLW B'00111100'
    MOVWF PORTD;COLUMNA
    CALL DELAY1
   
    ;///////ESPERA
    DECFSZ c,1
    GOTO LETRA4
    MOVLW D'50'
    MOVWF c
    goto INICIO
DELAY2:
NOP ;NOPs de relleno (ajuste de tiempo)
NOP
MOVLW D'30'
MOVWF L
LLOOP:
NOP
NOP
NOP
NOP
NOP
MOVLW D'50'
MOVWF M
MLOOP:
NOP
MOVLW D'60'
MOVWF N
NOP
NLOOP:
DECFSZ N,F
GOTO NLOOP
DECFSZ M,F
GOTO MLOOP
DECFSZ L,F
GOTO LLOOP
RETURN 
TIEMPO:
MOVLW d'1'
MOVWF i
loopj:
MOVLW d'8'
MOVWF j
loopk:
MOVLW d'250'
MOVWF k
loopi:
NOP
NOP
DECFSZ k, 1
GOTO loopi
DECFSZ j, 1
GOTO loopk
DECFSZ i, 1
GOTO loopj
RETURN

DELAY1:
    MOVLW D'10' 
    MOVWF I
ILOOP:
    NOP
    NOP
    MOVLW D'5'
    MOVWF J
JLOOP:
    NOP
    NOP
    MOVLW D'15' 
    MOVWF K
KLOOP:   
    DECFSZ K,F
    GOTO KLOOP
    DECFSZ J,F
    GOTO JLOOP
    DECFSZ I,F
    GOTO ILOOP
    MOVLW D'16'
    MOVWF J
    DECFSZ J,F
    GOTO $-1
    RETURN 
    END
    