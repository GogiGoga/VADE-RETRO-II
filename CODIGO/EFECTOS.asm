
;******************************************************************************************************************************************************************************************************************************
;EFECTO PARPADEA
;**************************************************

;ENTRADA "BC" YX COORDENADAS
;        "DE" LARGO/BAJO
;        "A" COLOR QUE QUEDA AL FINAL
;Y LO DEJA COLOREADO IGUAL QUE ESTABA

PARPADEA:

LD (JOKER),A
LD (JORCAS),BC
LD (JORCAS2),DE

LD B,7
PARPADEA1:
PUSH BC
LD B,7
PARPADEA2:
PUSH BC

    LD A,(JOKER)
    ADD A,B
    ;LD A,B
    LD BC,(JORCAS)
    LD DE,(JORCAS2)
    CALL COLOREA
    CALL BIP
    LD B,5
    CALL FLATO

POP BC
DJNZ PARPADEA2
POP BC
DJNZ PARPADEA1

LD A,(JOKER)
LD BC,(JORCAS)
LD DE,(JORCAS2)
CALL COLOREA

CALL EFECTO0
CALL EFECTO0

RET


;******************************************************************************************************************************************************************************************************************************
;ANIMACIÓN AL MATAR A UN MALO
;**************************************************

MINIANIMACION_MUERTEMALO:
;ENTRA CON LOS DATOS DEL MALO EN IY
	LD B,(IY+0)
	LD C,(IY+1)
        LD (JORCAS),BC
	;push bc

LD B,3
MUERETEYA:
PUSH BC

	LD D,0
	LD E,B		;B= 3 2 1  ->  2 1 0  x8 =  16  8  0
	DEC E
	SLA E
	SLA E
	SLA E
	LD HL,EKSPLOTA
	ADD HL,DE

        LD A,B
	ADD A,4        ;COLOR  7 - 6 - 5

	;LD B,(IY+0)
	;LD C,(IY+1)
        LD BC,(JORCAS)
	CALL HR1X1B

      push iy
        OUT (254),A	;RUIDO Y CAMBIO DE BORDE
      pop iy

	HALT

POP BC
DJNZ MUERETEYA

XOR A
OUT (254),A		;BORDER NEGRO AGAIN

;LD B,(IY+0)		;BORRAMOS MALO
;LD C,(IY+1)
;pop bc
LD BC,(JORCAS)
LD HL,VACIO1X1
LD A,(FONDO)
CALL HR1X1B

RET


;******************************************************************************************************************************************************************************************************************************
;EFECTO CAJETIN FRASES INGAME
;**************************************************

KOLORKAJA:

CALL PAUSADE50


LD BC,1032           ;4,8
LD DE,4098           ;16x2
LD A,0
CALL PARPADEA

CALL BORRA_CAJA


;LD DE,8376               ;32x184
;LD A,-8
;CALL ESTELA
;LD DE,10304               ;32x184
;LD A,8
;CALL ESTELA
;CALL BIP



RET



;******************************************************************************************************************************************************************************************************************************
;ESTELA DE PUNTOS
;**************************************************
ESTELA:
;IN: "DE" YX INICIAL    COORD HR ABAJO A LA IZQUIERDA DEL CARACTER
;    "A"  -8  +8  DIRECCION STELA
;    "C"  CARACTERES LARGO
LD (ESPEJO+250),A
LD B,C
ESTELANDO:
PUSH BC
     PUSH DE
     PUSH DE
     CALL PUNTEA
     POP BC
     HALT
     HALT
     HALT
          HALT
          HALT
     CALL HR1X1BORRA
     POP DE
     LD A,(ESPEJO+250)
     ADD A,E
     LD E,A
POP BC
DJNZ ESTELANDO

RET



PUNTEA:
;PINTA 12 PIXELS ALEATORIOS  EN CARACTER
;IN "DE"   COORD HR ABAJO A LA IZQUIERDA DEL CARACTER

LD B,12
PUNTEANDO:
PUSH BC

PUSH DE

LD BC,8        ;A=0-7
CALL LIMITE    ;NO USA "DE"
ADD A,D
LD D,A

LD BC,8
CALL LIMITE
ADD A,E
LD E,A

LD B,D
LD C,E
CALL JBPLOT1

POP DE
POP BC
DJNZ PUNTEANDO

RET






;******************************************************************************************************************************************************************************************************************************
;DIFUMINA
;**************************************************


;DIFUMINA:
;;CUADRADO QUE DESAPARECE A CACHITOS DE LINEAS ALEATORIAS
;;ENTRADA IX  =  Y BASE (pixel), X BASE (CARACTER) , Y ABAJO (pixel), X LARGO (caracteres), Nº REPETICIONES
;;		(FONDO) DEBE TENER EL COLOR DEL PAPEL A BORRAR



;LD B,(IX+4)			;REPETICIONES
;DIFUMINANDO:
;PUSH BC

;LD B,0
;LD C,(IX+2)			;Y ABAJO EN PIXELES
;INC C
;CALL LIMITE
;ADD A,(IX+0)			;A=Y DONDE DIFUMINARE
;LD (DIFUMINAx+0),A		;LO GUARDO

;LD B,0
;LD C,(IX+3)			;X EN CARACTERES
;INC C
;CALL LIMITE
;ADD A,(IX+1)			;A=X DONDE DIFUMINARE EN CARACTERES
;SLA A
;SLA A
;SLA A				;A=X DONDE DIFUMINARE EN PIXELES

;LD C,A
;LD A,(DIFUMINAx)
;LD B,A
;CALL COLOCARB
;XOR A
;LD (HL),A

;HALT

;POP BC
;DJNZ DIFUMINANDO

;LD A,(IX+0)
;    SRA A
;    SRA A
;    SRA A
;    AND 31
;    LD B,A	; PASAMOS "Y" A BR
;LD C,(IX+1)

;LD A,(IX+2)
;SRA A
;SRA A
;SRA A
;AND 31
;LD E,A
;LD D,(IX+3)
;CALL BORRAZONA

;RET

;DIFUMINAx:
;DEFB 0

