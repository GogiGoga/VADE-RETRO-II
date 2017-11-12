;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; RUTINAS II JBGV
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

; 1-  LECTURA TECLADO
; 2-  
; 3-  INVERSO & FLIP
; 4-  CARGAPANTALLA
; 5-  CARGAFONDOS Y RELACIONADAS
; 6-  PINTASTADOS Y RELACIONADAS
; 7-  CARGAEVENTOS Y RELACIONADAS
; 8-  COPIYUPI @ COPITRANS
; 9-  CARGAMETEORO Y RELACIONADAS
; 10- MARCOS
; 11- LA VIDA Y LA MUERTE
; 12- ANIMACIONES RUTINAS
; 13- 


;++++++++++++++++++++++
;++++++++++++++++++++++
; 1-  DEFINICIÓN DE TECLAS Y LECTURA TECLADO
;++++++++++++++++++++++
;++++++++++++++++++++++

LEER_TECLADO:       ;OUT "A" (Y "PULSACION" SI ES MENESTER)

;1-TECLA Q   2-TECLA A   3-TECLA P   4-TECLA O   5-TECLA M  6-TECLA E  7-TECLA T  0-NO TECLA



TECLAOe:

       LD BC, $DFFE         ; SEMIFILA Y - P
       IN A, (C)            ; LEER PUERTO
       BIT 1, A             ; COMPROBAR BIT 1 "O"
       JR NZ, TECLAPe        ; SI NO ESTÁ PULSADO VAMOS A TECLA "P"
       ;HAS PULSADO "O" ENTONCES:
       LD A,4
       JR FIN_LECTURAe

TECLAPe:

       LD BC, $DFFE         ; SEMIFILA Y - P
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "P"
       JR NZ, TECLAQe        ; SI NO ESTÁ PULSADO VAMOS A TECLA "Q"
       ;HAS PULSADO "P" ENTONCES:
       LD A,3
       JR FIN_LECTURAe

TECLAQe:

       LD BC, $FBFE         ; SEMIFILA T - Q
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "Q"
       JR NZ, TECLAAe        ; SI NO ESTÁ PULSADO VAMOS A TECLA "A"
       ;HAS PULSADO "Q", ENTONCES:
       LD A,1
       JR FIN_LECTURAe

TECLAAe:

       LD BC, $FDFE         ; SEMIFILA G - A
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "A"
       JR NZ, TECLAMe        ; SI NO ESTÁ PULSADO VAMOS A TECLA "M"
       ;HAS PULSADO "A", ENTONCES:
       LD A,2
       JR FIN_LECTURAe

TECLAMe:

       LD BC, $7FFE         ; SEMIFILA B - SPACE
       IN A, (C)            ; LEER PUERTO
       BIT 2, A             ; COMPROBAR BIT 2 "M"
       JR NZ, TECLAEe  	    ; SI NO ESTÁ PULSADO VAMOS A TECLA "E"
       ;HAS PULSADO "M", ENTONCES:
       LD A,5
       JR FIN_LECTURAe

TECLAEe:
       LD BC, $FBFE         ; SEMIFILA T - Q
       IN A, (C)            ; LEER PUERTO
       BIT 2, A             ; COMPROBAR BIT 2 "E"
       JR NZ, TECLATe  	    ; SI NO ESTÁ PULSADO VAMOS A TECLA "T"
       ;HAS PULSADO "E", ENTONCES:
       LD A,6
       JR FIN_LECTURAe

TECLATe:
       LD BC, $FBFE         ; SEMIFILA T - Q
       IN A, (C)            ; LEER PUERTO
       BIT 4, A             ; COMPROBAR BIT 4 "T"
       JR NZ, NO_PULSACIONe  ; SI NO ESTÁ PULSADO VAMOS A NO PULSACION
       ;HAS PULSADO "T", ENTONCES:
       LD A,7
       JR FIN_LECTURAe

NO_PULSACIONe:

       XOR A

FIN_LECTURAe:
;LD (PULSACION),A        ;LA GUARDO POR SI ACASO LUEGO LA NECESITO .............. 
RET



;++++++++++++++++++++++
;++++++++++++++++++++++
; 2-  
;++++++++++++++++++++++
;++++++++++++++++++++++





;++++++++++++++++++++++
;++++++++++++++++++++++
; 3- INVERSO & FLIP
;++++++++++++++++++++++
;++++++++++++++++++++++

;OBTENEMOS EN "ESPEJO" UN SPRITE ROTADO, USAMOS "INVERSO" PARA OBTENER DATOS TAMAÑO PARA RUTINA "DIBUJA", E "INVERSA" PARA SÓLO DATOS RUTINAS HR 2X2
;ENTRADA EN HL LA DIRECCIÓN DEL SPRITE A ROTAR
;SALIDA EN "ESPEJO" EL SPRITE ROTADO

INVERSA:

LD DE, ESPEJO-1
LD A,2
LD (GUDAR),A
LD (JOKER),A
LD B,A
LD A,32         ;MALOS SON DOS ESPRITES
JR SUMOLAR

INVERSO:

LD DE, ESPEJO
LD A,(HL)         ;ANCHO EN CARACTERES
LD B,A            ;ANCHO B PARA PRIMER BUCLE
LD (JOKER),A
LD (DE),A
INC DE
INC HL
LD A,(HL)         ;BAJO EN CARACTERES
LD (GUDAR),A
LD (DE),A         ;GRABAMOS LOS DOS VALORES DEL TAMAÑO DEL SPRITE PARA RUTINA "DIBUJA"
SLA A
SLA A
SLA A             ;A=BAJO EN SCANLINES
INC HL

SUMOLAR:          ;(*) B=ANCHO EN CARACTERES
INC DE
DJNZ SUMOLAR      ;INCREMENTAMOS LA DIRECCION DE INVERSO AL FINAL DEL LARGO

   LD B,A         ;BUCLE SCANLINE
   BUCLEBAR:
   PUSH BC

   LD A,(JOKER)   ;BUCLE ANCHO
   LD B,A
   BUCLELAR:
   PUSH BC

   LD C, (HL)       ;CARGO HL CON DATO BYTE ORIGEN Y LO PONGO EN "C"

   XOR A            ; PONGO A CERO QUE ES DONDE VOY A GUARDAR EL BYTE ROTADO

   LD B,8
   VOLTEANDO:
   RL   C           ;Rotación a la IZQUIERDA de BYTE ORIGEN EL 7º BIT PASA TOO A ACARREO
   RRA              ;Rotación a la DERECHA de "A" ALIMENTÁNDOLO CON EL ACARREO Y YA ESTÁ
   DJNZ VOLTEANDO

   LD (DE),A

   INC HL
   DEC DE

   POP BC
   DJNZ BUCLELAR

   LD A,(JOKER)
   LD B,A
   SLA  B        ;CARGAMOS B CON EL DOBLE DE LAR
   SUMOLAR2:
   INC DE
   DJNZ SUMOLAR2      ;INCREMENTAMOS LA DIRECCION DE INVERSO AL FINAL DEL LARGO

   POP BC
   DJNZ BUCLEBAR

;ATRIBUTOS       ;COMO MÁXIMO SON 4X4 PONGO 16 Y ME AHORRO MULTIPLICACIÓN


   LD A,(GUDAR)
   LD B,A
   AYAYAIS:
   PUSH BC

   LD A,(JOKER)
   LD B,A
   AYAYAYAI:
   LD A,(HL)
   LD (DE),A
   INC HL
   DEC DE
   DJNZ AYAYAYAI

   LD A,(JOKER)
   LD B,A
   SLA  B        ;CARGAMOS B CON EL DOBLE DE LAR
   SUMOLAR3:
   INC DE
   DJNZ SUMOLAR3      ;INCREMENTAMOS LA DIRECCION DE INVERSO AL FINAL DEL LARGO

   POP BC
   DJNZ AYAYAIS

RET

;====================
;====================

;OBTENEMOS EN "ESPEJO" UN SPRITE FLIPADO, USAMOS "FLIP" PARA OBTENER DATOS TAMAÑO PARA RUTINA "DIBUJA", Y "FLIPA" PARA SÓLO DATOS RUTINAS HR 2X2
;ENTRADA EN HL LA DIRECCIÓN DEL SPRITE A FLIPAR
;SALIDA EN "ESPEJO" EL SPRITE FLIPADO

FLIP:
;UNDER CONSTRUCTION

FLIPA:   ;ojo 2x4 caracteres

LD DE,ESPEJO+62

LD B,32
FLIPEANDO:

LD A,(HL)
LD (DE),A
INC HL
INC DE
LD A,(HL)
LD (DE),A
INC HL
DEC DE
DEC DE
DEC DE

DJNZ FLIPEANDO
RET




;++++++++++++++++++++++
;++++++++++++++++++++++
; 4- CARGAPANTALLAS
;++++++++++++++++++++++
;++++++++++++++++++++++

;=================================================================================

NILAMANTAPORCALOR:             ;1º HACEMOS LA SUMA DE MAPA HASTA PANTALLA-1
LD DE,PUNTERO_MAPAX
LD HL,0
LD A,(PANTALLA)
  TRUCO_CONTADOR_FRASES:
DEC A
  TRUCO_CONTADOR_FRASESII:
LD B,A
CP 0                           ;SI PANTALLA=1 HL A SUMAR A FASE ES CERO
RET Z
  WUCLE:
  PUSH BC
      LD A,(DE)
      LD B,0
      LD C,A
      ADD HL,BC
      INC DE
  POP BC
  DJNZ WUCLE                   ;HL=VALOR A SUMAR A LA BASE DEL MAPA PARA OBTENER PRIMER VALOR DEL MAPA
RET

;=================================================================================
;=================================================================================
;=================================================================================


PINTAPANTALLA:
; EJECUTAMOS LOS DATOS DEL MAPA DE LA PANTALLA
; EN HL ENTRA EL PRIMER VALOR DE LA PANTALLA


INICIOPINTAR:

PUSH HL       ;CONSERVAMOS EN PILA HL -------------------------------------------------------------------------------------------------------***
PUSH HL
POP IX        ;INDEXAMOS PANTALLA

LD A,(IX)
CP 255        ;SI VALOR =255 HEMOS TERMINADO, ES LA ÚNICA FORMA DE SALIR DE PINTAPANTALLA
JR NZ,PLASTI
POP HL        ;QUE NO PETE LA PILA AL SALIR
RET
PLASTI:


;********************************************************************************************************
;PANTALLA DE VIAS  245  A  254
;********************************************************************************************************

CP 254
JR Z, PAISAJE254
CP 253
JR Z, PAISAJE253
CP 252
JR Z, PAISAJE252
CP 251
JR Z, PAISAJE251
CP 250
JR Z, PAISAJE250
CP 249
JR Z, PAISAJE249
CP 248
JR Z, PAISAJE248
CP 247
JR Z, PAISAJE247

CP 244
JR Z, PAISAJE244
JP PP_COLOREAR


PAISAJE254:
LD HL,VACIO2X2+38	;ROCA ROJA
LD DE,VACIO2X2+76	;ARBOLES
JP PAISAJEVERTICAL

PAISAJE253:
LD HL,VACIO2X2+76	;ARBOLES
LD DE,VACIO2X2+114	;ROCAS 2 MONTAÑITAS
JP PAISAJEVERTICAL

PAISAJE252:
LD HL,VACIO2X2+114	;ROCAS 2 MONTAÑITAS
LD DE,VACIO2X2+38	;ROCA ROJA
JP PAISAJEVERTICAL

PAISAJE251:
LD HL,VACIO2X2+76	;ARBOLES
LD DE,VACIO2X2+76	;ARBOLES
JP PAISAJEVERTICAL

PAISAJE250:
LD HL,VACIO2X2+38	;ROCA ROJA
LD DE,VACIO2X2+76	;ARBOLES
JP PAISAJEHORIZONTAL

PAISAJE249:
LD HL,VACIO2X2+76	;ARBOLES
LD DE,VACIO2X2+114	;ROCAS 2 MONTAÑITAS
JP PAISAJEHORIZONTAL

PAISAJE248:
LD HL,VACIO2X2+114	;ROCAS 2 MONTAÑITAS
LD DE,VACIO2X2+38	;ROCA ROJA
JP PAISAJEHORIZONTAL

PAISAJE247:
LD HL,VACIO2X2+38	;ROCA ROJA
LD DE,VACIO2X2+114	;ROCAS 2 MONTAÑITAS
JP PAISAJEHORIZONTAL

;246 Y 247 LO HARE FUERA, EN CARGAPANTALLA ESPECIAL

PAISAJE244:
LD HL,VACIO2X2+76	;ARBOLES
LD DE,VACIO2X2+76	;ARBOLES
JP PAISAJEHORIZONTAL


		PAISAJEVERTICAL:
		PUSH DE
		LD BC,1793		;7,1
		LD DE,3845		;15x5
		LD A,255
		CALL RELLENA2D

		LD BC,4353		;17,1
		LD DE,3843		;15x3
		LD A,255
		POP HL
		CALL RELLENA2D

		CALL VIAVERTICAL
		
		POP HL        ;QUE NO PETE LA PILA AL SALIR
		RET

			PAISAJEHORIZONTAL:
			PUSH DE
			LD BC,1793		;7,1
			LD DE,2056		;8x8
			LD A,255
			CALL RELLENA2D

			LD BC,1809		;7,17
			LD DE,1800		;7x8
			LD A,255
			POP HL
			CALL RELLENA2D

			CALL VIAHORIZONTAL
		
			POP HL        ;QUE NO PETE LA PILA AL SALIR
			RET



