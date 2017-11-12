

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; RUTINAS  JBGV
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

; 1- ESPERAS
; 2- BORRAR ZONAS
; 3- ATTRS
; 4- OBTENER DIMENSIONES DE UN SOLO BYTE
; 5- MULTIPLICACIÓN    HL=DE*A     y    HL=D*E  y  A=B*C    y  *(-1) INVIRTIENDO      y     VALOR ABSOLUTO DE "A"
; 6- NUMERO ALEATORIO
; 7- PONER TABLAS A CERO
; 8- PINTAR Y GESTION BUENOS 
; 9- CAMBIO DE MUNDO & PANTALLA
; 10- INVENTARIOS
; 11- MÁQUINAS: GUARDIANES
; 12- RUTINAS PANTALLAS ESPECIALES
; 13- RUTINAS MOVIMIENTO MALOS
; 14- RUTINAS DISPAROS
; 15-
;++++++++++++++++++++++
;++++++++++++++++++++++
; 1- ESPERAS
;++++++++++++++++++++++
;++++++++++++++++++++++

;ESPERA A QUE SE PULSE TECLA

ESPERATECLA:

CALL PAUSADE10
XOR A                        ; A = 0
IN A, (254)
OR 224
INC A
JR Z, ESPERATECLA
RET

;RUTINAS "PAUSADEXX"

PAUSADEX:                   ;PAUSA DE X
;ENTRADA B=Nº DE HALTS
TRANQUILITO5:
HALT
DJNZ TRANQUILITO5
RET

PAUSADE5:                   ;PAUSA DE 5
LD B,5
TRANQUILITO2:
HALT
DJNZ TRANQUILITO2
RET

PAUSADE10:                  ;PAUSA DE 10
LD B,10
TRANQUILITO4:
HALT
DJNZ TRANQUILITO4
RET

PAUSADE15:                  ;PAUSA DE 15
LD B,15
TRANQUILITO7:
HALT
DJNZ TRANQUILITO7
RET

PAUSADE50:                  ;PAUSA DE 50
LD B,50
TRANQUILITO:
HALT
DJNZ TRANQUILITO
RET

PAUSADE100:                  ;PAUSA DE 100
LD B,100
TRANQUILITO6:
HALT
DJNZ TRANQUILITO6
RET


FLATO:                    ;PAUSA DE NOPS
;ENTRADA B=Nº DE CICLOS DE 250
CASCA:
PUSH BC
LD B,255
CASCA2:
NOP
NOP
NOP
DJNZ CASCA2
POP BC
DJNZ CASCA
RET

;++++++++++++++++++++++
;++++++++++++++++++++++
; 2- BORRAR ZONAS
;++++++++++++++++++++++
;++++++++++++++++++++++

;COLOREA TODA LA PANTALLA A NEGRO, NO ES CELESE POR INTERFACE TAPADO
TODONEGRO:
LD B,0
LD C,0
LD D,32
LD E,24
XOR A          ;FONDO NEGRO TINTA NEGRA
CALL COLOREA
RET

;--------------

;BORRA PANTALLA DE JUEGO SEGUN FONDO
CELESEJUEGO:
;LD BC,1793     	;7,1
;LD DE,7696	;30,16
;LD A,(FONDO)
;LD HL,VACIO1X1
;CALL RELLENA
;RET
LD BC,1793    ;7,1
LD DE,3848    ;15,8
LD HL,VACIO2X2
LD A,(FONDO)
CALL RELLENA2D
RET

;--------------

;BORRA PANTALLA DE JUEGO EXTRA
CELESE_EXTRA_BIS:     ;LO MISMO PERO A BLANCO
LD A,56
JR KUKIKI
CELESE_EXTRA:
XOR A
  KUKIKI:
LD BC,3334   ;13,6
LD DE,5128   ;20X8
LD HL,VACIO1X1
CALL RELLENA
RET



;--------------

;BORRAR ZONA DE TAMAÑO VARIABLE
BORRAZONA:
; ENTRADA B (Y) C (X) D (LARGO) E(ANCHO)
LD A,(FONDO)
LD HL,VACIO1X1
CALL RELLENA
RET

;--------------

;BORRAR ZONA 2X2
BORRA2X2:
; ENTRADA B (Y) C (X)
LD A,(FONDO)
LD DE,514
LD HL,VACIO1X1
CALL RELLENA
RET

;--------------
BORRAINDICADOR_DIAMANTE:     ;USADO EN VENTANA CLAVE COLOR
LD BC,2824	;11,8
LD DE,4097	;16X1
LD A,65
LD HL,BORRAR_INDICADOR
CALL RELLENA
RET

;--------------
BORRA_CAJA_BIS:
LD A,121
JR CONT_BORRA_CAJA
BORRA_CAJA:                  ;BORRA CAJA DE TEXTO
XOR A
CONT_BORRA_CAJA:
;CALL PAUSADE50
LD BC,1032
LD DE,4098
LD HL,VACIO1X1
CALL RELLENA
RET

;--------------
BORRAeTORNO:
;USADA EN EVENTOS EN BUCLE EN INTERCAMBIADOR PANT 7

LD B,17
;LD C,(IX+2)
LD A,1
LD DE,VACIO1X1BR
CALL DIBUJA
RET


;++++++++++++++++++++++
;++++++++++++++++++++++
; 3- ATTRS
;++++++++++++++++++++++
;++++++++++++++++++++++

;----------------------
;----------------------
ATTR1X1_O:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD D,B			;GUARDO LA Y
LD C,(IX+1)
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
DEC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO
LD A,D
AND 7			;VITPOSY
CP 0
JR Z,VIA_LIBRE
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO
;----------------------
VIA_LIBRE:
XOR A
JP EL_RETORNO_O
VIA_CHUNGO:
LD A,1
JP EL_RETORNO_O
;----------------------
ATTR2X2_O:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD D,B			;GUARDO LA Y
LD C,(IX+1)
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
DEC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO
LD A,D
AND 7			;VITPOSY
CP 0
JR Z,VIA_LIBRE
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO
JR VIA_LIBRE
;----------------------
;----------------------

;----------------------
;----------------------
ATTR1X1_P:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD D,B			;GUARDO LA Y
LD C,(IX+1)
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO3
LD A,D
AND 7			;VITPOSY
CP 0
JR Z,VIA_LIBRE3
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO3
;----------------------
VIA_LIBRE3:
XOR A
JP EL_RETORNO_P
VIA_CHUNGO3:
LD A,1
JP EL_RETORNO_P
;----------------------
ATTR2X2_P:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD D,B			;GUARDO LA Y
LD C,(IX+1)
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
INC HL
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO3
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO3
LD A,D
AND 7			;VITPOSY
CP 0
JR Z,VIA_LIBRE3
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO3
JR VIA_LIBRE3
;----------------------
;----------------------

;----------------------
;----------------------
ATTR1X1_Q:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD C,(IX+1)
LD D,C			;GUARDO LA X
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
LD BC,-32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO2
LD A,D
AND 7			;VITPOSX
CP 0
JR Z,VIA_LIBRE2
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO2
;----------------------
VIA_LIBRE2:
XOR A
JP EL_RETORNO_Q
VIA_CHUNGO2:
LD A,1
JP EL_RETORNO_Q
;----------------------
ATTR2X2_Q:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD C,(IX+1)
LD D,C			;GUARDO LA X
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
LD BC,-32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO2
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO2
LD A,D
AND 7			;VITPOSX
CP 0
JR Z,VIA_LIBRE2
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO2
JR VIA_LIBRE2
;----------------------
;----------------------

;----------------------
;----------------------
ATTR1X1_A:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD C,(IX+1)
LD D,C			;GUARDO LA X
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO4
LD A,D
AND 7			;VITPOSX
CP 0
JR Z,VIA_LIBRE4
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO4
;----------------------
VIA_LIBRE4:
XOR A
JP EL_RETORNO_A
VIA_CHUNGO4:
LD A,1
JP EL_RETORNO_A
;----------------------
ATTR2X2_A:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD C,(IX+1)
LD D,C			;GUARDO LA X
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"
LD BC,64
ADD HL,BC
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO4
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO4
LD A,D
AND 7			;VITPOSX
CP 0
JR Z,VIA_LIBRE4
INC HL
LD A,(HL)
CP E
JR NZ,VIA_CHUNGO4
JR VIA_LIBRE4
;----------------------
;----------------------



;----------------------
;----------------------
ATTR_BAJAR:
;AL BAJAR DE UN VEHICULO 2X2 -> RESULTADO