;********************************************************************************************************
;COLOREAR UNA ZONA  (0 )
;********************************************************************************************************

PP_COLOREAR:
CP 0
JR NZ,PP_LINEAS2X2HV

CALL AUXILIAR_COORDENADAS   ;OBTENEMOS COORDENADAS Y/X EN BC
LD D,(IX+2)
LD E,(IX+3)
LD A,(IX+4)
CALL COLOREA
POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
LD BC,5       ;APARTIR DE 4 (INCLUIDO) YA COMPENSA FRENTE A LOS INC HL
ADD HL,BC
JP INICIOPINTAR


;********************************************************************************************************
;LINEAS 2X2 HORIZONTALES O VERTICALES  (1 - 30)
;********************************************************************************************************

PP_LINEAS2X2HV:
CP 31		   ;el primero del tramo siguiente
JR NC,PP_ZONAS2x2

   LD DE,38
   LD A,(IX+0)
   DEC A
   CALL Mul8      ;MULTIPLICACIÓN    HL=38*TIPO
   LD DE,VACIO2X2
   ADD HL,DE      ;SPRITE EN HL

   LD A,(IX+1)
   CALL SACADIM   ;DEVUELVE EN "D" LOCALIZACION  y EN "E" HORIZONTAL 1 / VERTICAL 2
   LD A,E
   CP 2
   JR Z,VERTICAL2X2

 HORIZONTAL2X2:
   LD C,1
   LD A,D
   ADD A,7
   LD B,A
   LD D,15
   LD E,1
   JR YAPINTAMOS2X2

 VERTICAL2X2:
   LD A,D
   SLA A
   INC A          ;A=(A*2)+1
   LD C,A
   LD B,7
   LD D,1
   LD E,8
   JR YAPINTAMOS2X2

   YAPINTAMOS2X2: ;----- COMUN ATRIBUTO HORIZONTAL Y VERTICAL

   LD A,255       ;ATRIBUTOS EN DEFB
   CALL RELLENA2D

   POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
   INC HL
   INC HL
   JP INICIOPINTAR

;********************************************************************************************************
;ZONAS 2X2   (31 - 60)
;********************************************************************************************************

PP_ZONAS2x2:
CP 61		     ;el primero del tramo siguiente
JR NC,PP_ZONAS1x1

LD A,(IX+2)
CALL SACADIM
PUSH DE

LD A,(IX+0)
SUB 31
LD DE,38
CALL Mul8      ;MULTIPLICACIÓN    HL=38*TIPO
LD DE,VACIO2X2
ADD HL,DE      ;SPRITE EN HL

CALL AUXILIAR_COORDENADAS   ;OBTENEMOS COORDENADAS Y/X EN BC

POP DE

LD A,255
CALL RELLENA2D

FINZONAS:

POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
INC HL
INC HL
INC HL
JP INICIOPINTAR


;********************************************************************************************************
;ZONAS 1X1 COMPRIMIDAS  (61 - 92)
;********************************************************************************************************
PP_ZONAS1x1:
CP 93		     ;el primero del tramo siguiente
JR NC,PP_ZONAS1x1sc

SUB 61
CALL OBTENHL1X1			;OBTENEMOS HL=DIRECCION DEL ESPRITE SEGUN EL TIPO EN "A" (0-29)     . OJO ROMPE "A" "DE" "HL"

CALL AUXILIAR_COORDENADAS   	;OBTENEMOS COORDENADAS Y/X COMPRIMIDAS EN "IX+1" Y LAS PONEMOS EN BC 
PUSH BC

LD A,(IX+2)
CALL SACADIM			;"DE" LARGO BAJO
POP BC				;"BC" COORDENADAS
LD A,(IX+3)			;"A"  COLOR
CALL RELLENA

POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
LD BC,4       ;APARTIR DE 4 (INCLUIDO) YA COMPENSA FRENTE A LOS INC HL
ADD HL,BC
JP INICIOPINTAR


;********************************************************************************************************
;ZONAS 1X1 SIN COMPRIMIR  (93 - 124)
;********************************************************************************************************
PP_ZONAS1x1sc:
CP 125		     ;el primero del tramo siguiente
JR NC,PP_MONTANIA

SUB 93
CALL OBTENHL1X1			;OBTENEMOS HL=DIRECCION DEL ESPRITE SEGUN EL TIPO EN "A" (0-29)     . OJO ROMPE "A" "DE" "HL"

LD B,(IX+1)			;"B"  Y
LD C,(IX+2)			;"C"  X
LD D,(IX+3)			;"D"  LARGO
LD E,(IX+4)			;"E"  BAJO
LD A,(IX+5)			;"A"  COLOR
CALL RELLENA

POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
LD BC,6       ;APARTIR DE 4 (INCLUIDO) YA COMPENSA FRENTE A LOS INC HL
ADD HL,BC
JP INICIOPINTAR


;********************************************************************************************************
;MONTAÑAS Y SIMILAR  (125 -129 )
;********************************************************************************************************
PP_MONTANIA:
CP  130		     ;el primero del tramo siguiente
JP NC,PP_COMBOS

;USO DE FORMA AUXILIAR ESPEJO+200(Y) ESPEJO+201(X) ESPEJO+202(COLOR) ESPEJO+203(LARGO) ESPEJO+204(BAJO) ESPEJO+205(AUX Y) ESPEJO+206 (AUX X)
	
	;LARGO/BAJO (ESPEJO+203 LARGO, ESPEJO+204 BAJO)´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´
	LD A,(IX+2)
	CALL SACADIM			;"DE" LARGO BAJO
        LD A,D
        LD (ESPEJO+203),A
	LD A,E
	LD (ESPEJO+204),A

	;COORDENADAS´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´
	CALL AUXILIAR_COORDENADAS   ;OBTENEMOS COORDENADAS Y/X EN BC -> (ESPEJO+200=Y ESPEJO+201=X)
        LD A,B
        LD (ESPEJO+200),A
        LD (ESPEJO+205),A
	LD A,C
	LD (ESPEJO+201),A
        LD (ESPEJO+206),A

	;COLOR	   (ESPEJO+202)´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´
	LD A,(IX+3)	     		;COLOR= 255 o 254 SEGUN VALOR > o < DE 100
	LD D,A				;(==**==) LO GUARDO PARA LUEGO DISTRIBUIR OPCIÓN
	CP 99
	JR C,COLORPRIMARIO
		COLORSECUNDARIO:
                LD A,254
		JR FIN_ASIGNA_COLOR
		COLORPRIMARIO:
		LD A,255
	FIN_ASIGNA_COLOR:
	LD (ESPEJO+202),A

	;INDEXAMOS VALORES DE BLOQUES´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´
	LD HL,TABLA_ESTRUCTURAS		;ORIGEN BUSQUEDA
	LD BC, 20		        ;Nº DE BYTES A BUSCAR    
	LD A,(IX+0)		        ;VALOR A BUSCAR
	CPIR		                ;BUSCAR (SIEMPRE ENCONTRARÁ)	-> HL YA EN DIRECCIÓN CORRECTA DE TABLA ESTRUCTURA CUADRO1
	PUSH HL
	POP IX				;PONEMOS IX EN PRIMER VALOR TABLA ESTRUCTURA, OJO IX YA NO ES CODIGO MAPAX

;DISTRIBUIMOS LO QUE QUEREMOS PINTAR

LD A,D
CP 5
JP Z,ESTRUCTURA5
CP 105
JP Z,ESTRUCTURA5
CP 4
JR Z,ESTRUCTURA4
CP 104
JR Z,ESTRUCTURA4
CP 3
JR Z,ESTRUCTURA3
CP 103
JR Z,ESTRUCTURA3
CP 2
JR Z,ESTRUCTURA2
CP 102
JR Z,ESTRUCTURA2

ESTRUCTURA1:		;::::::::::::::::::::
LD A,(IX+0)
JR ALE_VENGA_YA

ESTRUCTURA2:		;::::::::::::::::::::
LD A,(IX+1)
JR ALE_VENGA_YA

ESTRUCTURA3:		;::::::::::::::::::::
LD A,(IX+2)

	ALE_VENGA_YA:	;RELLENAMOS CON UN SOLO ESPRITE ESTRUCTURA 1,2 Y 3

	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE  
	EX DE,HL		    ;PASAMOS SPRITE A HL AGAIN

	LD A,(ESPEJO+200)	    ;COORD Y INICIAL
	LD B,A
	LD A,(ESPEJO+201)	    ;COORD X INICIAL
	LD C,A
	LD A,(ESPEJO+203)   	    ;LARGO
	LD D,A
	LD A,(ESPEJO+204)	    ;BAJO
	LD E,A
	LD A,(ESPEJO+202)	    ;COLOR

	CALL RELLENA2D
	JP ALE_VENGA


ESTRUCTURA4:		;::::::::::::::::::::

LD A,(ESPEJO+204)
LD B,A
BUCLE_ABAJO2:
PUSH BC

LD A,(ESPEJO+203)
LD B,A
BUCLE_LARGO2:
PUSH BC

	;1º BLOQUE
	LD A,(IX+0)
	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE 
	LD A,(ESPEJO+205)	    ;COORD Y 
	LD B,A
	LD A,(ESPEJO+206)	    ;COORD X 
	LD C,A
	PUSH BC			    ;(==**)
	LD A,(ESPEJO+202)	    ;COLOR
	CALL DIBUJA

	;2º BLOQUE
	LD A,(IX+1)
	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE 
	POP BC			    ;(==**)
	INC C
	INC C
	LD A,(ESPEJO+202)	    ;COLOR
	CALL DIBUJA

	LD A,(ESPEJO+206)	    ;BLOQUE DE AL LADO
	ADD A,4
	LD (ESPEJO+206),A

POP BC
DJNZ BUCLE_LARGO2

        LD A,(ESPEJO+205)
        ADD A,2
        LD (ESPEJO+205),A

        LD A,(ESPEJO+201)
        LD (ESPEJO+206),A
POP BC
DJNZ BUCLE_ABAJO2

JP ALE_VENGA


ESTRUCTURA5:		;::::::::::::::::::::

LD A,(ESPEJO+204)
LD B,A
BUCLE_ABAJO:
PUSH BC