;SI ES TREN O BARCO LO HACEMOS POR TABLA
LD A,(IX+5)		;QUIEN
CP 7
JR C,NOTRENECITO

      PUSH IY
      LD IY,TABLA_SALIDAS

      MINIBUCLESTACION:
      LD A,(IY+0)
      CP 255
      JR Z,TARARIQUETEVI

      CP (IX+5)               ;QUIEN
      JR NZ, OTRA_ESTACION

      LD A,(IY+1)
      CP (IX+2)               ;PANTALLA
      JR NZ, OTRA_ESTACION

      LD A,(IY+2)
      CP (IX+0)               ;Y
      JR NZ, OTRA_ESTACION

      LD A,(IY+3)
      CP (IX+1)               ;X
      JR NZ, OTRA_ESTACION

        LD A,(IY+4)
        LD (AUXILIAR_BAJAR+0),A
        LD A,(IY+5)
        LD (AUXILIAR_BAJAR+1),A
        POP IY
        JP SIHAYHUECO

      OTRA_ESTACION:
      LD BC,6
      ADD IY,BC
      JR MINIBUCLESTACION

      TARARIQUETEVI:
      POP IY
      JP Z,NO_TECLA2


NOTRENECITO:
LD E,(IX+13)		;FONDO TRASPASABLE, ES MUCHO MÁS RÁPIDO QUE "CP (IX+13)"
LD B,(IX+0)
LD C,(IX+1)
CALL TRIBUTOSHR		;HL=DIRECCION ATRIBUTOS, NO USA "DE"

LD BC,-32
ADD HL,BC
LD A,(HL)
CP E
JR Z,POSIBILIDAD1	;ARRIBA1

INC HL
LD A,(HL)
CP E
JR Z,POSIBILIDAD2	;ARRIBA2

DEC HL
DEC HL
LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR Z,POSIBILIDAD3	;IZQUIERDA1

LD BC,32
ADD HL,BC
LD A,(HL)
CP E
JR Z,POSIBILIDAD4	;IZQUIERDA2

;DERECHA CUATRO POSIBILIDADES
LD A,(IX+1)		;X VEHICULO
AND 7
CP 0
JR NZ,NO_PEGAITO

	PEGAITO:
	INC HL
	INC HL
	INC HL
	LD A,(HL)
	CP E
	JR Z,POSIBILIDAD5	;DERECHA2
	LD BC,-32
	ADD HL,BC
	LD A,(HL)
	CP E
	JR Z,POSIBILIDAD6	;DERECHA1
	JR SALXABAJO

	NO_PEGAITO:
	INC HL
	INC HL
	INC HL
	INC HL
	LD A,(HL)
	CP E
	JR Z,POSIBILIDAD7	;DERECHA2bis
	LD BC,-32
	ADD HL,BC
	LD A,(HL)
	CP E
	JR Z,POSIBILIDAD8	;DERECHA1bis

;ABAJO CUATRO POSIBILIDADES
DEC HL
SALXABAJO:
DEC HL

LD A,(IX+0)		;Y VEHICULO
AND 7
CP 0
JR NZ,NO_PEGAITO2

	PEGAITO2:
	LD BC,64
	ADD HL,BC
	LD A,(HL)
	CP E
	JR Z,POSIBILIDAD9	;ABAJO2
	JR POSIBILIDAD10	;ABAJO1 	;NO PUEDE HABER POSIBILIAD DE QUE NO HAYA UN HUECO LIBRE ENTRE TODAS LAS ANTERIORES

	NO_PEGAITO2:
	LD BC,96
	ADD HL,BC
	LD A,(HL)
	CP E
	JR Z,POSIBILIDAD11	;ABAJO2bis
	JR POSIBILIDAD12	;ABAJO1bis 	;NO PUEDE HABER POSIBILIAD DE QUE NO HAYA UN HUECO LIBRE ENTRE TODAS LAS ANTERIORES


JP NO_TECLA2                    ;SI LLEGA AQUI ES QUE NO PUEDES BAJAR, POR SI LAS MOSCAS


POSIBILIDAD1:
LD D,-8
LD E,0
JR JEKUTALO
POSIBILIDAD2:
LD D,-8
LD E,8
JR JEKUTALO

POSIBILIDAD3:
LD D,0
LD E,-8
JR JEKUTALO
POSIBILIDAD4:
LD D,8
LD E,-8
JR JEKUTALO

POSIBILIDAD5:
LD D,8
LD E,16
JR JEKUTALO
POSIBILIDAD6:
LD D,0
LD E,16
JR JEKUTALO
POSIBILIDAD7:
LD D,8
LD E,24
JR JEKUTALO
POSIBILIDAD8:
LD D,0
LD E,24
JR JEKUTALO

POSIBILIDAD9:
LD D,16
LD E,8
JR JEKUTALO
POSIBILIDAD10:
LD D,16
LD E,0
JR JEKUTALO
POSIBILIDAD11:
LD D,24
LD E,8
JR JEKUTALO
POSIBILIDAD12:
LD D,24
LD E,0

JEKUTALO:
LD A,(IX+0)
ADD A,D
LD (AUXILIAR_BAJAR+0),A
LD A,(IX+1)
ADD A,E
LD (AUXILIAR_BAJAR+1),A
JP SIHAYHUECO

;----------------------
;----------------------



;----------------------
;----------------------






;++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++
; 4- OBTENER DIMENSIONES DE UN SOLO BYTE
;++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++

; ENTRADA    "A"  DIMENSIÓN COMPRIMIDITA
; SALIDA     "D" (DIMENX)  "E" (DIMENY)

SACADIM:
       LD D,A         ;LO GUARDO PARA X
       AND 15         ;SACO EL Y QUE ESTA EN 4 BYTS BAJOS
       ;LD (DIMENY),A
       LD E,A

       LD A,D         ;SACO EL X QUE ESTA EN 4 BYTS ALTOS
       AND 240
       RRCA
       RRCA
       RRCA
       RRCA
       ;LD (DIMENX),A
       LD D,A
RET

;++++++++++++++++++++++
;++++++++++++++++++++++
; 5- MULTIPLICACIÓN    HL=DE*A     y    HL=D*E    y A=B*C  y   *(-1) INVIRTIENDO    y  VALOR ABSOLUTO
;++++++++++++++++++++++
;++++++++++++++++++++++
    
              Mul8:              ; this routine performs the operation HL=DE*A
  ld hl,0                        ; HL is used to accumulate the result
  ld b,8                         ; the multiplier (A) is 8 bits wide
Mul8Loop:
  rrca                           ; putting the next bit into the carry
  jp nc,Mul8Skip                 ; if zero, we skip the addition (jp is used for speed)
  add hl,de                      ; adding to the product if necessary
Mul8Skip:
  sla e                          ; calculating the next auxiliary product by shifting
  rl d                           ; DE one bit leftwards (refer to the shift instructions!)
  djnz Mul8Loop
  ret


Multiply:                        ; this routine performs the operation HL=D*E
  ld hl,0                        ; HL is used to accumulate the result
  ld a,d                         ; checking one of the factors; returning if it is zero
  or a
  ret z
  ld b,d                         ; one factor is in B
  ld d,h                         ; clearing D (H is zero), so DE holds the other factor
MulLoop:                         ; adding DE to HL exactly B times
  add hl,de
  djnz MulLoop
  ret

JBMULTI:			 ;A=B*C	 OJO, SI RESULTADO > 255 . ES 8 BIT. B EL MENOR PARA MAS RÁPIDO
   XOR A			 ;OJO SI B ES CERO NO FUNCIONA
   LUUP:
   ADD A,C
   DJNZ LUUP
RET	




INVIRTIENDO:
  ;INVERTIMOS NUMERO DADO EN A (SI ES 1, PASA A -1, SI ES -8 PASA A 8), ETC
  LD B,A
  LD A,255
  SUB B
  INC A
  RET



absA:
;VALOR ABSOLUTO DE "A"   "-A" o "A" -> "A"
     or a
     ret p
     neg         ;or you can use      cpl \ inc a								
     ret								



;++++++++++++++++++++++
;++++++++++++++++++++++
;; 6- NUMERO ALEATORIO
;++++++++++++++++++++++
;++++++++++++++++++++++

SEED:  DEFB 0,0

RAND8:
;  DE    "http://baze.au.com/misc/z80bits.html"


;	ld	a,0		; Seed is usually 0
;	ld	b,a
;	add	a,a
;	add	a,a
;	add	a,b
;	inc	a		; another possibility is ADD A,7
;        ld	(RAND8+1),a



;DE "How to Write ZX Spectrum Games   Jonathan Cauldwell"

ld hl,(SEED) ; Pointer
ld a,h
and 31 ; keep it within first 8k of ROM.
ld h,a
ld a,(hl) ; Get "random" number from location.
inc hl ; Increment pointer.
ld (SEED),hl

RET


LIMITE:    ;NO USA "DE"
;ENCONTRÉ ESTA RUTINA EN http://www.cpcwiki.eu/forum/programming/random-number-generator-in-machine-code/

;ENTRADA BC VALOR MÁXIMO,, RESULTADO VALOR ENTRE 0 Y (MAXIMO-1)
PUSH BC
CALL RAND8
ld l,a
ld h,0
           ;ld bc,upper_value-lower_value
POP BC
mod_loop:
or a
sbc hl,bc
jp p,mod_loop
add hl,bc
          ;ld bc,lower_value
ld bc,0
add hl,bc
ld a,l
ret



;++++++++++++++++++++++
;++++++++++++++++++++++
; 7- PONER TABLAS A CERO
;++++++++++++++++++++++
;++++++++++++++++++++++

TABLAACERO:
   XOR A
   ACERO1:
   LD (HL),A
   INC HL
   DJNZ ACERO1
RET


;++++++++++++++++++++++
;++++++++++++++++++++++
; 8- PINTAR Y GESTION BUENOS
;++++++++++++++++++++++
;++++++++++++++++++++++


;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
BORRABUENO:

;AQUI HAY QUE ESTUDIAR LO DEL TREN QUE BORRA PINTANDO Y NO BORRANDO, LO SUYO INTENTAR HACER UNA SOLA COMPARACION POR TIPO Y NO POR TAMAÑO

	LD B,(IX+0)
	LD C,(IX+1)

	;LD A,(IX+6)		;TAMAÑO  8 -   - 32
	;CP 32
	;JR Z,ES_TAM_2X2borrar	;SI NO ES 32 SOLO PUEDE SER 8
	LD A,(IX+5)		;QUIEN
	CP 2
	JR C,ES_TAM_1X1borrar
	CP 7
	JR C,ES_TAM_2X2borrar
	JR Z,ES_BARCOBORRAR
	
     ES_TRENBORRAR:

	LD A,(IX+3)		;SENTIDO
	CP 3
	JR C,GORRA_VERT
      GORRA_HOR:
	LD HL,VACIO2X2+268	;HORIZONTAL 266+2
	JR GORRALO
      GORRA_VERT:
	LD HL,VACIO2X2+230 	;VERTICAL   228+2
      GORRALO:
	LD B,(IX+0)
	LD C,(IX+1)
	LD A,7
	CALL HR2X2B
	RET

     ES_BARCOBORRAR:
	LD HL,VACIO2X2+420   ;(EL AGUA 2X2)+2
	LD B,(IX+0)
	LD C,(IX+1)
	LD A,79
	CALL HR2X2B
	RET
	
     ES_TAM_1X1borrar:
	CALL HR1X1BORRA
	RET
  
     ES_TAM_2X2borrar:
	CALL HR2X2BORRA
	RET


BORRAP1X1:	;BORRAMOS CON COLOR DE FONDO    
LD B,(IX+0)
LD C,(IX+1)
LD HL,VACIO1X1
LD A,(IX+13)	;FONDOAVANCE
CALL HR1X1B
RET

BORRAP2X2:	;BORRAMOS CON COLOR DE FONDO    
LD B,(IX+0)
LD C,(IX+1)
LD HL,VACIO1X1
LD A,(IX+13)	;FONDOAVANCE
CALL HR2X2B
RET

;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
FOTOGRAMA_AVANZANDO:
;ENTRA CON HL ESPRITE BASE, Y TENEMOS QUE SUMAR EL TAMAÑO O NO SEGUN CONTADOR

CALL ESTUDIO_FOTOGRAMA         ;DEVUELVE A=0 o A=TAM FOTOGRAMA
LD E,A
LD D,0
ADD HL,DE
JP PINTANDOLO

;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-


ESTUDIO_FOTOGRAMA:
;DEVUELVE "FRAMEBUENO" CON 0 o TAMAÑO ESPRITE ALTERNATIVAMENTE

LD A,(CUENTA_FOTOGRAMA_BUENO)
INC A
LD (CUENTA_FOTOGRAMA_BUENO),A
CP 10
JR Z,CAMBIA_FOTOGRAMA1
CP 5
JR Z,CAMBIA_FOTOGRAMA2
LD A,(FRAMEBUENO)
RET				;SI NO ES 5 O 10 NO CAMBIAMOS FOTOGRAMA

CAMBIA_FOTOGRAMA1:
XOR A
LD (CUENTA_FOTOGRAMA_BUENO),A
LD (FRAMEBUENO),A
RET

CAMBIA_FOTOGRAMA2:
LD A,(IX+6)
LD (FRAMEBUENO),A
RET

;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;SELECCION DE ESPRITE VEHICULO SEGUN SENTIDO, USADA EN CARGAPANTALLA PINTAR VEHICULOS QUE ESTAN Y TAL

ELESPRITEXSENTIDO:
	;ENTRADA IX EN PERSONAJE
	;SALE HL CON ESPRITE CORRECTO SEGUN SENTIDO
	LD A,(IX+3)			;SENTIDO
	CP 2
	JR Z,SSENT_ABAJO
	CP 3
	JR Z,SSENT_DERECHA
	CP 4
	JR Z,SSENT_IZQUIERDA
	SSENT_ARRIBA:
	LD H,(IX+22)
	LD L,(IX+21)
	RET
	SSENT_ABAJO:
	LD H,(IX+24)
	LD L,(IX+23)
	RET
	SSENT_DERECHA:
	LD H,(IX+26)
	LD L,(IX+25)
	RET
	SSENT_IZQUIERDA:
	LD H,(IX+28)
	LD L,(IX+27)
	RET

;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-

GUARDACTIVO:

;GUARDAMOS LOS VALORES DEL PERSONAJE ACTIVO EN SU LUGAR 
LD DE,37
LD A,(IX+5)	;QUIEN
CALL Mul8       ; this routine performs the operation HL=DE*A
LD DE,VALORES_PERSONAJES+37
ADD HL,DE
EX DE,HL			;DESTINO "DE"
LD HL,VALORES_PERSONAJES	;ORIGEN
LD BC,37
LDIR
RET

;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;SUBIMOS A UN VEHICULO

SUBIENDOME:

LD A,(IY+3)
CP 0
JR Z,SUBE_SENSILLO
	LD A,3
	LD (IY+3),A	;ES UN BIPLAZA Y YA HABIA UNO DENTRO
	JR NO_SUBE_SENSILLO
SUBE_SENSILLO:
LD A,(IX+8)		;"QUIEN LLEVO" MALFARIO=1 O FMANAGER=2 DATOS FIJOS EN PERSONAJES
LD (IY+3),A		;LO GUARDO EN MATRIZ VEHICULOS
NO_SUBE_SENSILLO:

LD A,(IY+2)	
LD (IX+7),A		;DECIMOS A MATRIZ PERSONAJE DONDE ESTAMOS SUBIDOS

CALL BORRAP1X1		;DESAPARECEMOS CON COLOR DE FONDO
CALL GUARDACTIVO	;GUARDAMOS EL ACTIVO EN SU LUGAR

LD A,(IY+2)	;ACTIVAMOS VEHICULO  
DEC A
DEC A
LD DE,37
CALL Mul8       		
LD DE,VALORES_PERSONAJES+111
ADD HL,DE			;ORIGEN
LD DE,VALORES_PERSONAJES	;DESTINO
LD BC,37
LDIR

LD A,(IY+3)			;DECIMOS A MATRIZ VEHICULO QUIEN VA DENTRO Y MARCAMOS "OCUPADO"
LD (IX+8),A
LD A,1
LD (IX+9),A

;GENERAMOS ESPRITES ABAJO E IZQUIERDA...
	
CALL GENERAMOS_ESPRITES

POP BC		;VIENES DE UN BUCLE CON POP
POP IY

XOR A
LD (FRAMEBUENO),A	;0  -  TAMAÑO SPRITE ALTERNATIVAMENTE

JP CARGAPANTALLA


;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;GENERAMOS LOS ESPRITES ABAJO E IZQUIERDA DE VEHICULOS 2X2

GENERAMOS_ESPRITES:

	;IZQUIERDA
	LD H,(IX+26)
	LD L,(IX+25)
	PUSH HL
        CALL INVERSA	;ESPRITE EN "ESPEJO"
	LD HL,ESPEJO
	LD DE,ESPRITEIZQUIERDA
	LD BC,32
	LDIR
	POP HL
	LD BC,32
	ADD HL,BC
        CALL INVERSA	;ESPRITE EN "ESPEJO"
	LD HL,ESPEJO
	LD DE,ESPRITEIZQUIERDA+32
	LD BC,32
	LDIR

	;ABAJO
	LD H,(IX+22)
	LD L,(IX+21)
	CALL FLIPA	;ESPRITE EN "ESPEJO"
	LD HL,ESPEJO
	LD DE,ESPRITEABAJO
	LD BC,64
	LDIR