LD A,(ESPEJO+203)
LD B,A
BUCLE_LARGO:
PUSH BC

	;1º BLOQUE
	LD A,(IX+0)
	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE 
	LD A,(ESPEJO+205)	    ;COORD Y 
	LD B,A
	LD A,(ESPEJO+206)	    ;COORD X 
	LD C,A
	PUSH BC			    ;(==**)
	LD A,(ESPEJO+202)	    ;COLOR
	CALL DIBUJA

	;2º BLOQUE
	LD A,(IX+1)
	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE 
	POP BC			    ;(==**)
	INC C
	INC C
	PUSH BC			    ;(XX**)
	LD A,(ESPEJO+202)	    ;COLOR
	CALL DIBUJA

	;3º BLOQUE
	LD A,(IX+2)
	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE
	POP BC			    ;(XX**)
	INC B
	INC B
	PUSH BC			    ;(//**)
	LD A,(ESPEJO+202)	    ;COLOR
	CALL DIBUJA

	;4º BLOQUE
	LD A,(IX+2)
	CALL AUXILIAR_MONTANIA	    ;OBTENGO DE=SPRITE 
	POP BC			    ;(//**)
	DEC C
	DEC C 
	LD A,(ESPEJO+202)	    ;COLOR
	CALL DIBUJA

	LD A,(ESPEJO+206)	    ;BLOQUE DE AL LADO
	ADD A,4
	LD (ESPEJO+206),A

POP BC
DJNZ BUCLE_LARGO

        LD A,(ESPEJO+205)
        ADD A,4
        LD (ESPEJO+205),A

        LD A,(ESPEJO+201)
        LD (ESPEJO+206),A
POP BC
DJNZ BUCLE_ABAJO


ALE_VENGA:
POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
LD BC,4       ;APARTIR DE 4 (INCLUIDO) YA COMPENSA FRENTE A LOS INC HL
ADD HL,BC
JP INICIOPINTAR

;********************************************************************************************************
;COMBOS  (130 -140 )
;********************************************************************************************************
PP_COMBOS:
CP  150		     ;el primero del tramo siguiente
JR NC,PP_OBJETOS


	LD HL,COMBOJETOS		;ORIGEN BUSQUEDA
	LD BC, 63		        ;Nº DE BYTES A BUSCAR     ¡¡ ACTUALIZARLO ¡¡
	LD A,(IX+0)		        ;VALOR A BUSCAR
	CPIR		                ;BUSCAR (SIEMPRE ENCONTRARÁ)	-> HL YA EN DIRECCIÓN CORRECTA DE TABLA COMBOJETOS, EN VALOR DISPOSICION

        CALL AUXILIAR_COORDENADAS       ;OBTENEMOS COORDENADAS B=Y/C=X
        LD A,B                          ;LAS GUARDAMOS EN JOKER3 Y JOKER4
        LD (JOKER3),A
        LD A,C
        LD (JOKER4),A

	LD D,0
	LD E,(HL)
	LD IX,COMBOCOLOCA
	ADD IX,DE		        ;COLOCAMOS IX EN LUGAR CORRECTO SEGÚN LA DISTRIBUCIÓN DEL COMBO, OJO IX YA NO ES CODIGO MAPAX


    GUALKITOLKI:

        INC HL
        LD A,(HL)
        CP 255
        JR Z,FINCOMBO

        PUSH HL

        LD A,(HL)                       ;CARGAMOS OBJETO A PINTAR
        CALL SELECCION_OBJETO           ;OBTENEMOS EN "HL" LA DIRECCIÓN DEL ESPRITE INDEXADO EN "OBJETOX"

        LD A,(JOKER3)
        LD B,(IX+0)
        ADD A,B
        LD B,A
        LD (JOKER3),A

        LD A,(JOKER4)
        LD C,(IX+1)
        ADD A,C
        LD C,A
        LD (JOKER4),A

        EX DE,HL
        LD A,255
        CALL DIBUJA

       INC IX
       INC IX
       POP HL

    JR GUALKITOLKI



FINCOMBO:
POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
INC HL
INC HL
JP INICIOPINTAR

;********************************************************************************************************
;SIN DETERMINAR  (141 -149 )
;********************************************************************************************************
;PP_SINDETERMINAR:
;CP  150		     ;el primero del tramo siguiente
;JR NC,PP_OBJETOS


;********************************************************************************************************
;OBJETOS  (150 - 250)
;********************************************************************************************************
PP_OBJETOS:

LD A,(IX)
CALL QUEOBJETOES     ;OBTENEMOS EN HL SPRITE CORRECTO (INVERTIDO O NO) Y EN JOKER3 EL COLOR

CALL AUXILIAR_COORDENADAS   ;OBTENEMOS COORDENADAS Y/X EN BC

LD A,(JOKER3)
EX DE,HL      ;ESPRITE EN "DE"
CALL DIBUJA

POP HL        ;SACAMOS DE LA PILA HL -------------------------------------------------------------------------------------------------------***
INC HL
INC HL
INC HL
JP INICIOPINTAR

SIGUIENTEDATO:

JP INICIOPINTAR



;***************************************************************** RUTINAS AUXILIARES DE PINTAPANTALLA

;***********************************************************************************
AUXILIAR_COORDENADAS:
LD A,(IX+1)
CALL SACADIM
LD A,D
ADD A,7
LD B,A        ;Y=Y+7
LD A,E
SLA A
INC A
LD C,A        ;X=X*2+1
RET

;***********************************************************************************
OBTENHL1X1:
;OBTENEMOS HL 8X8 SEGÚN TIPO EN "A"
SLA A
SLA A
SLA A
LD D,0
LD E,A
LD HL,VACIO1X1
ADD HL,DE
RET

;***********************************************************************************

AUXILIAR_MONTANIA:  	;ENTRADA A=VALOR DEL ESPRITE LISTA FALDA2X2
LD DE,42
CALL Mul8      		;MULTIPLICACIÓN    HL=42*TIPO (DE*A)
LD DE,FALDA2X2
ADD HL,DE      		;SPRITE EN HL
EX DE,HL       		;ESPRITE EN DE
RET

;***********************************************************************************

;;ENTRADA "A", OBJETO
;;OBTENEMOS EN "HL" LA DIRECCIÓN DEL ESPRITE INDEXADO EN "OBJETOX" (O SU INVERSA) Y EN "JOKER3" EL COLOR

QUEOBJETOES:

CALL SELECCION_OBJETO

   LD A,(IX+2)
   CALL SACADIM

     LD A,D              ;COLOR
     CP 0
     JR Z,RIMBOMBANTE
     CP 8
     JR Z,RIMBOMBANTE_BIS
     ADD A,64
     JR RIMBOMBANTE2
  RIMBOMBANTE:
     LD A,255
     JR RIMBOMBANTE2
  RIMBOMBANTE_BIS:
     LD A,254
  RIMBOMBANTE2:
     LD (JOKER3),A

     LD A,E              ;INVERSA?
     CP 0
     RET Z

     CALL INVERSO
     LD HL,ESPEJO

RET

;***********************************************************************************

SELECCION_OBJETO:
   LD DE, TABLAOBJETO            ;BASE DE LA TABLA CON EL TAMAÑO DE CADA OBJETO
   LD HL,OBJETOX
   CP 150                           ;EN "A" ESTÁ EL Nº DE OBJETO
   JR Z,FINESCOGEOBJETO             ;SI OBJETO=150, HL YA ESTÁ BIEN.
   SUB 150
   LD B,A
 CARCAMUSERO:
   PUSH BC

   LD A,(DE)
   LD B,0
   LD C,A
   ADD HL,BC
   INC DE                           ;HL=1º BITE DEL OBJETO

   POP BC
 DJNZ CARCAMUSERO

 FINESCOGEOBJETO:

   ;AQUI YA TENGO EL HL DEL OBJETO
RET

;***********************************************************************************

VIAVERTICAL:
LD BC,1803	;7,11
LD DE,264	;1X8
LD A,255
LD HL,VACIO2X2+228	;VIA VERTICAL
CALL RELLENA2D
RET


VIAHORIZONTAL:
LD BC,4353	;17,1
LD DE,3841	;15X1
LD A,255
LD HL,VACIO2X2+266	;VIA HORIZONTAL
CALL RELLENA2D
RET




;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
; 5- CARGAFONDOS Y RELACIONADOS
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


CARGAFONDITO:

;CARGAMOS FONDOS ANIMADOS Y AVECES HASTA PINTAMOS


LD IX,TABLA_FONDITO
LD DE,FONDITO

CARGANDO_FONDITO:

;SI 1º VALOR=255 SALIMOS

	LD A,(IX+0)
	LD B,A
	CP 255
	RET Z

;COMPARAMOS CON VALOR PANTALLA

	LD A,(PANTALLA)
	CP B
	JP NZ,SIGUIENTE_FONDITO

;COINCIDE, CARGAMOS FONDITO
                CARGANDO_EN_DESIERTO:
	;Y-X-VELOCIDAD-COLOR-LIM FRAMES xxxxxxxxxxxxxxxxxxxxxx
	PUSH IX
	POP HL
	INC HL		;ORIGEN
	;DE		;DESTINO
	LD BC,5		;TAMAÑO
	LDIR

	;FUNCIONA?  xxxxxxxxxxxxxxxxxxxxxx
	LD A,(IX+7)
	CP 0
	JR Z,SUCESO_1	;SI ESTADO=0 ENTONCES DAMOS VALOR SUCESO1 SIEMPRE

	CALL PESTADO	;ENTRADA Nº ESTADO, SALIDA VALOR DE ESE ESTADO  USA "BC" "HL" "A"
	CP 1
	JR Z,SUCESO_1

		SUCESO_0:
		LD A,(IX+8)
		JR FIN_FUNCIONA_ONO

		SUCESO_1
		LD A,(IX+9)

	FIN_FUNCIONA_ONO:
	INC DE		
	INC DE	
	LD (DE),A

	
	;ESPRITE BASE DE LA ANIMACIÓN  xxxxxxxxxxxxxxxxxxxxxx

      	INC DE
      	PUSH DE

      	LD A,(IX+6)		;TIPO
      	LD DE,TABLAFONDO
      	LD HL,0
      	CALL TRUCO_CONTADOR_FRASESII   ;DEVUELVE HL, BUFFER A SUMAR A FONDOX
      	LD DE,FONDOX
      	ADD HL,DE
      	POP DE
      	LD A,H
      	LD (DE),A
	LD B,A		;(**)
      	INC DE
      	LD A,L
      	LD (DE),A            ;SPRITE BASE
	LD C,A		;(***)

	;TAMAÑO DEL ESPRITE  xxxxxxxxxxxxxxxxxxxxxx

	INC DE
	PUSH DE		;(++++)

	LD H,B		;(**)
	LD L,C		;(***)

	LD A,(HL) 
	LD D,A
	INC HL
	LD A,(HL)
	LD E,A
	CALL Multiply	;HL=D*E  LARGO*ANCHO
	LD A,L
	SLA A
	SLA A
	SLA A	;x8
	ADD A,L
	ADD A,2

	POP DE		;(++++)
	LD (DE),A

	INC DE		;PRIMER VALOR "DE" DE SIGUIENTE

SIGUIENTE_FONDITO:
LD BC,10
ADD IX,BC
JP CARGANDO_FONDITO

;-------------------------------------------

PINTAFONDO_ANIMADO:        ;EN CARGAPANTALLA
LD B,(IX+0)
LD C,(IX+1)
LD D,(IX+8)
LD E,(IX+9)
LD A,(IX+3)
CALL DIBUJA
RET

;-------------------------------------------
CONTAFRAME_CERO:           ;EN BUCLE
XOR A
LD (IX+6),A
RET


;++++++++++++++++++++++
;++++++++++++++++++++++
; 6-  PINTASTADOS Y RELACIONADAS
;++++++++++++++++++++++
;++++++++++++++++++++++


CARGASTADOS:

LD HL,TABLA_PINTASTADOS
LD DE,ESTADILLO

CARGANDO_ESTADOS:

     ;SI (HL)=255 HEMOS ACABADO --------------------------------------
     LD A,(HL)
     LD B,A
     CP 255
     RET Z

     ;COMPARAMOS 1ºVALOR CON VALOR PANTALLA -------------------------------
     LD A,(PANTALLA)
     CP B
     JP NZ,SIGUIENTEPLANDASTA

     ;SI COINCIDE CON PANTALLA, CARGAMOS VALORES ---------

     INC HL               ;ORIGEN
     ;LD DE,ESTADILLO     ;DESTINO
     LD BC,5              ;TAMAÑO
     LDIR                 ;COPIAR

     JR CARGANDO_ESTADOS

SIGUIENTEPLANDASTA:

LD BC,6
ADD HL,BC
JR CARGANDO_ESTADOS



;***********************************
PINTASTADO:

LD IX,ESTADILLO

PINTANDO_ESTADOS:
LD A,(IX+0)
CP 0
RET Z            

CALL PESTADO  ;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO, usa "HL" - "BC" - "A"
CP 0
JR Z,PINTA_VALOR_0

PINTA_VALOR_1:
LD A,(IX+4)    ;TIPO
CP 255
JR Z,ESTADO_SIGUIENTE       ;SI =255 NO PINTAMOS
JP PINTASTANDANDOLO

PINTA_VALOR_0:
LD A,(IX+3)    ;TIPO
CP 255
JR Z,ESTADO_SIGUIENTE       ;SI =255 NO PINTAMOS

PINTASTANDANDOLO:

      	LD DE,TABLA_CUENTASTADOS
      	LD HL,0
      	CALL TRUCO_CONTADOR_FRASESII   ;DEVUELVE HL, BUFFER A SUMAR A SPRITES_PINTASTADOS
      	LD DE,SPRITES_PINTASTADOS
      	ADD HL,DE
        EX DE,HL
        LD B,(IX+1)
        LD C,(IX+2)
        LD A,255
        CALL DIBUJA

ESTADO_SIGUIENTE:
LD BC,5
ADD IX,BC
JP PINTANDO_ESTADOS


;***********************************

PESTADO:
;ENTRADA A= Nº ESTADO, SALIDA A= VALOR DE ESE ESTADO
LD HL,ESTADOS
LD B,0
LD C,A
ADD HL,BC
LD A,(HL)
RET

;***********************************

PINTA18:
; PANTALLA 18 ESPECIAL


LD IX,TABLA18

	LD B,9
	ENBOLINGA2:
	PUSH BC

	  LD B,(IX+0)
	  DEC B
	  LD C,(IX+1)
	  LD A,255
	  LD DE,PEBETEROX
	  CALL DIBUJA

	INC IX
	INC IX
	INC IX

	POP BC
	DJNZ ENBOLINGA2

LD IX,TABLA18
LD DE,ESTADOS+6

	LD B,9
	ENBOLINGA:
	PUSH BC

	LD A,(DE)
	CP 0
	JR Z,ZIGWINTE

	  PUSH DE
	  LD B,(IX+0)
	  LD C,(IX+1)
	  LD A,(IX+2)
	  LD DE,SPRITE_RESORTE18
	  CALL DIBUJA
          POP DE

	ZIGWINTE:
	INC DE
	INC IX
	INC IX
	INC IX

	POP BC
	DJNZ ENBOLINGA

RET

TABLA18:
DEFB 11,7,66, 11,10,67, 11,13,68, 11,16,70, 11,19,71, 11,25,66, 8,13,67, 8,16,68, 8,19,70


;***********************************

PINTA153:
; PANTALLA 153 ESPECIAL

LD IX,CLAVECOLOR
LD A,7
LD (JOKER),A

LD B,6
WUCLEP153:
PUSH BC

	LD A,(JOKER)
	LD D,A
	ADD A,2
	LD (JOKER),A
	LD B,16
	LD C,D
	LD DE,SPRITE_DIAMANTE
	LD A,(IX+0)
	CALL DIBUJA

	INC IX

POP BC
DJNZ WUCLEP153
 
RET

;***********************************

PINTA7:
; PANTALLA 7 ESPECIAL  -> TORNO INTERCAMBIADOR

LD IX,ETORNO+0
CALL PINTA_TORNO

LD IX,ETORNO+3
CALL PINTA_TORNO

RET


PINTA_TORNO:
LD A,(IX+1)
CP 0
RET Z

LD DE,TABLA_CUENTASTADOS
LD HL,0
CALL TRUCO_CONTADOR_FRASESII   ;DEVUELVE HL, BUFFER A SUMAR A SPRITES_PINTASTADOS
LD DE,SPRITES_PINTASTADOS
ADD HL,DE
EX DE,HL
LD B,17				;Y FIJA
LD C,(IX+2)
LD A,255
CALL DIBUJA

RET


;***********************************

PINTANDO_DE_TABLA:

;PINTA LOS DIBUJAS DE LA TABLA:   IX=   NºOBJETOS,  Y1 X1 COLOR SPRITE  Y2 X2 COLOR SPRITE ...

LD B,(IX+0)
INC IX
WUCLEYEPA:
PUSH BC

	LD B,(IX+0)
	LD C,(IX+1)
	LD A,(IX+2)
	LD D,(IX+4)
	LD E,(IX+3)
	CALL DIBUJA

	LD DE,5
	ADD IX,DE	

POP BC
DJNZ WUCLEYEPA
RET

;***********************************

ESCRIBIENDO_DE_TABLA:

;ESCRTIBE PALABRAS DE LA TABLA:   IX=   NºOBJETOS,  Y1 X1 COLOR LETRAS  PALABRA ...

LD B,(IX+0)
INC IX
MMUKLE:
PUSH BC
     LD B,(IX+0)
     LD C,(IX+1)
     LD A,(IX+2)
     LD (TINTA),A
     LD D,(IX+4)
     LD E,(IX+3)
     CALL UNAFRASE
     LD DE,5
     ADD IX,DE
POP BC
DJNZ MMUKLE
RET

;***********************************

COLOREANDO_DE_TABLA:

;PINTA LOS DIBUJAS DE LA TABLA:   IX=   NºOBJETOS,  Y1 X1 LARGO BAJO COLOR ...

LD B,(IX+0)
INC IX
WUCLEYEPA2:
PUSH BC

	LD B,(IX+0)
	LD C,(IX+1)
	LD D,(IX+2)
	LD E,(IX+3)
	LD A,(IX+4)
	CALL COLOREA

	LD DE,5
	ADD IX,DE	

POP BC
DJNZ WUCLEYEPA2
RET




;++++++++++++++++++++++
;++++++++++++++++++++++
; 7-  CARGAEVENTOS Y RELACIONADAS
;++++++++++++++++++++++
;++++++++++++++++++++++


CARGAEVENTOS:

LD HL,TABLA_EVENTOS
LD DE,EVENTOS

CARGANDO_EVENTOS:

     ;SI (HL)=255 HEMOS ACABADO --------------------------------------
     LD A,(HL)
     LD B,A
     CP 255
     RET Z

     ;COMPARAMOS 1ºVALOR CON VALOR PANTALLA -------------------------------
     LD A,(PANTALLA)
     CP B
     JP NZ,SIGUIENTEPLANDA

     ;SI COINCIDE CON PANTALLA, CARGAMOS VALORES ---------

     INC HL               ;ORIGEN
     ;LD DE,EVENTOS       ;DESTINO
     LD BC,12             ;TAMAÑO
     LDIR                 ;COPIAR

     JR CARGANDO_EVENTOS

SIGUIENTEPLANDA:

LD BC,13
ADD HL,BC
JR CARGANDO_EVENTOS


;***********************************

AUXILIAR_EVENTOS:
;USADA EN BUCLE EN EVENTOS
;CAMBIA ESTADOS SEÑALADOS EN IX+7 e IX+8,  CAMBIA FONDOS ANIMADOS SEGUN IX+10 e IX+11
		        			
                       LD A,(IX+7)              ;Nº ESTADO
                       CALL PESTADO  		;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO "HL" DIRECCION DEL ESTADO, usa "HL" - "BC" - "A"
		       XOR 1			; 0 -> 1  y  1 -> 0
                       LD (HL),A                ;MODIFICAMOS VALOR DEL ESTADO

                       LD A,(IX+8)              ;Nº ESTADO
 		       CP 0
		       JR Z,LOSFONDOS
                       CALL PESTADO  		;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO "HL" DIRECCION DEL ESTADO, usa "HL" - "BC" - "A"
		       XOR 1			; 0 -> 1  y  1 -> 0
                       LD (HL),A                ;MODIFICAMOS VALOR DEL ESTADO

		       LOSFONDOS:
		       ;HACEMOS QUE LOS POSIBLES FONDOS ANIMADOS FUNCIONEN O NO:  255 PASO /1 CAMBIO 0<>1
		        
				ERFONDO1:
				LD A,(IX+10)
				CP 255
				JR Z,ERFONDO2
				LD A,(FONDITO+7)
				XOR 1
				LD (FONDITO+7),A

				ERFONDO2:
				LD A,(IX+11)
				CP 255
				RET Z
				LD A,(FONDITO+18)
				XOR 1
				LD (FONDITO+18),A
RET



;***********************************

;AUXILIARES EN TORNO INTERCAMBIADOR

;----------------------




;----------------------
TRADUCCION:
        ;A=VALOR INVENTARIO A BUSCAR
        ;SALIDA: A=VALOR PINTASTADO
	LD HL,TABLA_TRADUCE		;ORIGEN BUSQUEDA
	LD BC,8		                ;Nº DE BYTES A BUSCAR
	CPIR
        LD A,(HL)
        RET

TABLA_TRADUCE:
DEFB 6,11, 7,12,  8,15,  9,14


;----------------------



;++++++++++++++++++++++
;++++++++++++++++++++++
; 8- COPIYUPI @ COPITRANS
;++++++++++++++++++++++
;++++++++++++++++++++++

COPIYUPI:      ;PARA RESTAURARLA QUITAR TODOS LOS ";" MEDIOS

;ESTA VERSION COPIA UN TROZO DE PANTALLA EN "ESPEJO", RESPETANDO EL FORMATO DE LA RUTINA "DIBUJA" PARA LUEGO IMPRIMIRLA. NO PUEDEN SER MAS DE 32 CARACTERES EN ANOTHER WORLD

;          ENTRADA   "BC"  "YX" ESQUINA SUPERIOR IZQUIERDA A COPIAR
;                    "DE"  LARGO/BAJO


              ;1º PRIMEROS DOS BITES ES DIMENSION ESPRITE
      ;        LD HL,ESPEJO
      ;        LD A,D
      ;        LD (HL),A
      ;        LD (JOKER),A    ;GUARDO LARGO PARA LUEGO
      ;        LD A,E
      ;        INC HL
      ;        LD (HL),A
      ;        LD (GUDAR),A    ;GUARDO BAJO PARA LUEGO

              ;2º DATOS PIXELS
      ;        CALL RESIDENCIA;ENTRADA  BC(YX) SALIDA HL-> 1º DIRECCION A COPIAR
      ;        PUSH HL        ;PUSEO PARA LUEGO ATRIBUTOS(***)

      ;        LD A,D         ;GUARDO EN "A" CARACTERES A LO LARGO

      ;        SLA E          ;Ex2    E=CARACTERES HACIA ABAJO
      ;        SLA E          ;Ex4
      ;        SLA E          ;Ex8
      ;        LD B,E         ;Nº DE SCAN A COPIAR HACIA ABAJO

      ;        LD DE,ESPEJO+2   ;SACO DIRECCIÓN DESTINO  (**1)

      ;        COPIYUPI2:
      ;        PUSH BC

      ;        PUSH HL
                              ;HL ->ORIGEN
                              ;DE ->DESTINO
      ;        LD B,0          ;BC ->TAMAÑO
      ;        LD A,(JOKER)
      ;        LD C,A
      ;        LDIR            ;COPIAR

      ;        POP HL
      ;        CALL EMPANADAHR ;BAJO UN SCAN

      ;        POP BC
      ;        DJNZ COPIYUPI2

             ;3º DATOS ATRIBUTOS

      ;        POP HL          ;POPEO 1º DIRECCION PIXELES (***)
      ;        CALL RESIDENCIATRIBUTO
              ;"DE" 1º DIRECCION CORRECTA DE ATRIBUTOS

      ;        LD A,(GUDAR)
      ;        LD B,A
      ;        A_LO_BAJO:
      ;        PUSH BC

      ;        PUSH HL

      ;        LD A,(JOKER)
      ;        LD B,A
      ;        A_LO_LARGO:
      ;        LD A,(HL)
      ;        LD (DE),A
      ;        INC HL
      ;        INC DE
      ;        DJNZ A_LO_LARGO

      ;        POP HL                          ;BAJAMOS A SIGUIENTE FILA DE ATRIBUTOS
      ;        LD BC,32
      ;        ADD HL,BC
              ;LD (HUCHA),HL

      ;        POP BC
      ;        DJNZ A_LO_BAJO

      ;        RET


COPITRANS:
;ESTA RUTINA COPIA EL TITULO SITUADO EN PARTE INFERIOR EN LA PARTE ALTA DE LA PANTALLA DE JUEGO

;            LD HL,20613         ;ORIGEN    Y=20  X=5
;            LD DE,16485         ;DESTINO   Y=3   X=5


;       LD B,4
;       LULIPOPI:
;       PUSH BC

;       PUSH HL
;       PUSH DE

;            LD B,8
;            LILIPOP:
;            PUSH BC

;            PUSH HL
;            PUSH DE

;            LD BC,22
;            LDIR

;            POP DE
;            POP HL

;            INC H
;            INC D

;            POP BC
;            DJNZ LILIPOP

;       POP DE
;       POP HL

;       LD A,L
;       ADD A,32
;       LD L,A
;       LD A,E
;       ADD A,32
;       LD E,A

;       POP BC
;       DJNZ LULIPOPI

;RET





;++++++++++++++++++++++
;++++++++++++++++++++++
; 9-  CARGAMETEORO Y RELACIONADAS 
;++++++++++++++++++++++
;++++++++++++++++++++++


CARGAMETEORO:

LD IX,TABLA_METEORO
LD HL,TABLA_METEORO
LD DE,METEORO

CARGANDO_METEORO:

     ;SI (HL)=255 HEMOS ACABADO --------------------------------------
     LD A,(HL)
     LD B,A
     CP 255
     RET Z

     ;COMPARAMOS 1ºVALOR CON VALOR PANTALLA -------------------------------
     LD A,(PANTALLA)
     CP B
     JP NZ,SIGUIENTEMETEORO

     ;SI COINCIDE CON PANTALLA, CARGAMOS VALORES ---------

     LD A,(IX+1)
     LD (IX+3),A
     LD A,(IX+2)	  ;OJO, ES UN IX DESDE PANTALLA PARA INICIAR VALORES
     LD (IX+4),A

     INC HL               ;ORIGEN
     ;LD DE,METEORO       ;DESTINO
     LD BC,12             ;TAMAÑO
     LDIR                 ;COPIAR

     LD BC,13
     ADD IX,BC

     JR CARGANDO_METEORO

SIGUIENTEMETEORO:

LD BC,13
ADD HL,BC
ADD IX,BC
JR CARGANDO_METEORO














;++++++++++++++++++++++
;++++++++++++++++++++++
; 10- MARCOS
;++++++++++++++++++++++
;++++++++++++++++++++++

;MARCOS:
;ENTRADA IX,MARCOX+BUFFER TABLA

;LD B,(IX+0)
;LD C,(IX+1)
;LD D,(IX+4)
;LD E,1
;LD A,(IX+6)
;LD HL,VACIO1X1+128
;CALL RELLENA

;LD B,(IX+2)
;LD C,(IX+1)
;LD D,(IX+4)
;LD E,1
;LD A,(IX+6)
;LD HL,VACIO1X1+128
;CALL RELLENA

;LD B,(IX+0)
;LD C,(IX+1)
;LD D,1
;LD E,(IX+5)
;LD A,(IX+6)
;LD HL,VACIO1X1+128
;CALL RELLENA

;LD B,(IX+0)
;LD C,(IX+3)
;LD D,1
;LD E,(IX+5)
;LD A,(IX+6)
;LD HL,VACIO1X1+128
;CALL RELLENA

;RET
;JP NO_MARCOS

;MARCOX_TABLA:
;DEFB 12,0, 11,7, 2,14, 9,21, 30,28, 40,35,    255

MARCOX:
;DEFB Yarriba,Xarriba,Yabajo,Xabajo,RESTA Xabajo-Xarriba, RESTA Yabajo-yarriba+1, COLOR

;DEFB 7,16,12,25,9,6,50     ;+0  PANTALLA 12
;DEFB 5,8,14,19,11,10,67    ;+7  PANTALLA 11
;DEFB 4,12,10,21,9,7,66	   ;+14 PANTALLA 2
;DEFB 6,10,11,19,9,6,69	   ;+21 PANTALLA 9
;DEFB 5,10,10,19,9,6,4	   ;+28 PANTALLA 30
;DEFB 4,14,16,26,12,13,68   ;+35 PANTALLA 40


;----- ESTA ERA PARA MARCOS MAS ELABORADOS

;1º PINTAMOS ESQUINAS

;LD (JOKER),A
;LD (JORCAS2),HL


;LD BC,4128         ;ESQUINA ARRIBA IZQUIERDA
;CALL HR1X1

;LD BC,4312         ;ESQUINA ARRIBA DERECHA
;CALL SUBESPRITE
;CALL HR1X1

;LD BC,38944        ;ESQUINA ABAJO IZQUIERDA
;CALL SUBESPRITE
;CALL HR1X1

;LD BC,39128        ;ESQUINA ABAJO IZQUIERDA
;CALL SUBESPRITE
;CALL HR1X1

;1º PINTAMOS TIRAS

;CALL SUBESPRITE   ;ARRIBA
;LD BC,517
;LD DE,5633
;CALL RELLENA

;CALL SUBESPRITE   ;ABAJO
;LD BC,4869
;LD DE,5633
;CALL RELLENA

;CALL SUBESPRITE   ;IZQUIERDA
;LD BC,772
;LD DE,272
;CALL RELLENA

;CALL SUBESPRITE   ;DERECHA
;LD BC,795
;LD DE,272
;CALL RELLENA

;RET


;SUBESPRITE:
;LD HL,(JORCAS2)
;LD DE,8
;ADD HL,DE
;LD (JORCAS2),HL   ;SUBO ASPRITE+8
;LD A,(JOKER)      ;PONGO COLOR
;RET



;++++++++++++++++++++++
;++++++++++++++++++++++
; 11- LA VIDA Y LA MUERTE
;++++++++++++++++++++++
;++++++++++++++++++++++

;******************************************************************************************************
;******************************************************************************************************

MUERTExBALAMETEORO:
;LA MUERTE POR ESTAS BALAS TE QUITAN MUCHA VIDA Y PROVOCAN CARGAPANTALLA			

POP BC			;POPEO PORQUE VENGO DE BUCLE PUSHEADO, VIENES POR UN "JP"

LD A,(VALORES_PERSONAJES+17)		;VIDA
SUB 100					;%%%%%%%%%%%%%% AJUSTAR CUANDO SEPA EXACTAMENTE VIDA - DAÑO POR INTERFACE %%%%%%%%%%%%%%%%%
CALL QUITAVIDA				;ESTUDIA VIDA YA RESTADA - GUARDA Y PINTA INTERFEIS - FX  SI ES CERO POPEA Y MUERTE TOTAL

;FX "MAS ELABORAO"

LD A,(PANTALLA)
LD IX,RESUCITAR

RESURECCIONANDO:
CP (IX+0)
JR NZ,SIGUIENTE_RESURECCIONANDO		;SIEMPRE ENCONTRARÁ
   
		LD A,(IX+1)		;NUEVA COORDENADA Y
		LD (VALORES_PERSONAJES+0),A	
		LD A,(IX+2)		;NUEVA COORDENADA X
		LD (VALORES_PERSONAJES+1),A	
		JP CARGAPANTALLA

SIGUIENTE_RESURECCIONANDO:
INC IX
INC IX
INC IX
JR RESURECCIONANDO




;******************************************************************************************************
;******************************************************************************************************
QUITAVIDA:
;ESTUDIA VIDA YA RESTADA (SI ES CERO Nº DE VIDAS POPEA Y MUERTE TOTAL)- GUARDA Y PINTA INTERFEIS - FX  

;CALL EFECTO1

;ENTRA CON VIDA RESTADA PERO NO ESTUDIADA


CP 0
JR Z,HAS_QUITAO_UNA_VIDA
CP 100				;%%%%%%%%%%%%%% AJUSTAR CUANDO SEPA EXACTAMENTE VIDA - DAÑO POR INTERFACE %%%%%%%%%%%%%%%%%
JR NC,HAS_QUITAO_UNA_VIDA

LD (VALORES_PERSONAJES+17),A	;GUARDA VIDA
JR PINTA_MUERTE_PARCIAL

HAS_QUITAO_UNA_VIDA:
LD B,A
LD A,255
SUB B
LD B,A				;A=LA VIDA QUE HAY QUE QUITAR AL TOPE DE VIDA
LD A,99			;%%%%%%%%%%%%%% AJUSTAR CUANDO SEPA EXACTAMENTE VIDA OJO ES UNO MENOS DE LA VIDA TOTAL
SUB B
LD (VALORES_PERSONAJES+17),A	;GUARDA VIDA

LD A,(VALORES_PERSONAJES+18)	;NUMERO DE VIDAS
DEC A
LD (VALORES_PERSONAJES+18),A	;NUMERO DE VIDAS
CP 0
JP Z,MUERTE_TOTAL


;RESTAURAMOS INTERFEIS

CALL RESTAURA_VIDA_INTERFEIS


;PINTAMOS INTERFEIS
PINTA_MUERTE_PARCIAL:

CALL EFECTO1

LD A,71
LD (TINTA),A

LD A,(VALORES_PERSONAJES+8)		;USO A QUIEN LLEVO PARA QUITAR TAMBIÉN VIDA SI ESTAS EN COCHE Y TAL (NO ROBOT, ESO Y ARREGLADO) 1-MALFARIO 2-FMANAGER
CP 1
JR Z,QUITOVIDA_MALFARIO


QUITOVIDA_FMANAGER:

LD A,(VALORES_PERSONAJES+18)		;Nº VIDAS FMANAGER        
LD BC,25				;0,25
CALL UNNUMERO

LD A,(VALORES_PERSONAJES+17)		;VIDA FMANAGER		
											
LD HL,TABLA_MARCADORVIDA		;ORIGEN BUSQUEDA							
LD BC, 20				;Nº DE BYTES A BUSCAR    							
;LD A,(IX+0)				;VALOR A BUSCAR							
CPIR				 	;BUSCAR (SIEMPRE ENCONTRARÁ) -> HL EN VALOR SIGUIENTE			
LD BC,39				;LD BC,19 SI ES MALFARIO							
ADD HL,BC											
LD A,(HL)				;COORDENADA X GUAY.							
											
SUB 152					;A=COORD GUAY-152							

	CP 0
	RET Z				;SI DA CERO NO BORRAMOS PORQUE VIDA=100	

SRA A					;/2	Nº DE VECES DEL BUCLE						
LD B,A											
LD A,152											
LD (ESPEJO+260),A			;X DE INICIO
LD A,2								
LD (ESPEJO+261),A			;VARIACION DE X +2/-2 SEGUN SEA UNO U OTRO										
											
JP DESVITANDO



QUITOVIDA_MALFARIO:
LD A,(VALORES_PERSONAJES+18)		;Nº VIDAS MALFARIO	
LD BC,6				        ;0,24
CALL UNNUMERO

LD A,(VALORES_PERSONAJES+17)		;VIDA MALFARIO

LD HL,TABLA_MARCADORVIDA		;ORIGEN BUSQUEDA							
LD BC, 20				;Nº DE BYTES A BUSCAR    							
;LD A,(IX+0)				;VALOR A BUSCAR							
CPIR				 	;BUSCAR (SIEMPRE ENCONTRARÁ) -> HL EN VALOR SIGUIENTE			
LD BC,19
ADD HL,BC											
LD A,(HL)				;COORDENADA X GUAY.


LD B,A					;CASO MALFARIO							
LD A,103											
SUB B					;A=103-COORD GUAY							

	CP 0
	RET Z				;SI DA CERO NO BORRAMOS PORQUE VIDA=100

SRA A					;/2 Nº DE VECES DEL BUCLE						
LD B,A											


LD A,103
LD (ESPEJO+260),A			;X DE INICIO
LD A,-2								
LD (ESPEJO+261),A			;VARIACION DE X +2/-2 SEGUN SEA UNO U OTRO


DESVITANDO:		
PUSH BC		
	LD B,2
	LD A,(ESPEJO+260)
	LD C,A	
	CALL JBPLOT0	
	LD B,3
	LD A,(ESPEJO+260)	
	LD C,A	
	CALL JBPLOT0	
	LD B,4
	LD A,(ESPEJO+260)	
	LD C,A	
	CALL JBPLOT0	
		
	LD A,(ESPEJO+261)		;VARIACION X
	LD B,A
	LD A,(ESPEJO+260)		;COORD X
	ADD A,B
	LD (ESPEJO+260),A
POP BC		
DJNZ DESVITANDO		

;FX LIGERO
RET

;******************************************************************************************************
;******************************************************************************************************
RESTAURA_VIDA_INTERFEIS:
;PINTAMOS VIDA COMPLETA EN INTERFEIS

LD A,(VALORES_PERSONAJES+8)		;USO A QUIEN LLEVO PARA QUITAR TAMBIÉN VIDA SI ESTAS EN COCHE Y TAL (NO ROBOT, ESO Y ARREGLADO) 1-MALFARIO 2-FMANAGER
CP 1
JR Z,PINTAVIDA_MALFARIO

PINTAVIDA_FMANAGER:
LD HL,VIDORRA
CALL INVERSO
LD BC,19
LD DE,ESPEJO
LD A,255
CALL DIBUJA
RET

PINTAVIDA_MALFARIO:
LD BC,8
LD DE,VIDORRA
LD A,255
CALL DIBUJA
RET


;******************************************************************************************************
;******************************************************************************************************

MUERTE_TOTAL:
POP BC				;HAS SALIDO DE UN CALL POR LAS BRAVAS

CALL TODONEGRO	       ;COLOREAMOS SIN BORRAR TODO NEGRO

LD IX,DIBUJO_FUNERAL
CALL PINTANDO_DE_TABLA

LD A,2
LD (TINTA),A
LD BC,4619
LD DE,OTROS_TEXTOS+235             ;"GAME OVER"
CALL UNAFRASE

CALL MARCHA_FUNEBRE

CALL ESPERATECLA

JP MENUS_INICIO


;******************************************************************************************************
;******************************************************************************************************
QUITAVIDA_MALO:
;ESTUDIAMOS POSIBLE ACIERTO DE BALA BUENO EN MALO, SE LE LLAMA EN RUTINA "AXIERTO" EN FICHERO "RUTINAS I"

	LD A,(IY+10)		; VIDA MALOTE
        CP 0
        RET Z                   ;LO MATO YA LA OTRA BALA

	LD A,(IY+0)		;COMPARAMOS COORDENDAS BALA CON COORDENADAS 3 MALOS...
	SUB (IX+0)
	ADD A,7
	CP 8
	RET NC

	LD A,(IY+1)
	SUB (IX+1)
	ADD A,7
	CP 8
	RET NC


      CALL EFECTO8


	LD A,(IY+10)		;BINGO -> VIDA MALOTE SE RESTA DAÑO ARMA
	SUB (IX+3)
	LD (IY+10),A	
        CP 0
	JR Z,MUERTISIMO	        ;SI VIDA VALE 0, pues eso
	CP 100
	JR NC,MUERTISIMO	;SI VIDA VALE AHORA MAS DE 100 ES QUE TE HAS PASAO YA

	CALL GUARDA_VIDA_MALO	;GUARDAMOS VIDA EN LA TABLA FUENTE, SALE CON A=VIDA
        CALL COLORXVIDA         ;ENTRA VIDA SALE COLOR
        LD (IY+9),A             ;FIJAMOS COLOR

	AVER_COMOSALGOAHORA:
	POP BC			;VIENES DE UN CALL
	JP ELRETONNO

	MUERTISIMO:
	XOR A
	LD (IY+10),A	
	CALL GUARDA_VIDA_MALO	;GUARDAMOS VIDA EN LA TABLA FUENTE
	

	CALL MINIANIMACION_MUERTEMALO		;MINI ANIMACION MUERTE QUE ADEMÁS BORRARÁ MALO
	

        JR AVER_COMOSALGOAHORA


;///////////////////

GUARDA_VIDA_MALO:
;GUARDAMOS USANDO EL BUFFER DE VIDA CON ESTA SENSILLA OPERASION
;ENTRA A=VIDA A GUARDAR

   PUSH AF
	LD D,6
	LD E,(IY+2)		;BUFFER
	CALL Multiply           ; this routine performs the operation HL=D*E   BUFFER*6
	LD BC,TABLA_ORDAS-1	;TABLA FUENTE-1
        ADD HL,BC
   POP AF
	LD (HL),A
RET



;******************************************************************************************************
;******************************************************************************************************
VICTORIOSSA:
;ANIMACION VICTORIA FINAL
LD BC,3341
LD DE,1537
CALL BORRAZONA                          ;BORRAMOS ULTIMO PERSONAJE QUE SE HA SUBIDO NAVE

LD IX,DATOS_CINEMATICAS+26              ;NAVE SUBE
LD DE,ESPRITES_CINEMATICAS+116
CALL QUE_CARACTER
CALL PAUSADE50

CALL TODONEGRO                          ;COLOREA TODA LA PANTALLA A NEGRO, NO ES CELESE POR INTERFACE TAPADO

LD IX,DIBUJO_UNIVERSO_VICTORIOSO
CALL PINTANDO_DE_TABLA

XOR A
LD (K_SALE),A            ;DESACTIVAMOS QUE CON "K" SE INTERRUMPESECUENCIA
LD IX,SECUENCIA2
CALL SECUENCIA

CALL PAUSADE15

JP MENUS_INICIO




;++++++++++++++++++++++
;++++++++++++++++++++++
; 12- ANIMACIONES RUTINAS
;++++++++++++++++++++++
;++++++++++++++++++++++

;*******************************************
;*******************************************

QUE_CARACTER:

;ENTRADA IX ->POSICION DE LA TABLA DONDE SE GUARDAN VALORES
;        DE ->BASE ESPRITE
;MUEVE SPRITE ANIMADO SEGÚN TABLA
;NO ESTÁ NADA OPTIMIZADA


;PASAMOS 1º VALORES  A XY Y GUARDAMOS BASE ESPRITE
LD A,(IX+0)
LD (IX+2),A
LD A,(IX+1)
LD (IX+3),A
LD (JORCAS),DE


;BUCLE
LD B,(IX+8)
BARRUNTA:
PUSH BC
     
        LD A,B
        LD (JOKER3),A

        ;0º JOKER=0 SI ES PAR E (IX+7) SI NO LO ES
        BIT 0, B           ; Que valor tiene el bit 0?
        JR Z, PAR          ; Saltar si esta Z activado
           LD A,(IX+7)
           JR FINPAR
        PAR:
           XOR A
        FINPAR:
           LD (JOKER),A

        ;1ºPINTAMOS
        LD B,(IX+3)
        LD C,(IX+2)
        LD DE,(JORCAS)
        LD H,0
        LD A,(JOKER)
        LD L,A
        ADD HL,DE
        EX DE,HL
        LD A,(IX+6)
        CALL DIBUJA

        ;2ºSONIDO Y RETARDO
        LD A,(IX+9)
        CP 0
        JR Z,JIARIS
        CALL BIP                              
        JIARIS:

        LD B,(IX+10)
        OOOOH:
        PUSH BC
        HALT
        POP BC
        DJNZ OOOOH

        ;3ºBORRAMOS

        LD A,(JOKER3)
        CP 1
        JR NZ,SI_SE_VORRA

        LD A,(IX+11)
        CP 1
        JR Z,NO_SE_VORRA

        SI_SE_VORRA:

        LD B,(IX+3)
        LD C,(IX+2)
        LD A,(IX+12)
        LD DE,(JORCAS)
        CALL DIBUJA

        NO_SE_VORRA:

        ;4ºNUEVAS COORDENADAS
        LD A,(IX+2)
        ADD A,(IX+4)
        LD (IX+2),A

        LD A,(IX+3)
        ADD A,(IX+5)
        LD (IX+3),A

POP BC
DJNZ BARRUNTA
RET


;++++++++++++++++++++++
;++++++++++++++++++++++
; 13- COSAS DE MENUS E INTROS
;++++++++++++++++++++++
;++++++++++++++++++++++


;JUEGO NAVECITA ***************************************************************************************************************
;JUEGO NAVECITA ***************************************************************************************************************
;JUEGO NAVECITA ***************************************************************************************************************
;JUEGO NAVECITA ***************************************************************************************************************
;JUEGO NAVECITA ***************************************************************************************************************



NAVECITA:


         ;--BORRAMOS S START  Y ADORNOS
         LD BC,5135    ;20,15
         LD DE,515     ;2X3
         CALL BORRAZONA
         LD BC,2051    ;8,3
         LD DE,1794    ;7X2
         CALL BORRAZONA
         LD BC,2070    ;8,22
         LD DE,1794    ;7X2
         CALL BORRAZONA
         LD BC,5125    ;20,5
         LD DE,5378    ;21X2
         LD A,70
         CALL COLOREA  ;ZONA DE NAVE


         ;--PINTAMOS BOLITAS
         LD HL,BOLILLAS_NAVECITA
         CALL PINTAPANTALLA			; EN HL ENTRA EL PRIMER VALOR DE LA PANTALLA


LD A,120
LD (ESPEJO+200),A         ;X NAVE MENU
XOR A
LD (ESPEJO+203),A         ;DISPARO
LD (ESPEJO+210),A         ;CONTADOR BOLICA
LD A,100
LD (ESPEJO+215),A         ;CONTADOR ATRIBUTO
LD A,10
LD (ESPEJO+220),A         ;POSICIONES OBJETIVOS
LD A,14
LD (ESPEJO+221),A
LD A,22
LD (ESPEJO+222),A

   ;ESPEJO+200  -- COORDENADA X
   ;ESPEJO+201  -- COORDENADA X DISPARO
   ;ESPEJO+202  -- COORDENADA Y DISPARO
   ;ESPEJO+203  -- CONTADOR DISPARO
   ;ESPEJO+210  -- CONTADOR BOLICA
  
   ;ESPEJO+215  -- CONTADOR ATRIBUTO MENU
   ;ESPEJO+220  -- POS X KKKKK
   ;ESPEJO+221  -- POS X INICIO
   ;ESPEJO+222  -- POS X AYUDA


BUCLE_NAVECITA:

               CALL LEER_TECLADO

               CP 3
               JR Z,NAVEPADERECHA
               CP 4
               JR Z,NAVEPAIZQIERDA
               CP 5
               JR Z,NAVEPADISPARO


        NAVEPARADICA:
        LD B,160
        LD A,(ESPEJO+200)
        LD C,A
        LD HL,NAVEMENU_PARADA
        CALL HR2X2BS
        JR GESTIONACOLORMENU

        NAVEPADERECHA:
        LD B,160
        LD A,(ESPEJO+200)
        LD C,A
        CALL HR2X2BORRA

        LD A,(ESPEJO+200)
        INC A
        LD (ESPEJO+200),A

        LD C,A
        LD B,160
        LD HL,NAVEMENU_MUEVE
        CALL HR2X2BS
        JR GESTIONACOLORMENU

        NAVEPAIZQIERDA:
        LD B,160
        LD A,(ESPEJO+200)
        LD C,A
        CALL HR2X2BORRA

        LD A,(ESPEJO+200)
        DEC A
        LD (ESPEJO+200),A

        LD C,A
        LD B,160
        LD HL,NAVEMENU_MUEVE
        CALL HR2X2BS
        JR GESTIONACOLORMENU

        NAVEPADISPARO:

        LD A,(ESPEJO+203)
        CP 1
        JR Z,GESTIONACOLORMENU

        LD A,1
        LD (ESPEJO+203),A      ;DISPARO ACTIVADO
        LD A,(ESPEJO+200)
        ADD A,7
        LD (ESPEJO+201),A      ;X
        LD C,A
        LD A,159
        LD (ESPEJO+202),A      ;Y
        LD B,A
        CALL JBPLOT1           ;LO PINTAMOS
        CALL EFECTO7



            GESTIONACOLORMENU:


   ;ESPEJO+215  -- CONTADOR ATRIBUTO MENU
   ;ESPEJO+220  -- POS X KKKKK
   ;ESPEJO+221  -- POS X INICIO
   ;ESPEJO+222  -- POS X AYUDA

            LD A,(ESPEJO+215)
            INC A
            LD (ESPEJO+215),A
            CP 120
            JP Z,CHANGECOLORMENU
            JP GESTIONACOLORBOLICA

            CHANGECOLORMENU:
            XOR A
            LD (ESPEJO+215),A


            LD B,11
            LD A,(ESPEJO+220)
            LD C,A
            CALL TRIBUTOS
            LD A,68
            LD (HL),A

            LD BC,5
            CALL LIMITE       ;0-5
            LD B,7
            ADD A,B
            LD (ESPEJO+220),A
            
            LD B,11
            LD A,(ESPEJO+220)
            LD C,A
            CALL TRIBUTOS
            LD A,66
            LD (HL),A
            
            
               LD B,9
               LD A,(ESPEJO+221)
               LD C,A
               CALL TRIBUTOS
               LD A,71
               LD (HL),A

               LD BC,5
               CALL LIMITE       ;0-5
               LD B,13
               ADD A,B
               LD (ESPEJO+221),A
            
               LD B,9
               LD A,(ESPEJO+221)
               LD C,A
               CALL TRIBUTOS
               LD A,66
               LD (HL),A

                  LD B,11
                  LD A,(ESPEJO+222)
                  LD C,A
                  CALL TRIBUTOS
                  LD A,68
                  LD (HL),A

                  LD BC,5
                  CALL LIMITE       ;0-5
                  LD B,20
                  ADD A,B
                  LD (ESPEJO+222),A
            
                  LD B,11
                  LD A,(ESPEJO+222)
                  LD C,A
                  CALL TRIBUTOS
                  LD A,66
                  LD (HL),A


            GESTIONACOLORBOLICA:
            LD A,(ESPEJO+210)
            INC A
            CP 45
            CALL Z,RESETEABOLICAS
            LD (ESPEJO+210),A
            
            CP 8
            JR C,TRAMOUNO
            CP 38
            JR C,TRAMODOS
            
               TRAMOTRES:
               SUB 31
               LD B,A
               LD C,30
               JP COLORBOLICA

               TRAMOUNO:
               LD B,A
               LD A,14
               SUB B
               LD B,A
               LD C,1
               JP COLORBOLICA

               TRAMODOS:
               SUB 7
               LD C,A
               LD B,7
               JP COLORBOLICA




            GESTIONADISPARO:
                
                LD A,(ESPEJO+203)
                CP 0
                JP Z,FIN_GESTIONDISPARO

                ;-----> BORRAMOS Y DISMINUIMOS "Y"

                CALL CARGA_DISPARO_MENU
                CALL JBPLOT0

                LD A,(ESPEJO+202)
                DEC A
                DEC A
                ;DEC A
                LD (ESPEJO+202),A

                 ;-----> COMPARAMOS CON LIMITE Y CON 3 ACIERTOS
                 CP 65
                 JR NZ,ACIERTOKKKKK
                    XOR A
                    LD (ESPEJO+203),A         ;DISPARO
                    CALL CARGA_DISPARO_MENU
                    INC B
                    INC B
                    ;INC B
                    CALL JBPLOT0
                    JP FIN_GESTIONDISPARO

                 ACIERTOKKKKK:

                 CALL CARGA_DISPARO_MENU
                 CALL JBPOINT        ;ENTRADA "BC"-> YX  ;SALIDA A=0 o A=1 SEGÚN HAYA O NO PIXEL
                 CP 1
                 JR NZ,QUIENCHIGUECONCHIGUE

                    XOR A
                    LD (ESPEJO+203),A         ;DISPARO ANULADO

                    CALL CARGA_DISPARO_MENU
                    CALL TRIBUTOSHR
                    LD A,(HL)
                    CP 66
                    JR NZ,QUIENCHIGUECONCHIGUE

                    CALL EFECTO3
                    LD A,(ESPEJO+201)
                    CP 159
                    JP NC,MENU_AYUDA
                    CP 103
                    JP NC,INTRO_PRINCIPAL
                    JP MENU_KKKKK


                ;-----> PINTAMOS
                QUIENCHIGUECONCHIGUE:
                CALL CARGA_DISPARO_MENU
                CALL JBPLOT1


FIN_GESTIONDISPARO:

HALT


JP BUCLE_NAVECITA



;---------
;AUXILIARES NAVE MENU INICIO

                CARGA_DISPARO_MENU:
                LD A,(ESPEJO+202)
                LD B,A
                LD A,(ESPEJO+201)
                LD C,A
                RET
                
                RESETEABOLICAS:
                LD A,1
                RET
                
                COLORBOLICA:
                CALL TRIBUTOS
                PUSH HL
                ELIXECOLOR:
                LD BC,8
                CALL LIMITE    ;(0-7)
                CP 0
                JR Z,ELIXECOLOR
                POP HL
                LD (HL),A
                JP GESTIONADISPARO
                


;JUEGOS EXTRA ***************************************************************************************************************
;JUEGOS EXTRA ***************************************************************************************************************
;JUEGOS EXTRA ***************************************************************************************************************
;JUEGOS EXTRA ***************************************************************************************************************
;JUEGOS EXTRA ***************************************************************************************************************

FAR_CRY:

        CALL CELESEJUEGO
        CALL MARCO_EXTRA

        CALL MODERNA_PRESENTA

        LD BC,4108                               ;16,12
        LD DE,OTROS_TEXTOS+61                    ;"FAR CRY"   SIN NUMERO
        CALL UNAFRASE
        CALL PAUSADE100
        
        LD DE,32864                ;128,96
        LD A,8                     ;DIRECCION
        LD C,7                     ;LARGO
        CALL ESTELA

        CALL PAUSADE100
        CALL CELESE_EXTRA

        LD DE,OTROS_TEXTOS+120
        CALL ENUNMUNDO
        
        CALL PAUSADE100

        LD HL,FONDO_FARCRY
        CALL PINTAPANTALLA

        CALL A_POR_ELLOS

        CALL NONSENSE

        CALL ESPERATECLA
        JP MENU_KKKKK


CALL_DUTY:

        CALL CELESEJUEGO
        CALL MARCO_EXTRA

        CALL MODERNA_PRESENTA

        LD BC,4106                               ;16,10
        LD DE,OTROS_TEXTOS+71                    ;"CALL OF DUTY"   SIN NUMERO
        CALL UNAFRASE
        CALL PAUSADE100

        LD DE,32848                ;128,80
        LD A,8                     ;DIRECCION
        LD C,12                     ;LARGO
        CALL ESTELA

        CALL PAUSADE100
        CALL CELESE_EXTRA

        LD DE,OTROS_TEXTOS+105
        CALL ENUNMUNDO
        
        CALL PAUSADE100

        LD HL,FONDO_CALLDUTY
        CALL PINTAPANTALLA

        CALL A_POR_ELLOS

        CALL NONSENSE

        CALL ESPERATECLA
        JP MENU_KKKKK



JARL_LIFE:

        CALL CELESEJUEGO
        CALL MARCO_EXTRA

        CALL MODERNA_PRESENTA

        LD BC,4107                               ;16,11
        LD DE,OTROS_TEXTOS+86                    ;"JARL LIFE"   SIN NUMERO
        CALL UNAFRASE
        CALL PAUSADE100

        LD DE,32856                ;128,88
        LD A,8                     ;DIRECCION
        LD C,9                     ;LARGO
        CALL ESTELA

        CALL PAUSADE100

	LD BC,4111				 ;16,15
	LD DE,LOGO_JALF
	LD A,255
	CALL DIBUJA
        CALL PAUSADE100
	CALL CELESE_EXTRA
	CALL PAUSADE100

	LD A,68
	LD (TINTA),A
	LD BC,3851			;15,11
	LD DE,OTROS_TEXTOS+145          ;"BLACK MESA"
	CALL UNAFRASE
	LD A,71
	LD (TINTA),A
	LD BC,4366			;17,14
	LD DE,OTROS_TEXTOS+156          ;"1988"
	CALL UNAFRASE

        CALL PAUSADE100

         LD DE,30552                ;119,88
         LD A,8                     ;DIRECCION
         LD C,10                    ;LARGO
         CALL ESTELA
         LD DE,34696                ;135,136
         LD A,-8                    ;DIRECCION
         LD C,4                     ;LARGO
         CALL ESTELA

        CALL PAUSADE100

        LD HL,FONDO_CALLDUTY
        CALL PINTAPANTALLA
        LD HL,FONDO_JARLLIFE
        CALL PINTAPANTALLA

	CALL NOPUEDO
	CALL PAUSADE50
        CALL NOPUEDO
	CALL PAUSADE50
	CALL BORRA_FRASE_EXTRA	
	CALL DIBUJA_PIERNICA2
	CALL JARL
	CALL PAUSADE50
        CALL DIBUJA_PIERNICA1
	CALL JARL
	CALL DIBUJA_PIERNICA2
	CALL NOPUEDO	
	CALL PAUSADE50
        CALL DIBUJA_PIERNICA1
	CALL JARL
	CALL DIBUJA_PIERNICA2

        CALL NONSENSE

        CALL ESPERATECLA
        JP MENU_KKKKK





;*******RUTINAS AUXILIARES DE JUEGOS EXTRA


         ;--PINTAMOS MARCO DE JUEGOS EXTRA BOLITAS
         MARCO_EXTRA:
         LD HL,MARCO_BOLITAS_EXTRA
         CALL PINTAPANTALLA			; EN HL ENTRA EL PRIMER VALOR DE LA PANTALLA
         RET

         ;--"LA MODERNA SOFT PRESENTS"
         MODERNA_PRESENTA:
         CALL PAUSADE50
         LD BC,3591          ;14,7
         LD DE,MODERNA_SOFT_MENU
         LD A,255
         CALL DIBUJA
         LD A,70
         LD (TINTA),A
         LD BC,4368         ;17,16
         LD DE,OTROS_TEXTOS+96          ;"PRESENTA"
         CALL UNAFRASE

         CALL PAUSADE100
         CALL CELESE_EXTRA
         CALL PAUSADE100
         RET

         ;--"EN UN MUNDO EN GUERRA/ EN UNA ISLA EN GUERRA"

         ENUNMUNDO:
         LD A,71
         LD (TINTA),A
         LD BC,3849                 ;15,9
         CALL UNAFRASE
         LD A,66
         LD (TINTA),A
         LD DE,OTROS_TEXTOS+135     ;"GUERRA..."
         LD BC,4363                 ;17,11
         CALL UNAFRASE
         CALL PAUSADE100

         LD DE,30536                 ;119,72
         LD A,8                     ;DIRECCION
         LD C,14                    ;LARGO
         CALL ESTELA
         LD DE,34712                 ;135,152
         LD A,-8                    ;DIRECCION
         LD C,9                     ;LARGO
         CALL ESTELA



         ;CALL CELESE_EXTRA
         RET
         
         ;--"A POR ELLOS, PERO HOY NO, MAÑANA"
         A_POR_ELLOS:
         CALL PAUSADE100
         LD A,78            ;AMARILLO FONDO AZUL BRILLANTE
         LD (TINTA),A
         LD BC,3852         ;15,2
         LD DE,OTROS_TEXTOS+161          ;"A POR ELLOS"
         CALL UNAFRASE
         CALL PAUSADE100
         LD BC,3852         ;15,2
         LD DE,OTROS_TEXTOS+175          ;"PERO HOY NO"
         CALL UNAFRASE
         CALL PAUSADE100
         CALL BORRA_FRASE_EXTRA
         LD A,74            ;ROJO FONDO AZUL BRILLANTE
         LD (TINTA),A
         LD BC,3852         ;15,2
         LD DE,OTROS_TEXTOS+190          ;"MAÑANA !"
         CALL UNAFRASE
         CALL PAUSADE100
         RET


         ;-- BORRAR CONVERSACIÓN EN EXTRAS
         BORRA_FRASE_EXTRA:
         LD A,79
         LD BC,3852         ;15,2
         LD DE,3585         ;14x1
         LD HL,VACIO1X1
         CALL RELLENA
         RET

         ;-- NONSENSE IN BASIC
         NONSENSE:

         LD A,13
         LD (ESPEJO+100),A
         LD A,6
         LD (ESPEJO+101),A

         LD B,8
         PUSOCHUNGO1:
         PUSH BC

         LD B,20
         PUSOCHUNGO2:
         PUSH BC

         LD A,(ESPEJO+100)
         LD B,A
         LD A,(ESPEJO+101)
         LD C,A
         INC A
         LD (ESPEJO+101),A
         CALL TRIBUTOS
         PUSH HL
         LD BC,255
         CALL LIMITE
         POP HL
         LD (HL),A

         POP BC
         DJNZ PUSOCHUNGO2

         LD A,(ESPEJO+100)
         INC A
         LD (ESPEJO+100),A
         LD A,6
         LD (ESPEJO+101),A

         POP BC
         DJNZ PUSOCHUNGO1

         CALL PAUSADE100

         CALL CELESE_EXTRA_BIS
         LD A,56
         LD (TINTA),A
         LD BC,5126                 ;20,6
         LD DE,OTROS_TEXTOS+199     ;"NONSENSE IN BASIC"
         CALL UNAFRASE
         CALL PAUSADE100
         RET


	;-- NO PUEDO NO PUEDO JARL
	NOPUEDO:
	LD A,78            	;AMARILLO FONDO AZUL BRILLANTE
	LD (TINTA),A
	LD BC,3853		;15,13
	LD DE,OTROS_TEXTOS+217  ;"NO PUEDO !"
	CALL UNAFRASE
	CALL PAUSADE50
	CALL BORRA_FRASE_EXTRA	
	RET

	JARL:
	LD BC,3855		;15,15
	LD DE,OTROS_TEXTOS+228  ;"JARL !"
	CALL UNAFRASE
	CALL PAUSADE50
	CALL BORRA_FRASE_EXTRA	
	RET

	DIBUJA_PIERNICA1:
	LD BC,4876		;19,12
	LD DE,PIERNICA1
	LD A,255
	CALL DIBUJA	
	RET
	
	DIBUJA_PIERNICA2:
	LD BC,4876		;19,12
	LD DE,PIERNICA2
	LD A,255
	CALL DIBUJA
	RET


;INTRO JUEGO PRINCIPAL ***************************************************************************************************************
;INTRO JUEGO PRINCIPAL ***************************************************************************************************************
;INTRO JUEGO PRINCIPAL ***************************************************************************************************************
;INTRO JUEGO PRINCIPAL ***************************************************************************************************************
;INTRO JUEGO PRINCIPAL ***************************************************************************************************************


INTRO_PRINCIPAL:


CALL TODONEGRO	       ;COLOREAMOS SIN BORRAR TODO NEGRO
CALL CELESEJUEGO

LD A,1
LD (K_SALE),A          ;ACTIVAMOS QUE CON "K" SE INTERRUMPESECUENCIA
LD IX,SECUENCIA1
CALL SECUENCIA

;CALL ESPERATECLA

JP INICIANDO_JUEGO_PRINCIPAL



SECUENCIA1:

;---FMANAGER

DEFB 1, 2,18,9
DEFW INTRO_TEXTOS+0

DEFB 2

DEFB 1, 70,18,9
DEFW INTRO_TEXTOS+15

DEFB 2

DEFB 1, 70,18,8
DEFW INTRO_TEXTOS+30

DEFB 6

DEFB 2

DEFB 1 ,69,18,10
DEFW INTRO_TEXTOS+81

DEFB 3 ,255,8,21
DEFW OVNI

DEFB 2

DEFB 7

DEFB 4

DEFB 1 ,66,18,10
DEFW INTRO_TEXTOS+93
DEFB 2
DEFB 1 ,68,18,12
DEFW INTRO_TEXTOS+48
DEFB 1 ,68,20,7
DEFW INTRO_TEXTOS+334

DEFB 3 ,255,10,12
DEFW KKASSA
DEFB 3 ,255,9,16
DEFW BARBOL

DEFB 5
DEFW DATOS_CINEMATICAS+39
DEFW PERSONAJILLO

DEFB 2
DEFB 4

DEFB 3 ,255,12,10
DEFW NAVE_FMANAGER

DEFB 5
DEFW DATOS_CINEMATICAS+39
DEFW PERSONAJILLO

DEFB 4

DEFB 3 ,255,11,13
DEFW NAVE_FMANAGER
DEFB 5
DEFW DATOS_CINEMATICAS+52
DEFW TOBERA
DEFB 4

;---MALFARIO

DEFB 1 ,71,18,8
DEFW INTRO_TEXTOS+105   ;LEJOS DE ALLI

DEFB 2

DEFB 1 ,66,18,9
DEFW INTRO_TEXTOS+122   ;TERRA
DEFB 1 ,66,20,7
DEFW INTRO_TEXTOS+135   ;6-11-1354

DEFB 2

DEFB 8
DEFB 3 ,255,11,14
DEFW MASADA

DEFB 1 ,66,18,5
DEFW INTRO_TEXTOS+152   ;MASADA

DEFB 2
DEFB 4

DEFB 3 ,255,11,14
DEFW MALFARIO_3X3

DEFB 1 ,71,18,8
DEFW INTRO_TEXTOS+175   ;STELA ¡¡

DEFB 2
DEFB 4

DEFB 3 ,255,11,14
DEFW NAVE_MALFARIO

DEFB 1 ,3,18,12
DEFW INTRO_TEXTOS+192   ;OTRA VEZ
DEFB 2

DEFB 1 ,70,18,5
DEFW INTRO_TEXTOS+201   ;VIAJES TIEMPO

DEFB 2

DEFB 1 ,70,18,6
DEFW INTRO_TEXTOS+61    ;UNIVERSOS PARALELOS

DEFB 2

DEFB 1 ,70,18,5
DEFW INTRO_TEXTOS+224   ;COSAS DE ESAS

DEFB 2

DEFB 3 ,255,11,14
DEFW MALFARIO_3X3

DEFB 1 ,70,18,12
DEFW INTRO_TEXTOS+246   ;VAMOS

DEFB 2
DEFB 4

DEFB 3 ,255,11,17
DEFW NAVE_MALFARIO
DEFB 5
DEFW DATOS_CINEMATICAS+52
DEFW TOBERA
DEFB 4

DEFB 4

;---CHOQUE

DEFB 1 ,71,18,9
DEFW INTRO_TEXTOS+255   ;AVECES

DEFB 2

DEFB 1 ,71,18,8
DEFW INTRO_TEXTOS+270   ;EL MULTIUNIVERSO...

DEFB 9
DEFB 2

DEFB 10

DEFB 1 ,71,18,8
DEFW INTRO_TEXTOS+290   ;PEQUEÑO

DEFB 2

DEFB 11

;FIN
DEFB 255




;SECUENCIA 2 VICTORIA FINAL

SECUENCIA2:

DEFB 3 ,255,9,15
DEFW ESPRITES_CINEMATICAS+116   ;NAVE FINAL (UN FOTOGRAMA)

DEFB 5
DEFW DATOS_CINEMATICAS+52
DEFW TOBERA

DEFB 1 ,66,18,12
DEFW INTRO_TEXTOS+305   ;VICTORIA

DEFB 5
DEFW DATOS_CINEMATICAS+52
DEFW TOBERA

DEFB 1 ,71,18,7
DEFW INTRO_TEXTOS+316   ;DE REGRESO

DEFB 2

DEFB 1 ,71,18,7
DEFW INTRO_TEXTOS+334   ;EXTRAÑOS MUNDOS

DEFB 2

DEFB 5
DEFW DATOS_CINEMATICAS+52
DEFW TOBERA

DEFB 1 ,66,18,9
DEFW INTRO_TEXTOS+354   ;1982

DEFB 2

DEFB 12

DEFB 6

DEFB 13

DEFB 14


DEFW 15

DEFB 1 ,66,17,9
DEFW INTRO_TEXTOS+522   ;...MALFARIO..

DEFB 2

DEFW 15

DEFB 1 ,66,17,9
DEFW INTRO_TEXTOS+537   ;...MUST DIE..

DEFW 15

DEFB 3 ,255,9,21
DEFW OJOS_MONJE

DEFW 15

;FIN
DEFB 255


;**********************************************************
;RUTINA QUE VA PINTANDO INTRO. MUY MOLONA
SECUENCIA:

SIGUIENTE_MODULO:

   LD A,(K_SALE)        ;COMPROBAMOS SI HAY QUE MNIRAR TECLA "K" O NO
   CP 1
   JR NZ,K_NOCHUFLA

LD A,(23560)		;VARIABLE DEL SISTEMA "LAST KEY", ULTIMA TECLA PULSADA
CP 75			;"K"
RET Z                   ;SALIENDO_LAPIDAMENTE
CP 107			;"k"
RET Z                   ;SALIENDO_LAPIDAMENTE

    K_NOCHUFLA:

LD A,(IX+0)
CP 255
RET Z

SOLO_TEXTO:
CP 1
JR NZ,BORRAR_TEXTO

   LD A,(IX+1)
   LD (TINTA),A
   LD B,(IX+2)
   LD C,(IX+3)
   LD E,(IX+4)
   LD D,(IX+5)
   CALL UNAFRASE
   
   LD BC,6
   ADD IX,BC
   JR SIGUIENTE_MODULO


BORRAR_TEXTO:
CP 2
JR NZ,IMAGEN_INTRO

   CALL PAUSADE100

   XOR A
   LD BC,4609   ;18,1
   LD DE,7683   ;30X3
   LD HL,VACIO1X1
   CALL RELLENA

   INC IX
   JR SIGUIENTE_MODULO


IMAGEN_INTRO:
CP 3
JR NZ,BORRAR_IMAGEN_INTRO

   LD A,(IX+1)
   LD B,(IX+2)
   LD C,(IX+3)
   LD E,(IX+4)
   LD D,(IX+5)
   CALL DIBUJA

   LD BC,6
   ADD IX,BC
   JR SIGUIENTE_MODULO

BORRAR_IMAGEN_INTRO:
CP 4
JR NZ,ANIMACION_INTRO

   LD A,6
   LD BC,1793   ;7,1
   LD DE,7691   ;30X11
   LD HL,VACIO1X1
   CALL RELLENA

   INC IX
   JP SIGUIENTE_MODULO

ANIMACION_INTRO:
CP 5
JR NZ,ESPECIAL_PINTAR_CAMPO

   LD C,(IX+1)
   LD B,(IX+2)
   LD E,(IX+3)
   LD D,(IX+4)

    PUSH IX
    PUSH BC
    POP IX
    CALL QUE_CARACTER
    POP IX

   LD BC,5
   ADD IX,BC
   JP SIGUIENTE_MODULO


ESPECIAL_PINTAR_CAMPO:
CP 6
JP NZ,ESPECIAL_ABDUCCION

   LD A,97      ;INK 1 PAPER 4 BRIGHT 1
   LD BC,1795   ;7,3
   LD DE,6665   ;26X9
   LD HL,VACIO1X1
   CALL RELLENA

   LD A,102      ;INK 6 PAPER 4 BRIGHT 1
   LD (23695),A      ;COLOR DRAW
   
   LD BC,30519       ;Y119 X55
   CALL #22E5        ;PLOT

   LD BC,18192       ;A71  L16
   LD DE,65535       ;-1,-1
   CALL 9402

   LD BC,28469       ;Y119 X55
   CALL #22E5        ;PLOT
   
   LD BC,32        ;A0  L32
   LD DE,1          ;0,1
   CALL 9402

   LD BC,14347       ;A56  L11
   LD DE,65535       ;-1,-1
   CALL 9402

   LD BC,32        ;A0  L32
   LD DE,255       ;0,-1
   CALL 9402

   LD BC,16938     ;Y66 X42
   CALL #22E5      ;PLOT
   CALL POSTE1
   
   LD BC,24369     ;Y95 X49
   CALL #22E5      ;PLOT
   CALL POSTE1
   
   LD BC,27953     ;Y109 X49
   CALL #22E5      ;PLOT

   LD BC,7174       ;A28  L6
   LD DE,65535       ;-1,-1
   CALL 9402

   LD BC,26922     ;Y X
   CALL #22E5      ;PLOT
   LD BC,7176      ;A28  L8
   LD DE,65535     ;-1,-1
   CALL 9402

   LD BC,21575     ;Y X
   CALL #22E5      ;PLOT

;aqui circulo del área

    LD B,96
    LD C,56
    LD A,96
    LD HL,GUENO_FMANAGER+0
    CALL HR1X1B

    LD B,72
    LD C,72
    LD A,96
    LD HL,GUENO_FMANAGER+32
    CALL HR1X1B

    LD B,112
    LD C,88
    LD A,103
    LD HL,GUENO_FMANAGER+48
    CALL HR1X1B
    
    LD B,88
    LD C,168
    LD A,103
    LD HL,GUENO_FMANAGER+56
    CALL HR1X1B

    INC IX
    JP SIGUIENTE_MODULO


ESPECIAL_ABDUCCION:
CP 7
JP NZ,ESPECIAL_CIELO_MASADA

    CALL ABDUCCIONANDO
    CALL ABDUCCIONANDO

    INC IX
    JP SIGUIENTE_MODULO

ESPECIAL_CIELO_MASADA:
CP 8
JP NZ,ESPECIAL_DIBUJO_MULTIUNIVERSO


   LD A,14
   LD BC,2824   ;11,8
   LD DE,4099   ;16X3
   LD HL,VACIO1X1
   CALL RELLENA


    INC IX
    JP SIGUIENTE_MODULO

ESPECIAL_DIBUJO_MULTIUNIVERSO:
CP 9
JP NZ,ESPECIAL_CHOQUE1

PUSH IX
LD IX,DIBUJO_MULTIUNIVERSO
CALL PINTANDO_DE_TABLA
POP IX


    INC IX
    JP SIGUIENTE_MODULO

ESPECIAL_CHOQUE1:
CP 10
JP NZ,ESPECIAL_CHOQUE2

     LD BC,3075        ;12,3
     LD DE,PTEMPORAL
     LD A,255
     CALL DIBUJA
     LD BC,3075        ;12,3
     LD DE,257
     XOR A
     CALL PARPADEA
     

     LD B,24
     CAMINO1:
     PUSH BC
     LD A,48
     SUB B
     LD C,A
     LD B,96
     LD HL,NAVECHOQUE1
     CALL HR2X2BS
     HALT
     POP BC
     DJNZ CAMINO1

    INC IX
    JP SIGUIENTE_MODULO

ESPECIAL_CHOQUE2:
CP 11
JP NZ,ESPECIAL_FICHAJEFM

     LD BC,3097        ;12,25
     LD DE,PTEMPORAL
     LD A,255
     CALL DIBUJA
     LD BC,3097        ;12,25
     LD DE,257
     XOR A
     CALL PARPADEA

     LD B,64
     CAMINO2:
     PUSH BC

     PUSH BC
     LD A,112
     SUB B
     LD C,A
     LD B,96
     LD HL,NAVECHOQUE1
     CALL HR2X2BS

     POP BC
     LD A,128
     ADD A,B
     LD C,A
     LD B,96
     LD HL,NAVECHOQUE2
     CALL HR2X2BS

     HALT

     POP BC
     DJNZ CAMINO2

    INC IX
    JP SIGUIENTE_MODULO


ESPECIAL_FICHAJEFM:
CP 12
JP NZ,GOLBRUTAL

CALL TODONEGRO	       ;COLOREAMOS SIN BORRAR TODO NEGRO

   LD A,56      ;INK 0 PAPER 7 BRIGHT 0
   LD BC,1793   ;7,1
   LD DE,7695   ;30X15
   LD HL,VACIO1X1
   CALL RELLENA

;LD HL,15744    ;ELEGIMOS FUENTE SPECTRUM+48
;LD (FUENTEX),HL

PUSH IX
LD IX,ESCRIBIR_FICHAJE
CALL ESCRIBIENDO_DE_TABLA
POP IX

;LD HL,FUENTE    ;ELEGIMOS FUENTE OTRA VEZ
;LD (FUENTEX),HL

CALL ESPERATECLA

CALL TODONEGRO	       ;COLOREAMOS SIN BORRAR TODO NEGRO

    INC IX
    JP SIGUIENTE_MODULO

GOLBRUTAL:
CP 13
JP NZ,YFIN


    LD BC,22696        ;88,168
    LD HL,GUENO_MALFARIO+48
    LD A,103
    CALL HR1X1B

    LD BC,28848        ;112,176
    LD HL,GUENO_FMANAGER+56
    LD A,103
    CALL HR1X1B

    LD BC,28840        ;112,168
    LD HL,BALON+8
    LD A,97
    CALL HR1X1B

    CALL PAUSADE50	

    LD BC,28840        ;112,168
    LD HL,VACIO1X1
    LD A,97
    CALL HR1X1B

    LD BC,22688        ;88,160
    LD HL,BALON+8
    LD A,97
    CALL HR1X1B

    PUSH IX
    LD IX,CACHO5
    CALL PLAYCACHO
    POP IX

    CALL PAUSADE50

     XOR A
     LD (JOKER),A

     LD B,25
     CAMINO3:
     PUSH BC

     LD A,(JOKER)
     LD D,0
     LD E,A
     ADD A,8
     CP 24
     CALL Z,NO_PRESENCIA_DESIERTO       ;XOR A/RET
     LD (JOKER),A

     LD HL,ENTROPIA
     ADD HL,DE

     LD BC,22688           ;88,160
     CALL HR1X1BS
     HALT
     HALT
     HALT

     POP BC
     DJNZ CAMINO3



     LD B,136
     CAMINO4:
     PUSH BC

     LD A,24
     ADD A,B
     LD C,A
     LD B,88
     LD HL,BALON
     LD A,97
     CALL HR1X1B

     LD B,7
     CALL FLATO

     POP BC
     DJNZ CAMINO4

     LD BC,1795            ;7,13
     LD DE,6657            ;26,1
     LD A,86
     LD HL,ENTROPIA+16
     CALL RELLENA
     

     LD A,114
     LD (TINTA),A
     LD BC,1804            ;7,12
     LD DE,INTRO_TEXTOS+512
     CALL UNAFRASE
     
     push ix
     LD IX,CACHO1
     CALL PLAYCACHO
     pop ix

    INC IX
    JP SIGUIENTE_MODULO
    
    YFIN:
    CP 14
    JP NZ,YFINYA

    CALL TODONEGRO	       ;COLOREAMOS SIN BORRAR TODO NEGRO

    push ix
    LD IX,DIBUJO_DOCTORCITI_MALO
    CALL PINTANDO_DE_TABLA
    pop ix

    INC IX
    JP SIGUIENTE_MODULO

    YFINYA:
    
    CALL PAUSADE100
    
    INC IX
    JP SIGUIENTE_MODULO


;************************
K_SALE:           ;VARIABLE QUE NOS DICE SI "K" ABORTA SECUENCIA O NO, NO ES LO MISMO LA DE VICTORIA QUE LA BRASA INTRODUCTORIA
DEFB 0

;************************

   POSTE1:
   LD BC,3584      ;A14  L0
   LD DE,256       ;1,0
   CALL 9402
   LD BC,1032      ;A4  L8
   LD DE,65535      ;-1,-1
   CALL 9402
   LD BC,2560      ;A10  L0
   LD DE,65280     ;-1,0
   CALL 9402
   RET
   
;************************
   ABDUCCIONANDO:
   LD BC,2325   ;9,25
   LD DE,258    ;1X2
   LD A,100
   CALL PARPADEA
   RET