RET


;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;ESPECIAL EN BHUCLE CON SUBMARINO PARA SUBIR LENTAMENTE POR DEFECTO
;SE LLAMA DESDE BUCLE AL ESATR PARADO


SUBMARINEANDOii:
LD A,(CONTADOR_SUBMARINO)
INC A
LD (CONTADOR_SUBMARINO),A
CP 5
JP NZ,DEVUELTASUB
XOR A
LD (CONTADOR_SUBMARINO),A
JP SUBMARINEANDO




;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;ESPECIAL BAJARSE DEL SUBMARINO EN PANTALLA 115
;SE LLAMA DESDE BUCLE AL BAJAR

ESPECIAL_BAJA_SUBMARINO_P115:

;1º CONDICIONES 
	LD A,(PANTALLA)			;PANTALLA=115
	CP 115
	JP NZ,NO_TECLA2			;SI NO SE CUMPLE SALTA "BAJAR" EN BUCLE

	LD A,(VALORES_PERSONAJES+0)	;Y=104
	CP 104	
	JP NZ,NO_TECLA2			;SI NO SE CUMPLE SALTA "BAJAR" EN BUCLE

	LD A,(VALORES_PERSONAJES+1)	;X=24
	CP 24	
	JP NZ,NO_TECLA2			;SI NO SE CUMPLE SALTA "BAJAR" EN BUCLE

;2º DAMOS A MANO VALORES A "AUXILIAR_BAJAR"

	LD A,104
	LD (AUXILIAR_BAJAR+0),A
	LD A,16
	LD (AUXILIAR_BAJAR+1),A

;3º VOLVEMOS A LA RUTINA "BAJAR" DEL BUCLE EN EL SITIO CORRECTO...

JP SIALONE



;.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
;COLOREAMOS SILUETAS INTERFEIS

COLOR_I_MALF:
XOR A
CALL SILUETA_FM
LD A,112
CALL SILUETA_MF
RET

COLOR_I_FM:
LD A,112
CALL SILUETA_FM
XOR A
CALL SILUETA_MF
RET

SILUETA_MF:
LD BC,516   ;2,4
LD DE,771   ;3x3
CALL COLOREA
RET

SILUETA_FM:
LD BC,537   ;2,25
LD DE,771   ;3x3
CALL COLOREA
RET





;++++++++++++++++++++++
;++++++++++++++++++++++
; 9- CAMBIO DE MUNDO & PANTALLA
;++++++++++++++++++++++
;++++++++++++++++++++++


;DETECTAMOS CAMBIO DE MUNDO Y CAMBIAMOS VALOR DE PANTALLA Y SALTOPANTALLA  AL MOVERNOS

CAMBIO_DE_MUNDO:

LD A,(PANTALLA)
LD D,A

CAMBIO_DE_MUNDO2:
LD A,(HL)
CP 255
JR Z,FIASCO	;NO HAY CAMBIO DE MUNDO

CP D

JR NZ,SIGUIENTE_DDATO

        ;SI HAY CAMBIO DE MUNDO:
	INC HL
	LD A,(HL)
	LD (PANTALLA),A		;NUEVA PANTALLA
	LD (IX+2),A		
	INC HL
	LD A,(HL)
	LD (SALTO_PANTALLA),A	;NUEVO SALTOPANTALLA
	XOR A
	RET

SIGUIENTE_DDATO:
INC HL 
INC HL
INC HL
JR CAMBIO_DE_MUNDO2

FIASCO:
LD A,1
RET


SALTO_MUNDO_ARRIBA:
DEFB 28,127,1,  132,2,4,  16,138,1,  141,29,1,  69,146,1,  150,70,3, 89,71,3, 255
SALTO_MUNDO_ABAJO:
DEFB 127,28,3,  2,132,1,  138,16,4,  29,141,1,  146,69,2,  70,150,1, 71,89,1,  255
SALTO_MUNDO_IZQUIERDA:
DEFB 126,58,2,  61,126,1,  9,63,1,  142,16,4,  76,145,1,  133,28,3,  64,137,1,  151,75,3,  94,152,1,  255
SALTO_MUNDO_DERECHA:
DEFB 58,126,1,  126,61,1,  63,9,4,  16,142,1,  145,76,3,  28,133,1,  137,64,2,  75,151,1,  152,94,2,  255


;*************************************************************************************************************
DETECTAME_SALTOPANTALLA:
;ASIGNAMOS SALTOPANTALLA SEGÚN LA PANTALLA DONDE ESTES. AL CAMBIAR PERSONAJE, QUE PUEDEN ESTAR EN MUNDOS DIDERENTES
;OJO USA IX PERO LUEGO VA UN CARGAPANTALLA

LD IX,TABLA_DETECTA_SALTOPANT
LD A,(PANTALLA)

LD B,13
CHUNGILERENGI:

CP (IX+0)
JR C,DETECTADO
INC IX
INC IX

DJNZ CHUNGILERENGI

DETECTADO:
LD A,(IX+1)
LD (SALTO_PANTALLA),A
RET

TABLA_DETECTA_SALTOPANT:

DEFB 20,4, 29,3, 33,1, 43,5, 55,3, 61,2, 64,1, 70,2, 88,3, 90,1, 102,2, 126,3, 153,1


;*************************************************************************************************************

OASIS:		
;ENTRA CON IX DEL PERSONAJE ACTIVO
;SALE A=0 1 3		0-NO ES DESIERTO	1--3 SI LO ES, MALFARIO - COCHE DESIERTO
	
LD A,(IX+5)		;QUIEN ¿?
CP 0
JR Z,QUIZAS_EN_DESIERTO1
CP 2
JR Z,PRESENCIA_DESIERTO3			;COCHE DESIERTO SIEMPRE LO ESTÁ
JP NO_PRESENCIA_DESIERTO

        QUIZAS_EN_DESIERTO1:
        LD A,(DESIERTO1)
        CP 1
        JR NZ,NO_PRESENCIA_DESIERTO			;MALFARIO NO ESTA EN DESIERTO
	
	PRESENCIA_DESIERTO1:
	LD A,1
	RET

	PRESENCIA_DESIERTO3:
	LD A,3
	RET

	NO_PRESENCIA_DESIERTO:
	XOR A
	RET


;*************************************************************************************************************

ASIGNANDO_PANTALLAS_DESIERTO:
;ENTRA CON "B" DESPLAZAMIENTO PANTALLAY ROM
;	   "C" DESPLAZAMIENTO PANTALLAX ROM
;	   "A" 1 - - 3    SEGUN SEA MALFARIO  O COCHE DESIERTO
; VIENES DE UN JP, NO DE UN CALL

LD IX,COORD_DESERT	;OJO IX YA NO ES VALOR PERSONAJE

CP 1
JP Z,APDESERT1			

APDESERT3:				
LD A,B			;MODIFICAMOS VALORES DE PY PX
ADD A,(IX+6)
LD (IX+6),A
LD (IX+0),A		;EN DESIERTO TAMBIEN PY DE MALFARIO QUE VA DENTRO
LD A,C
ADD A,(IX+7)
LD (IX+7),A
LD (IX+1),A		;EN DESIERTO TAMBIEN PX DE MALFARIO QUE VA DENTRO
  
CALL TRES_CON_UNO	;ASIGNAMOS VALOR PANTALLA 241  243			
LD A,243		;SI EN LA PANTALLA QUE ENTRA NO HAY NADIE DAMOS NUMERO PANTALLA PROPIO 
LD (IX+8),A
JP preCARGAPANTALLA				

APDESERT1:		
LD A,B			;MODIFICAMOS VALORES DE PY PX
ADD A,(IX+0)
LD (IX+0),A
LD A,C
ADD A,(IX+1)
LD (IX+1),A	
CALL UNO_CON_TRES	;COMPROBAMOS QUE UNO Y TRES COINCIDEN EN PYPX
LD A,241		;SI EN LA PANTALLA QUE ENTRA NO HAY NADIE DAMOS NUMERO PANTALLA PROPIO 
LD (IX+2),A		
JP preCARGAPANTALLA				

UNO_CON_TRES:		;SI COINCIDEN LAS COORDENADAS DE 1 Y 3			
LD A,(IX+0)
CP (IX+6)				
RET NZ				
LD A,(IX+1)				
CP (IX+7)				
RET NZ				
LD A,(IX+8)				
LD (IX+2),A				
JP NOESTABASOLO	

TRES_CON_UNO:		;SI COINCIDEN LAS COORDENADAS DE 3 Y 1			
LD A,(IX+6)				
CP (IX+0)				
RET NZ				
LD A,(IX+7)				
CP (IX+1)				
RET NZ				
LD A,(IX+2)				
LD (IX+8),A				
JP NOESTABASOLO	

NOESTABASOLO:			
POP BC			;POPEAS QUE VIENES DE UN CALL	
preCARGAPANTALLA:				
LD (PANTALLA),A			;VALOR PANTALLA A PANTALLA Y A PERSONAJE
LD (VALORES_PERSONAJES+2),A
JP CARGAPANTALLA


;*************************************************************************************************************



;++++++++++++++++++++++
;++++++++++++++++++++++
; 10- INVENTARIOS
;++++++++++++++++++++++
;++++++++++++++++++++++

;*************************************************************************************************************
BORRAMOSINVENTARIO:
;BORRAMOS EL PRIMER HUECO DEL PERSONAJE ACTIVO, ES DISTINTO A "METER" UN CERO

 LD A,(VALORES_PERSONAJES+5) ;0 MALFARIO 1 FMANAGER
 CP  0
 JR Z,BORRAI_MALFARIO

                                         BORRAI_FMANAGER:
                                         XOR A
                                         LD (INVENTARIO2),A                  ;COMO LO PONGO BORRO INVENTARIO
                                         RET

                                         BORRAI_MALFARIO:
                                         XOR A
                                         LD (INVENTARIO1),A
                                         RET

;*************************************************************************************************************
METEINVENTARIO:
;ENTRADA A=Nº OBJETO INVENTARIO (NO CONFUNDIR CON OBJETOS DE PINTASTADOS NI CON NUMERACION DE ESPRITES INVENTARIO)

LD (JOKER),A		        ;LO GUARDO (==)

CP 0                            ;METER VALOR CERO
JR Z,ES_OBJETO

CP 4
JP C,ES_ARMA

ES_OBJETO:		        ;METEMOS OBJETO EN PRIMER VALOR Y DESPLAZAMOS EL RESTO HASTA UN CERO
LD A,(VALORES_PERSONAJES+8)	;QUIEN LLEVO (SIEMPRE ES 1 o 2 EN PERSONAJES)
CP 1
JR Z,ES_INVENTARIO1
	

	ES_INVENTARIO2:
	LD HL,INVENTARIO2
        JR INCLUYELO

	ES_INVENTARIO1:
        LD HL,INVENTARIO1

        INCLUYELO:
        LD A,(HL)
        CP 0             ;1º HUECO YA ES LIBRE
        JR NZ,NOESKA
        LD A,(JOKER)	 ;(==)
        LD (HL),A
        RET

        NOESKA:
        PUSH HL
        LD BC,8
        XOR A
        CPIR
        DEC HL
        PUSH HL
        POP DE
        LD A,8
        SUB C
        LD C,A
        DEC HL
        LDDR                ;CON ESTO HEMOS DESPLAZADO TODO HASTA PRIMER HUECO
        POP HL
        LD A,(JOKER)	    ;(==)
        LD (HL),A           ;E INCLUIMOS EL NUEVO EN POSICION CERO
	RET

ES_ARMA:		;DAMOS NUEVO VALOR A LA VARIABLE ARMA Y LA PINTAMOS EN INTERFEIS

LD A,(VALORES_PERSONAJES+8)	;QUIEN LLEVO (SIEMPRE ES 1 o 2 EN PERSONAJES)
CP 1
JR Z,ES_POLVORIN1
	
	ES_POLVORIN2:
	LD A,(ARMA2)
	INC A
	
	    CP 4
	    RET Z

        LD (ARMA2),A
	LD C,29		;LA X DE INTERFEIS
	JR ACTIVARMA

	ES_POLVORIN1:
	LD A,(ARMA1)
	INC A

	    CP 4
	    RET Z

	LD (ARMA1),A
	LD C,2		;LA X DE INTERFEIS
	
	ACTIVARMA:
	;PINTAMOS ARMA NUEVA EN INTERFEIS
	dec a                   ;para que pinte la correcta
        LD D,11
	LD E,A
	CALL Multiply		; this routine performs the operation HL=D*E  NO USA "C"
	LD DE,ARMAX
	ADD HL,DE
	EX DE,HL
	LD B,1
	;LD C,x		
	LD A,255
	CALL DIBUJA
	RET


;*************************************************************************************************************
PINTAINVENTARIO_INTERFEIS:

        LD A,(INVENTARIO1+0)
        CALL SACASPRITE_INVENTA
        LD BC,769         ;3,1
        LD A,255
        CALL DIBUJA

        LD A,(INVENTARIO2+0)
        CALL SACASPRITE_INVENTA
        LD BC,797        ;3,29
        LD A,255
        CALL DIBUJA
RET

        SACASPRITE_INVENTA:
        CP 0
        JR Z,ESTAVACIO
	;1º OBTENEMOS EL NÚMERO DE ESPRITE POR TABLA CORRESPONDENCIA
	
	CALL BUSCA_CORRESPONDENCIA_OI     ;IN  "A" Nº DE OBJETO   OUT "A" Nº DE ESPRITE Y TEXTO

        SUB 3                   ;NOS SALTAMOS LAS ARMAS
        LD D,38
	LD E,A
	CALL Multiply		; this routine performs the operation HL=D*E  NO USA "C"
	LD DE,INVENTARIOX
	ADD HL,DE
	EX DE,HL
        RET
        ESTAVACIO:
	LD DE,INVENTARIOX
        RET



;*************************************************************************************************************
PINTAINVENTARIO:         ;OJO USA IX

LD IX,COORDENADEISION

LD A,(VALORES_PERSONAJES+8)	;QUIEN LLEVO (SIEMPRE ES 1 o 2 EN PERSONAJES)
CP 1
JR Z,PINTA_EL1

PINTA_EL2:
        ;_COLOREANDO Y TAL
        LD HL,INVENTARIO2
        JR PINTANDO_INVENTARIO
PINTA_EL1:
        ;_COLOREANDO Y TAL
        LD HL,INVENTARIO1

PINTANDO_INVENTARIO:

	 LD (JORCAS),HL ;LUEGO LO VOY A USAR EN RUTINA BUCLE INVENTARIO
	 LD A,(HL)	;VALOR INVENTARIO CERO, EL SELECCIONADO
	 LD (GUDAR),A	;(***)

         LD B,8
         YUTKI:
         PUSH BC

            PUSH HL
            LD A,(HL)
            CALL SACASPRITE_INVENTA
            LD B,(IX+0)
            LD C,(IX+1)
            LD A,255
            CALL DIBUJA
            POP HL
            INC HL 
            INC IX
            INC IX

         POP BC
         DJNZ YUTKI

	;PINTAMOS TXT
	CALL BORRA_CAJA_BIS
	LD HL,0
        LD A,(GUDAR)	;(***)
        CP 0
        JR Z,LOLIPOP

        CALL BUSCA_CORRESPONDENCIA_OI     ;IN  "A" Nº DE OBJETO   OUT "A" Nº DE ESPRITE Y TEXTO

        SUB 3
	LD DE,PUNTERO_TXT_INVENTARIO
	LD HL,0
        CALL TRUCO_CONTADOR_FRASESII
	LOLIPOP:
        LD DE,TEXTOS_INVENTARIO
	ADD HL,DE
	EX DE,HL
	LD A,122
	LD (TINTA),A
	CALL PARA_TXT_INVENTARIO	;RUTINA DE UNAFRASEB

RET


COORDENADEISION:
DEFB 9,15, 10,21, 13,26, 16,21, 17,15, 16,9, 13,4, 10,9

CORRESPONDENCIA_OI:
DEFB 4,4, 5,4, 6,5, 7,6, 8,7, 9,8, 10,9, 11,9, 12,4, 13,9, 14,4
DEFB 255

;*************************************************************************************************************

BUSCA_CORRESPONDENCIA_OI:
        ;IN  "A" Nº DE OBJETO
        ;OUT "A" Nº DE ESPRITE Y TEXTO
        LD HL,CORRESPONDENCIA_OI
	LD B,A     ;Nº DE OBJETO

		KULEGUI:
		LD A,(HL)
		CP B
		JR Z,SUFTERFURGIO
		INC HL
		INC HL
		JR KULEGUI

	SUFTERFURGIO:
	INC HL
	LD A,(HL)
        RET

;++++++++++++++++++++++
;++++++++++++++++++++++
; 11- MÁQUINAS: GUARDIANES
;++++++++++++++++++++++
;++++++++++++++++++++++

;===============================================================================================
;===============================================================================================
;===============================================================================================

CARGAGUARDIANES:             ;ES ALGO PESADA PERO SE CARGA EN CARGAPANTALLA

;LD HL,TABLA_GUARDIANES
;LD DE,MALVADOS

;COPIALO DE STELA II

;++++++++++++++++++++++
;++++++++++++++++++++++
; 12- RUTINAS PANTALLAS ESPECIALES
;++++++++++++++++++++++
;++++++++++++++++++++++

;************************************************ PANTALLA 93 CLAVE COLOR
KLAVE_KOLOR:
;ABRE VENTANA Y MANEJO DE CLAVE PARA ABRIR PUERTA P93


;0º INICIAMOS CLAVECOLOR2 /////////////////////////////////

LD HL,CLAVECOLOR2
LD A,2
LD B,6
HHYYUU:
LD (HL),A
INC HL
DJNZ HHYYUU

;1º PINTAMOS LA VENTANA CON SUS COSICAS  /////////////////////////////////


;LD BC,2566      ;10,6
;LD DE,2565      ;10X5
;LD HL,FONDO_INVENTARIOX
;LD A,255
;CALL RELLENA2D


LD HL,VENTANA_KOLOR
CALL PINTAPANTALLA			; EN HL ENTRA EL PRIMER VALOR DE LA PANTALLA

LD A,8					;LOS 7 DIAMANTES DE COLOR ROJO
LD (JOKER),A
LD B,6
WUCLEPVK:
PUSH BC
	LD A,(JOKER)
	LD D,A
	ADD A,3
	LD (JOKER),A
	LD B,12
	LD C,D
	LD DE,SPRITE_DIAMANTE
	LD A,2
	CALL DIBUJA
POP BC
DJNZ WUCLEPVK

LD IX,COSAS_VENTANACOLOR		;ESTÁ EN RETROGRADO EN MEMORIA EN CONTIENDA
CALL PINTANDO_DE_TABLA			;ESTÁ EN RUTINA II PINTASTADOS Y RELACIONADAS


;2º EL BUCLECIN  /////////////////////////////////

;ESPEJO+200 X DIAMANTE


LD A,8
LD (ESPEJO+200),A
CALL BORRA_PINTA_INDICADOR_DIAMANTE	;PARA PINTAR FLECHA 1º VEZ
LD HL,CLAVECOLOR2

BUCLECIN:

CALL LEER_TECLADO        ;OUT "A"                USA "BC" y "A"
;1-TECLA Q   2-TECLA A   3-TECLA P   4-TECLA O   5-TECLA M  6-TECLA E  7-TECLA T  0-NO TECLA

CP 6
JR Z,SALIR_SIN_MAS
CP 7
JR Z,COMPRUEBA_COLOR
CP 3
CALL Z,DIAMANTE_DER
CP 4
CALL Z,DIAMANTE_IZQ
CP 1
CALL Z,COLOR_DIAMANTE_ARRIBA
CP 2
CALL Z,COLOR_DIAMANTE_ABAJO

HALT
HALT
HALT
HALT

JP BUCLECIN

     SALIR_SIN_MAS:
	;FX
	JP CARGAPANTALLA
	
     COMPRUEBA_COLOR:

	LD DE,CLAVECOLOR	;PATRON
	LD HL,CLAVECOLOR2	;PROPUESTA

	LD B,6
	COMPROBANDO_COLORES:
		LD A,(DE)
		LD C,A
		LD A,(HL)
		CP C
		JR NZ,OHHHHHHHHH
		INC HL
		INC DE
	DJNZ COMPROBANDO_COLORES


TATATITATI:
LD A,(ESTADOS+38)	;ESATDO PUERTA PANT 93    	
XOR 1			; 0 -> 1  y  1 -> 0
LD (ESTADOS+38),A       ;MODIFICAMOS VALOR DEL ESTADO

;FX GUAY
;TXT 
LD A,5			;"OLE OLE !"
CALL UNAFRASEB
CALL KOLORKAJA
JP CARGAPANTALLA

OHHHHHHHHH:
;FX SONIDITO ERROR
;TXT 
LD A,8			;"NO FUNCIONA !"
CALL UNAFRASEB
CALL KOLORKAJA
JP CARGAPANTALLA




;***************************************
;AUXILIARES EN BUCLE CLAVE COLOR

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
BORRA_PINTA_INDICADOR_DIAMANTE:  ;INCLUYE SONIDIN

CALL BORRAINDICADOR_DIAMANTE

LD B,11
LD A,(ESPEJO+200)
LD C,A
LD DE,INDICADOR_DIAMANTE
LD A,255
CALL DIBUJA

;PUSH HL
CALL BIP   ;CAMBIAR POR UN FX
;POP HL

RET
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DIAMANTE_DER:

	LD A,(ESPEJO+200)
	CP 23
	RET Z

	ADD A,3
	LD (ESPEJO+200),A

       PUSH HL
	CALL BORRA_PINTA_INDICADOR_DIAMANTE
       POP HL
	INC HL	;SUBIMOS CLAVE
RET
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DIAMANTE_IZQ:

	LD A,(ESPEJO+200)
	CP 8
	RET Z

	SUB 3
	LD (ESPEJO+200),A

       PUSH HL
	CALL BORRA_PINTA_INDICADOR_DIAMANTE
       POP HL
	DEC HL	;BAJAMOS CLAVE
RET
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
COLOR_DIAMANTE_ARRIBA:
	LD A,(HL)
	CP 7
	RET Z

	INC A
	CALL COLOREA_DIAMOND
	XOR A   ;PARA QUE NO PETE CON LOS CP DEL BUCLE SIGUIENTES
RET
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
COLOR_DIAMANTE_ABAJO:
	LD A,(HL)
	CP 2
	RET Z

	DEC A
	CALL COLOREA_DIAMOND

RET
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
COLOREA_DIAMOND:
	LD (HL),A
	LD D,A

	LD B,12
	LD A,(ESPEJO+200)
	LD C,A
	LD A,D
	LD DE,SPRITE_DIAMANTE

	PUSH HL
	CALL DIBUJA
	CALL BIP   ;CAMBIAR POR UN FX
	POP HL
RET	





;++++++++++++++++++++++
;++++++++++++++++++++++
; 13- RUTINAS MOVIMIENTO MALOS
;++++++++++++++++++++++
;++++++++++++++++++++++

;****************************************************** PARA HACER JP (HL)
MOVEMENT_BAD:	
DEFW MALO_ARRIBA	
DEFW MALO_ABAJO	
DEFW MALO_DERECHA	
DEFW MALO_IZQUIERDA	
	
	

;****************************************************** VARIACIÓN DE COORDENADAS SI FONDO LO PERMITE
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
MALO_ARRIBA: 
LD D,(IX+0)                                         ;GUARDAMOS POR SI HAY QUE RESTAURAR
DEC (IX+0)
DEC (IX+0)

LD A,D
AND 7
CP 0
JP NZ,  SELEKTA_FOTOGRAMA   ;SI NO ESTAMOS EN EL BORDE MOVEMOS SIN MAS

LD A,D
SUB 8
                RETUCKO1:
LD B,A
LD C,(IX+1)
LD E,C
CALL TRIBUTOSHR                                           ;NO USA "DE"
LD A,(HL)
CP 71
JP NZ, NO_SELEKTA_FOTOGRAMA1         
LD A,E                                                   ;LA X
AND 7
CP 0
JP Z,SELEKTA_FOTOGRAMA                        ;VEMOS SI ESTA ENTRE DOS CARACTERES O NO
INC HL
LD A,(HL)
CP 71
JP Z,SELEKTA_FOTOGRAMA        

NO_SELEKTA_FOTOGRAMA1:
LD (IX+0),D                                         ;RESTAURAMOS VALOR
JP SELEKTA_FOTOGRAMA            

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     
MALO_ABAJO:  
LD D,(IX+0)                                         ;GUARDAMOS POR SI HAY QUE RESTAURAR
INC (IX+0)
INC (IX+0)

LD A,D
AND 7
CP 0
JP NZ,  SELEKTA_FOTOGRAMA   ;SI NO ESTAMOS EN EL BORDE MOVEMOS SIN MAS

LD A,D
ADD A,8
JP RETUCKO1


;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     
MALO_DERECHA:            
LD D,(IX+1)                                         ;GUARDAMOS POR SI HAY QUE RESTAURAR
INC (IX+1)
INC (IX+1)

LD A,D
AND 7
CP 0
JP NZ,  SELEKTA_FOTOGRAMA   ;SI NO ESTAMOS EN EL BORDE MOVEMOS SIN MAS

LD B,(IX+0)
LD E,B
LD C,D
CALL TRIBUTOSHR                                           ;NO USA "DE"
INC HL
                RETUCKO2:
LD A,(HL)
CP 71
JP NZ, NO_SELEKTA_FOTOGRAMA2
LD A,E                                                   ;LA Y
AND 7
CP 0
JP Z,SELEKTA_FOTOGRAMA                        ;VEMOS SI ESTA ENTRE DOS CARACTERES O NO
LD BC,32
ADD HL,BC
LD A,(HL)
CP 71
JP Z,SELEKTA_FOTOGRAMA        

NO_SELEKTA_FOTOGRAMA2:
LD (IX+1),D                                         ;RESTAURAMOS VALOR
JP SELEKTA_FOTOGRAMA

;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX     
MALO_IZQUIERDA:
LD D,(IX+1)                                         ;GUARDAMOS POR SI HAY QUE RESTAURAR
DEC (IX+1)
DEC (IX+1)

LD A,D
AND 7
CP 0
JP NZ,  SELEKTA_FOTOGRAMA   ;SI NO ESTAMOS EN EL BORDE MOVEMOS SIN MAS

LD B,(IX+0)
LD E,B
LD C,D
CALL TRIBUTOSHR                                           ;NO USA "DE"
DEC HL
JP RETUCKO2
                
;XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX




;****************************************************** ASIGNAMOS PATRON CUANDO CONTADOR-PATRON=0
ASIGNAPATRON:						
;ASIGNA EL CONTADOR PATRON Y EL PATRON, QUE SERÁ UN HL PARA HACER UN JL (HL)
;ASIGNAMOS CONTADOR PATRON 5+ALEATORIO
						
LD BC,6			;A=0-5			
CALL LIMITE						
ADD A,5			;A=5 - 10			
LD (IX+6),A			;ASIGNAMOS CONTADOR PATRON						

;PATRON HORIZONTAL O VERTICAL?

LD A,R
BIT 0,A			;SEGÚN R SEA PAR O IMPAR
;CP 0
JR Z,PATRONHORIZONTAL

	PATRONVERTICAL:

	LD A,R			;R VARÍA ENTRE 0 Y 127
	CP 100
	JR C,SEACERCA

		SEALEJA:					
		LD B,(IX+0)			;Y DEL MALO
		LD A,(VALORES_PERSONAJES+0)			;Y DEL BUENO		
		SUB B					
		JP M,ESPOSITIVO2			;(*) LO CONTRARIO A SE ACERCA		
		JP ESNEGATIVO2									
						
		SEACERCA:					
		LD B,(IX+0)			                ;Y DEL MALO
		LD A,(VALORES_PERSONAJES+0)			;Y DEL BUENO
		SUB B					
		JP M,ESNEGATIVO2
						
			ESPOSITIVO2:				
			LD HL,(MOVEMENT_BAD+2)			;BAJAR
			LD (IX+7),L
			LD (IX+8),H				
			RET				
						
			ESNEGATIVO2:				
			LD HL,(MOVEMENT_BAD+0)			;SUBIR
			LD (IX+7),L				
			LD (IX+8),H				
			RET										
						
	PATRONHORIZONTAL:
						
	LD A,R			;R VARÍA ENTRE 0 Y 127			
	CP 100
	JR C,SEACERCA2
						
		SEALEJA2:					
		LD B,(IX+1)			;X DEL MALO
		LD A,(VALORES_PERSONAJES+1)			;X DEL BUENO
		SUB B
		JP M,ESPOSITIVO1			;(*) LO CONTRARIO A SE ACERCA
		JP ESNEGATIVO1

		SEACERCA2:
		LD B,(IX+1)			;X DEL MALO
		LD A,(VALORES_PERSONAJES+1)			;X DEL BUENO
		SUB B
		JP M,ESNEGATIVO1					
						
			ESPOSITIVO1:				
			LD HL,(MOVEMENT_BAD+4)			;DERECHA
			LD (IX+7),L				
			LD (IX+8),H				
			RET				
						
			ESNEGATIVO1:				
			LD HL,(MOVEMENT_BAD+6)			;IZQUIERDA
			LD (IX+7),L				
			LD (IX+8),H				
			RET				


;****************************************************** 

CARGA_ORDA_MALOTES:
										
;CARGAMOS LOS MALOTES QUE PUEDA HABER

LD HL,TABLA_ORDAS										
LD DE,ORDA_MALOTES				;SI FUERA LENTO POR 150 MALOS EL HL LO DIVIDIMOS EN 3 SEGÚN Nº PANTALLA						
										
CARGANDO_ORDAS:										
										
;SI 1º VALOR=255 SALIMOS										
										
	LD A,(HL)									
	LD B,A									
	CP 255									
	JP Z,KIOLORRE			;EN VEZ DE UN RET ASIGNAMOS COLOR POR VIDA, ASI APROVECHAMOS RUTINA "COLORXVIDA"								
										
;COMPARAMOS CON VALOR PANTALLA										
										
	LD A,(PANTALLA)									
	CP B									
	JP NZ,SIGUIENTE_ORDA									
										
;COINCIDE, CARGAMOS ORDA										
										
	INC HL									
	;DE									
	LD BC,3									
	LDIR			        ;Y-X- BUFFER VIDA   (HL EN "TIPO" Y DE EN IX+3)
										
PUSH HL										
										
	LD A,(HL)			;LEEMOS TIPO						
	LD HL,TIPOS_ORDAS									
	LD BC,40			;PONER EL TAMAÑO DE LA TABLA CORRECTO						
	CPIR			        ;SALE HL EN "VIDA" YA   "DE" NO SE HA VISTO AFECTADO
										
	INC HL
	LD A,(HL)                       ;DAÑO (IX+3) "DE" SIGUE EN X+3
        LD (DE),A

	INC HL		                ;HL ESTÁ EN VALOR SPRITE DE TABLA TIPO_ORDA
        INC DE                          ;DE EN IX+4

	LD A,(HL)			;Nº ESPRITE						
	SLA A			        ;x2
	SLA A			        ;x4
	SLA A			        ;x8
	SLA A			        ;x16
	LD L,A
	LD H,0									
	LD BC,SPRITE_MALOTE0									
	ADD HL,BC									
	LD A,L									
	LD (DE),A			;IX+4 						
	INC DE									
	LD A,H									
	LD (DE),A			;IX+5						

POP HL				
	INC HL				;VIDA
	LD A,(HL)
        INC DE
        INC DE
        INC DE
        INC DE
	INC DE                  	;"DE" EN "VIDA" 
	LD (DE),A			;IX+10	

	INC DE                  	;DE EN SIGUIENTE ORDA
        INC HL				;HL EN SIGUIENTE TABLA_ORDA

        JP CARGANDO_ORDAS

										
SIGUIENTE_ORDA:
LD BC,6
ADD HL,BC
JP CARGANDO_ORDAS										

KIOLORRE:
LD IX,ORDA_MALOTES+0
CALL COLORXVIDAXX2
LD IX,ORDA_MALOTES+11
CALL COLORXVIDAXX2
LD IX,ORDA_MALOTES+22
CALL COLORXVIDAXX2
RET


;******************************************************
;COLOR SEGÚN VIDA
;OJO LA IX ES RESPECTO "ORDA_MALOTES"


COLORXVIDAXX2:		;PARA CARGA_ORDA_MALOTES    ----> CREO QUE NO SE USAAAAAA CAMBIA NOMBRE Y SALES DE DUDAS
LD A,(IX+10)		;VIDA EN ORDA_MALOTES
CALL COLORXVIDA          ;ENTRA VIDA SALE COLOR
LD (IX+9),A
RET

COLORXVIDA:
;ENTRA A=VIDA
;SALE A=COLOR
CP 51
JR NC,COLOR7
CP 41
JR NC,COLOR6
CP 31
JR NC,COLOR5
CP 21
JR NC,COLOR4
CP 11
JR NC,COLOR3

COLOR2:
LD A,2
RET
COLOR7:
LD A,7
RET
COLOR6:
LD A,6
RET
COLOR5:
LD A,5
RET
COLOR4:
LD A,4
RET
COLOR3:
LD A,3
RET




;++++++++++++++++++++++
;++++++++++++++++++++++
; 14- RUTINAS DISPAROS
;++++++++++++++++++++++
;++++++++++++++++++++++

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
JBPLOT0:
;ENTRADA "BC"-> YX
;SALIDA PLOTEA SIEMPRE CERO

LD A, C ; Ponemos en A la X
RRA
RRA
RRA ; A = ???CCCCC
AND 31 ; A = 000CCCCCb
LD L, B ; B = coordenada Y
LD H, Scanline_Offsets/256 ; Parte alta de la dir de tabla
ADD A, (HL) ; A = columna + tabla_baja[linea]
INC H ; saltamos a la siguiente tabla
LD H, (HL) ; cargamos en H la parte alta
LD L, A ; cargamos en L la parte baja

LD A, C ; Recuperamos la coordenada (X)
AND 7
LD B,A
INC B
LD A,1

REGIRA:
RRCA
DJNZ REGIRA

;LD B,A
;LD A,(HL)
;XOR B			;ESTO LO QUE HACE ES ACTIVAR SI ESTA DESACTIVADO Y DESACTIVAR SI ESTA ACTIVADO
;LD (HL),A

CPL  			;ESTO LO PONE A CERO SIEMPRE CURSO COMPILER
AND (HL)
LD (HL),A

RET

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

JBPLOT1:
;ENTRADA "BC"-> YX
;SALIDA PLOTEA "1"      ACTIVA PIXEL SIEMPRE. SIN ATRIBUTOS

LD A, C ; Ponemos en A la X	;LO REPETIMOS PARA AHORRARNOS EL CALL/RET
RRA
RRA
RRA ; A = ???CCCCC
AND 31 ; A = 000CCCCCb
LD L, B ; B = coordenada Y
LD H, Scanline_Offsets/256 ; Parte alta de la dir de tabla
ADD A, (HL) ; A = columna + tabla_baja[linea]
INC H ; saltamos a la siguiente tabla
LD H, (HL) ; cargamos en H la parte alta
LD L, A ; cargamos en L la parte baja

LD A, C ; Recuperamos la coordenada (X)
AND 7
LD B,A
INC B
LD A,1

REGIRA3:
RRCA
DJNZ REGIRA3

LD B,A
LD A,(HL)
OR B			;"XOR B" ACTIVA EL PIXEL SI ESTA DESACTIVADO Y LO DESACTIVA SI ESTA ACTIVO
LD (HL),A
RET


;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
JBPOINT:
;ENTRADA "BC"-> YX
;SALIDA A=0 o A=1 SEGÚN HAYA O NO PIXEL

LD A, C ; Ponemos en A la X		;LO REPETIMOS PARA AHORRARNOS EL CALL/RET
RRA
RRA
RRA ; A = ???CCCCC
AND 31 ; A = 000CCCCCb
LD L, B ; B = coordenada Y
LD H, Scanline_Offsets/256 ; Parte alta de la dir de tabla
ADD A, (HL) ; A = columna + tabla_baja[linea]
INC H ; saltamos a la siguiente tabla
LD H, (HL) ; cargamos en H la parte alta
LD L, A ; cargamos en L la parte baja

LD A, C ; Recuperamos la coordenada (X)
AND 7
LD B,A
INC B

LD A,(HL)

REGIRA2:
RLCA
DJNZ REGIRA2

AND 1
RET

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
EXPLOXION:		;EXPLOSION DEBE HACER IX+0=0 CONSERVAR IX Y RETORNAR A SIGUIENTE BALA
XOR A
LD (IX+0),A
;LD (IX+4),A
JP XIGUIENTEBALAX

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AXIERTO	:		;AXIERTO DEBE HACER IX+0=0 CONSERVAR IX Y RETORNAR A SIGUIENTE BALA, VIENE CON JP


;COMPROBAMOS SI HA DADO EN EL BLANCO

;1º VEMOS SI LA BALA ES DEL BUENO O DE LOS MALOS

LD A,(IX+5)			;0 DISAPARO DE MALO  1 DISPARO DE BUENO
CP 1
JR Z,BALADELBUENO


      BALADELMALO:

	LD A,(VALORES_PERSONAJES+0)	;COMPARAMOS COORDENADAS BALA CON COORDENADAS BUENO
	SUB (IX+0)
	ADD A,7
	CP 8
	JP NC,PREXIGUIENTEBALAX		;FALLO (COLISION NO CON BUENO)


	LD A,(VALORES_PERSONAJES+1)
	SUB (IX+1)
	ADD A,7
	CP 8
	JP NC,PREXIGUIENTEBALAX		;FALLO (COLISION NO CON BUENO)

		LD A,(VALORES_PERSONAJES+17)	;VIDA DEL BUENO
		SUB (IX+3)
		CALL QUITAVIDA
		JP PREXIGUIENTEBALAX

      BALADELBUENO:

	PUSH IY
	LD IY,ORDA_MALOTES+0
	CALL QUITAVIDA_MALO
	LD IY,ORDA_MALOTES+11
	CALL QUITAVIDA_MALO
	LD IY,ORDA_MALOTES+22
	CALL QUITAVIDA_MALO

	ELRETONNO:	
	POP IY	


PREXIGUIENTEBALAX:
XOR A
LD (IX+0),A                  ;COORDENADA "Y" + ALCANCE A  CERO  ->DESACTIVO BALA
LD (IX+4),A
JP XIGUIENTEBALAX





;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

GATILLO_MALO:

;ENTRADA IY-> ORDAMALOTES+0  +11  +22   	EL MALO QUE SEA
;        IX-> BALAX+12	+18  +24		LAS BALAS DE CADA UNO DE ELLOS


;AQUÍ VALOR ALEATORIO QUE PROVOQUE UN RET
LD BC,11                              ;A 0 - 10
CALL LIMITE
CP 2
RET NC                                 ;VOLVEMOS SI NO VALE 0 0 1

LD A,(IY+10)
CP 0
RET Z					;SI VIDA MALO=0 NO DISPARA

LD A,(IX+4)				;SI ALCANCE NO ES CERO ES QUE HAY BALA VIVA
CP 0
RET NZ



;SENTIDO POR DIFERENCIA COORDENADAS BUENO ACTIVO Y MALO:
;DIFERENCIA DE X  BUENO-MALO
LD A,(VALORES_PERSONAJES+1)	;X BUENO
SUB (IY+1)			;A=XBUENO-XMALO
LD E,0
CALL C,E_VALORPOSITIVO		;PONEMOS "E" VALOR 1 QUE SIGNIFICA RESULTADO POSITIVO
CALL absA			;VALOR ABSOLUTO DE "A"   "-A" o "A" -> "A" SOLO USA "A"
LD D,A				;LO GUARDAMOS EN D

;DIFERENCIA DE Y  BUENO-MALO
LD A,(VALORES_PERSONAJES+0)	;Y BUENO
SUB (IY+0)			;A=YBUENO-YMALO
LD C,0
CALL C,C_VALORPOSITIVO		;PONEMOS "C" VALOR 1 QUE SIGNIFICA RESULTADO POSITIVO
CALL absA			;VALOR ABSOLUTO DE "A"   "-A" o "A" -> "A" SOLO USA "A"
CP D				;COMPARAMOS CON VALOR ABSOLUTO DE XBUENO-XMALO
JR C, MALO_DISPEN_X

	MALO_DISPEN_Y:
		LD A,C				;NEGATIVO O P0SITIVO
		CP 0
		JR Z,LAY_ERANEG
			LAY_ERAPOS:
			LD A,1
			JR ASIGNA_SENTIO_BALAMALO
			LAY_ERANEG:
			LD A,2
			JR ASIGNA_SENTIO_BALAMALO

	MALO_DISPEN_X:
		LD A,E				;NEGATIVO O P0SITIVO
		CP 0
		JR Z,LAX_ERANEG
			LAX_ERAPOS:
			LD A,4
			JR ASIGNA_SENTIO_BALAMALO
			LAX_ERANEG:
			LD A,3

			ASIGNA_SENTIO_BALAMALO:
			LD (IX+2),A

;ELECCION DE YX 

                CP 1
                JR Z,ESUNO1m
                CP 2
                JR Z,ESDOS2m
                CP 3
                JR Z,ESTRES3m
                ESCUATRO4m:
                LD D,3
                LD E,-3
              	JR FINEWm
                ESUNO1m:
                LD D,-3
                LD E,3
                JR FINEWm
                ESDOS2m:
                LD D,10
                LD E,3
                JR FINEWm
                ESTRES3m:
                LD D,3
                LD E,10
                FINEWm:
                LD A,(IY+0)
                ADD A,D
                LD (IX+0),A			;Y BALA
                LD A,(IY+1)
                ADD A,E
                LD (IX+1),A			;X BALA

;AQUÍ EL DAÑO, EL ALCANCE EL VALOR (IY+3)*8

LD A,(IY+3)               ;DAÑO
LD (IX+3),A
SLA A      ;x2
SLA A      ;x4
SLA A      ;x8
LD (IX+4),A                ;ALCANCE

;AQUÍ EL QUIEN PARA RUTINA ACIERTO…
XOR A
LD (IX+5),A                 ;INDICADOR QUE ES DISPARO DE MALO

RET

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;AUXILIARES DE GATILLO_MALO

E_VALORPOSITIVO:
LD E,1
RET

C_VALORPOSITIVO:
LD C,1
RET

;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------



;++++++++++++++++++++++
;++++++++++++++++++++++
; 15-
;++++++++++++++++++++++
;++++++++++++++++++++++

