BUCLE_PRINCIPAL:


XOR A
LD (MARCADOR),A

;===============================================================================
;===============================================================================  LEEMOS TECLADO MOVIMIENTO  , ESO, ESO
;===============================================================================

LEER_TECLASx:

LD IX,VALORES_PERSONAJES                ;CARGAMOS PERSONAJE ACTIVO

LD A,(IX+5)
CP 3
JR NZ,TECLAO				;SI ES ROBOT NO SE MUEVE SI NO ESTAN LOS DOS SUBIDOS
LD A,(IX+8)
CP 3
JP NZ,FIN_LECTURA


TECLAO:

       LD BC, $DFFE         ; SEMIFILA Y - P
       IN A, (C)            ; LEER PUERTO
       BIT 1, A             ; COMPROBAR BIT 1 "O"
       JR NZ, TECLAP        ; SI NO ESTÁ PULSADO VAMOS A TECLA "P"
       ;HAS PULSADO "O" ENTONCES:


		

		;======== CAMBIO DE PANTALLA
		LD A,(IX+1)
		CP 8
		JR NZ, NO_CAMBIO_PANTALLA_O	


			;---   ---   ---   ---   ----  SI ESTAS EN DESIERTO EL CAMBIO PANTALLA ES ESPECIAL


			CALL OASIS			;SALE A=0 1 3		0-NO ES DESIERTO	1--3 SI LO ES, MALFARIO-COCHE DESIERTO
			CP 0
			JR Z,O_NO_DESSIERTO

				LD D,A			;GUARDAMOS ESTE "A" (*****)
							
				;ASIGNAMOS NUEVA X COORDENADA
				LD A,240
				SUB (IX+16)
				LD (IX+1),A	;NUEVA COORDENADA X

				;COMO ES DESIERTO ASIGNAMOS PANTALLA 241 243 SEGÚN HAYA ALGUIEN YA O NO, Y MODIFICAMOS PY PX QUE GUIAN A ROM  , UN CAGARRO QUE NO HAY QUIEN LO ENTIENDA
				LD B,0
				LD C,-1			 ;XPANTALLA DESIERTO IZQUIERDA
				LD A,D		  	 ;"A" (*****)  1--3

		        	JP ASIGNANDO_PANTALLAS_DESIERTO		;DE AQUI YA VA A CARGAPANTALLA

			O_NO_DESSIERTO:

			;---   ---   ---   ---   ----


		LD HL,SALTO_MUNDO_IZQUIERDA
		CALL CAMBIO_DE_MUNDO			;SI NO HAY CAMBIO DE MUNDO VUELVE CON VALOR A=1
		CP 1					;SI LO HAY VUELVE YA CON NUEVA PANTALLA Y NUEVO SALTOPANTALLA
		JR Z,SOLO_CAMBIO_PANTALLA_O		;AJUSTAMOS SOLO LA COORDENADA CORRESPONDIENTE (SIEMPRE CAMBIAMOS EN VEHICULO 2X2)

		LD A,232
		LD (IX+1),A	;NUEVA COORDENADA X
		JP CARGAPANTALLA

	        SOLO_CAMBIO_PANTALLA_O:
		LD A,(PANTALLA)
		DEC A
		LD (PANTALLA),A ;NUEVA PANTALLA
                LD (IX+2),A		
		LD A,240
		SUB (IX+16)
		LD (IX+1),A	;NUEVA COORDENADA X
		JP CARGAPANTALLA

		NO_CAMBIO_PANTALLA_O:

		;======== CHOQUE ?????
			
			LD A,(IX+1)
			AND 7
			CP 0
			JR NZ,MUEVESO

			LD H,(IX+36)		;PODRIA HACER TAMBIEN LD (IX+6) TAMAÑO    --- ATTR IZQUIERDA ---
			LD L,(IX+35)		;		      CP 8
			JP (HL)			;		      CALL NZ,TAL (ETC)
			EL_RETORNO_O:		;		      MAS LENTO PERO AHORRARIA HUECOS EN TABLA BUENOS		
			
			CP 1
			JP Z,ESTASPARAO		;(*) PROVISIONAL, HABRÁ QUE VER TABLA MALO SI ES 1 O SI COGER ETC	
			;JR NZ,MUEVESO
			
			;CON OBJETO COGER
			;CON MALO
			;CON COSA NO TRASPASABLE

		;======== MUEVES
	     MUEVESO:
		CALL BORRABUENO
                LD A,(IX+1)
		SUB (IX+4)		
		LD (IX+1),A	  	  ;RESTAMOS DESPLAZAMIENTO A LA X
		LD A,4
		LD (IX+3),A		  ;ASIGNAMOS SENTIDO	
		LD H,(IX+28)
		LD L,(IX+27)		  ;ASIGNAMOS ESPRITE IZQUIERDA
	        JP FOTOGRAMA_AVANZANDO    ;TENGA ESPRITE S5 O NO, ES LO MISMO

TECLAP:

       LD BC, $DFFE         ; SEMIFILA Y - P
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "P"
       JR NZ, TECLAQ        ; SI NO ESTÁ PULSADO VAMOS A TECLA "Q"
       ;HAS PULSADO "P" ENTONCES:

		;======== CAMBIO DE PANTALLA
		LD A,(IX+1)
		CP (IX+14)
		JR NZ, NO_CAMBIO_PANTALLA_P	


			;---   ---   ---   ---   ----  SI ESTAS EN DESIERTO EL CAMBIO PANTALLA ES ESPECIAL


			CALL OASIS			;SALE A=0 1  3		0-NO ES DESIERTO	1--3 SI LO ES, MALFARIO-COCHE DESIERTO
			CP 0
			JR Z,P_NO_DESSIERTO

				LD D,A			;GUARDAMOS ESTE "A" (*****)
							
				;ASIGNAMOS NUEVA X COORDENADA
				LD A,8
				LD (IX+1),A	;NUEVA COORDENADA X

				;COMO ES DESIERTO ASIGNAMOS PANTALLA 241  243 SEGÚN HAYA ALGUIEN YA O NO, Y MODIFICAMOS PY PX QUE GUIAN A ROM
				LD B,0
				LD C,1			 ;XPANTALLA DESIERTO DERECHA
				LD A,D		  	 ;"A" (*****)  1--3

		        	JP ASIGNANDO_PANTALLAS_DESIERTO		;DE AQUI YA VA A CARGAPANTALLA
										
			P_NO_DESSIERTO:

			;---   ---   ---   ---   ----


		LD HL,SALTO_MUNDO_DERECHA
		CALL CAMBIO_DE_MUNDO			;SI NO HAY CAMBIO DE MUNDO VUELVE CON VALOR A=1
		CP 1					;SI LO HAY VUELVE YA CON NUEVA PANTALLA Y NUEVO SALTOPANTALLA
		JR Z,SOLO_CAMBIO_PANTALLA_P		;AJUSTAMOS SOLO LA COORDENADA CORRESPONDIENTE (SIEMPRE CAMBIAMOS EN VEHICULO 2X2)

		LD A,8
		LD (IX+1),A	;NUEVA COORDENADA X
		JP CARGAPANTALLA

	        SOLO_CAMBIO_PANTALLA_P:

		LD A,(PANTALLA)
		LD D,A		;PARA CAMBIO DE MUNDO
		INC A
		LD (PANTALLA),A
                LD (IX+2),A

		LD A,8
		LD (IX+1),A	;NUEVA COORDENADA X

		JP CARGAPANTALLA
	
		NO_CAMBIO_PANTALLA_P:

		;======== CHOQUE ?????

			LD A,(IX+1)
			AND 7
			CP 0
			JR NZ,MUEVESP

			LD H,(IX+34)		;--- ATTR DERECHA ---
			LD L,(IX+33)
			JP (HL)
			EL_RETORNO_P:
		
			CP 1
			JP Z,ESTASPARAO		;(*) PROVISIONAL, HABRÁ QUE VER TABLA MALO SI ES 1 O SI COGER ETC	
			;JR NZ,MUEVESP
			
			;CON OBJETO COGER
			;CON MALO
			;CON COSA NO TRASPASABLE
		
		;======== MUEVES
	     MUEVESP:
		CALL BORRABUENO
		LD A,(IX+1)
		ADD A,(IX+4)
		LD (IX+1),A	  	  ;SUMAMOS DESPLAZAMIENTO A LA X
		LD A,3
		LD (IX+3),A		  ;ASIGNAMOS SENTIDO
		LD H,(IX+26)
		LD L,(IX+25)		  ;ASIGNAMOS ESPRITE IZQUIERDA
	        JP FOTOGRAMA_AVANZANDO    ;TENGA ESPRITE S5 O NO, ES LO MISMO

       
TECLAQ:

       LD BC, $FBFE         ; SEMIFILA T - Q
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "Q"
       JR NZ, TECLAA        ; SI NO ESTÁ PULSADO VAMOS A TECLA "A"
       ;HAS PULSADO "Q", ENTONCES:


                         SUBMARINEANDO:          ;EL SUBMARINO SI NO HAY TECLA SUBE POR DEFECTO


		;======== CAMBIO DE PANTALLA
		LD A,(IX+0)
		CP 56
		JR NZ, NO_CAMBIO_PANTALLA_Q


			;---   ---   ---   ---   ----  SI ESTAS EN DESIERTO EL CAMBIO PANTALLA ES ESPECIAL


			CALL OASIS			;SALE A=0 1  3		0-NO ES DESIERTO	1--3 SI LO ES, MALFARIO-COCHE DESIERTO
			CP 0
			JR Z,Q_NO_DESSIERTO

				LD D,A			;GUARDAMOS ESTE "A" (*****)
							
				;ASIGNAMOS NUEVA Y COORDENADA
				LD A,176
                		SUB (IX+16)
				LD (IX+0),A	;NUEVA COORDENADA Y

				;COMO ES DESIERTO ASIGNAMOS PANTALLA 241  243 SEGÚN HAYA ALGUIEN YA O NO, Y MODIFICAMOS PY PX QUE GUIAN A ROM
				LD B,1			 ;YPANTALLA DESIERTO ARRIBA
				LD C,0			 
				LD A,D		  	 ;"A" (*****)  1--3

		        	JP ASIGNANDO_PANTALLAS_DESIERTO		;DE AQUI YA VA A CARGAPANTALLA
										
			Q_NO_DESSIERTO:

			;---   ---   ---   ---   ----


		LD HL,SALTO_MUNDO_ARRIBA
		CALL CAMBIO_DE_MUNDO			;SI NO HAY CAMBIO DE MUNDO VUELVE CON VALOR A=1
		CP 1					;SI LO HAY VUELVE YA CON NUEVA PANTALLA Y NUEVO SALTOPANTALLA
		JR Z,SOLO_CAMBIO_PANTALLA_Q		;AJUSTAMOS SOLO LA COORDENADA CORRESPONDIENTE (SIEMPRE CAMBIAMOS EN VEHICULO 2X2)

		LD A,168
		LD (IX+0),A	;NUEVA COORDENADA Y
		JP CARGAPANTALLA

	        SOLO_CAMBIO_PANTALLA_Q:


		LD A,(SALTO_PANTALLA)
		LD B,A
		LD A,(PANTALLA)
		LD D,A		;PARA CAMBIO DE MUNDO
		ADD A,B
		LD (PANTALLA),A
                LD (IX+2),A
		LD A,176
                SUB (IX+16)
		LD (IX+0),A	;NUEVA COORDENADA Y
		JP CARGAPANTALLA
	
		NO_CAMBIO_PANTALLA_Q:

		;======== CHOQUE ?????
			
			LD A,(IX+0)
			AND 7
			CP 0
			JR NZ,MUEVESQ

			LD H,(IX+30)		;--- ATTR ARRIBA ---
			LD L,(IX+29)
			JP (HL)
			EL_RETORNO_Q:
		
			CP 1
			JP Z,ESTASPARAO		;(*) PROVISIONAL, HABRÁ QUE VER TABLA MALO SI ES 1 O SI COGER ETC	
			;JR NZ,MUEVESQ
			
			;CON OBJETO COGER
			;CON MALO
			;CON COSA NO TRASPASABLE
		
		;======== MUEVES
	     MUEVESQ:

		CALL BORRABUENO
		LD A,(IX+0)
		SUB (IX+4)
		LD (IX+0),A	  	  ;RESTAMOS DESPLAZAMIENTO A LA Y
		LD A,1
		LD (IX+3),A		  ;ASIGNAMOS SENTIDO	
		LD H,(IX+22)
		LD L,(IX+21)		  ;ASIGNAMOS ESPRITE IZQUIERDA
	        JP FOTOGRAMA_AVANZANDO    ;TENGA ESPRITE S5 O NO, ES LO MISMO


TECLAA:

       LD BC, $FDFE         ; SEMIFILA G - A
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "A"
       JR NZ, ESTASPARAO    ; SI NO ESTÁ PULSADO VAMOS A VER SI ACTIVO ES PERSONA PARA MODO 5
       ;HAS PULSADO "A", ENTONCES:


		;======== CAMBIO DE PANTALLA

		LD A,(IX+0)
		CP (IX+15)
		JR NZ, NO_CAMBIO_PANTALLA_A	


			;---   ---   ---   ---   ----  SI ESTAS EN DESIERTO EL CAMBIO PANTALLA ES ESPECIAL


			CALL OASIS			;SALE A=0 1  3		0-NO ES DESIERTO	1-2-3 SI LO ES, MALFARIO-COCHE DESIERTO
			CP 0
			JR Z,A_NO_DESSIERTO

				LD D,A			;GUARDAMOS ESTE "A" (*****)
							
				;ASIGNAMOS NUEVA Y COORDENADA
				LD A,56
         			LD (IX+0),A	;NUEVA COORDENADA Y

				;COMO ES DESIERTO ASIGNAMOS PANTALLA 241  243 SEGÚN HAYA ALGUIEN YA O NO, Y MODIFICAMOS PY PX QUE GUIAN A ROM
				LD B,-1			 ;YPANTALLA DESIERTO ABAJO
				LD C,0			 
				LD A,D		  	 ;"A" (*****)  1--3

		        	JP ASIGNANDO_PANTALLAS_DESIERTO		;DE AQUI YA VA A CARGAPANTALLA
										
			A_NO_DESSIERTO:

			;---   ---   ---   ---   ----


		LD HL,SALTO_MUNDO_ABAJO
		CALL CAMBIO_DE_MUNDO			;SI NO HAY CAMBIO DE MUNDO VUELVE CON VALOR A=1
		CP 1					;SI LO HAY VUELVE YA CON NUEVA PANTALLA Y NUEVO SALTOPANTALLA
		JR Z,SOLO_CAMBIO_PANTALLA_A		;AJUSTAMOS SOLO LA COORDENADA CORRESPONDIENTE (SIEMPRE CAMBIAMOS EN VEHICULO 2X2)

		LD A,56
		LD (IX+0),A	;NUEVA COORDENADA Y
		JP CARGAPANTALLA

	        SOLO_CAMBIO_PANTALLA_A:

		LD A,(SALTO_PANTALLA)
		LD B,A
		LD A,(PANTALLA)
		LD D,A		;PARA CAMBIO DE MUNDO
		SUB B
		LD (PANTALLA),A
                LD (IX+2),A

		LD A,56
		LD (IX+0),A	;NUEVA COORDENADA Y
		JP CARGAPANTALLA
	
		NO_CAMBIO_PANTALLA_A:


		;======== CHOQUE ?????

			LD A,(IX+0)
			AND 7
			CP 0
			JR NZ,MUEVESA

			LD H,(IX+32)		;--- ATTR ABAJO ---
			LD L,(IX+31)
			JP (HL)
			EL_RETORNO_A:
		
			CP 1
			JP Z,ESTASPARAO		;(*) PROVISIONAL, HABRÁ QUE VER TABLA MALO SI ES 1 O SI COGER ETC	
			;JR NZ,MUEVESA
			
			;CON OBJETO COGER
			;CON MALO
			;CON COSA NO TRASPASABLE
		
		;======== MUEVES
	     MUEVESA:
                
		CALL BORRABUENO
		LD A,(IX+0)
		ADD A,(IX+4)
		LD (IX+0),A	  	  ;SUMAMOS DESPLAZAMIENTO A LA Y
		LD A,2
		LD (IX+3),A		  ;ASIGNAMOS SENTIDO	
		LD H,(IX+24)
		LD L,(IX+23)		  ;ASIGNAMOS ESPRITE IZQUIERDA
	        JP FOTOGRAMA_AVANZANDO    ;TENGA ESPRITE S5 O NO, ES LO MISMO


ESTASPARAO:

    LD A,(IX+5)
    CP 5
    JP Z,SUBMARINEANDOii                 ;SI SUBMARINO POR DEFECTO SUBES NO PARAS
    DEVUELTASUB:


LD A,(IX+10)
CP 1
JP Z,FINPINTANDOLO                ;LOS QUE NO TIENEN ESPRITE ESPECIAL PARADO NO SE PINTA

LD H,(IX+20)
LD L,(IX+19)
NO_SENTIDO5:                       ;NO VOY A PONER SENTIDO 5 PARA NO PERDER DIRECCION DISPARO

LD A,(CUENTA_FOTOGRAMA_BUENO2)
INC A
LD (CUENTA_FOTOGRAMA_BUENO2),A
CP (IX+11)
JR Z,CAMBIA_FOTOGRAMA1b
CP (IX+12)
JR Z,CAMBIA_FOTOGRAMA2b
JP FINPINTANDOLO                ;SI NO HAY CAMBIO NO PINTAMOS

CAMBIA_FOTOGRAMA1b:
XOR A
LD (CUENTA_FOTOGRAMA_BUENO2),A
LD E,A
JR CHASQUI

CAMBIA_FOTOGRAMA2b:
LD E,(IX+6)

CHASQUI:
LD D,0
ADD HL,DE



;===============================================================================
;=============================================================================== 
;===============================================================================

PINTANDOLO:   ;RUTINA PINTADORA DEL PERSONAJE ACTIVO, AQUI LLEGAMOS CON EL ESPRITE YA SELECCIONADO EN HL

	LD B,(IX+0)
	LD C,(IX+1)

	LD A,(IX+6)		;TAMAÑO  8 -   - 32
	CP 32
	JR Z,ES_TAM_2X2pintar	;SI NO ES 32 SOLO PUEDE SER 8

      ES_TAM_1X1pintar:
	CALL HR1X1BS
	JR FINPINTANDOLO

      ES_TAM_2X2pintar:
	CALL HR2X2BS
	
FINPINTANDOLO:
FIN_LECTURA:

;===============================================================================
;=============================================================================== CAMBIO DE PERSONAJE ACTIVO
;===============================================================================


LD BC, $F7FE         ; SEMIFILA 5 - 1
IN A, (C)            ; LEER PUERTO
BIT 0, A             ; COMPROBAR BIT 0 "1"
JR NZ, NOTECLA_1     ; SI NO ESTÁ PULSADO SALIMOS

	;-----> EFECTILLO CHUWI-------------------------------------------------¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
 CALL PAUSADE10                                 ;=========================================================QUITALO


      LD A,(ESTADOS+56)
      CP 0
      JP NZ,NOTECLA_1          ;SI ESTADO 56 NO ES CERO ES QUE YA SOLO HAY UN PERSONAJE Y ESTO NO FUNCIONA

      TEJEMANEJE_NAVEFINAL:

;ANALIZAMOS QUÉ PERSONAJE ES EL ACTIVO PARA CAMBIARLO

LD A,(IX+8)		;A QUIEN LLEVO, SEA VEHICULO O PERSONA 1-MALFARIO 2-FMANAGER
CP 1
JR Z,CAMBIO_A_FMANAGER
CP 2
JR Z,CAMBIO_A_MALFARIO

JR NOTECLA_1		;SI ES VEHICULO y =0 NO PUEDE SER PQ NO ESTARIA ACTIVO

	 		;		  =3 NO CAMBIO DE PERSONAJE PQ ESTAN ACTIVOS LOS DOS HASTA QUE BAJE UNO

CAMBIO_A_MALFARIO:

        CALL COLOR_I_MALF               ;CAMBIAMOS EL COLOR INTERFEIS

	CALL GUARDACTIVO		;GUARDAMOS EL ACTIVO EN SU LUGAR

	LD A,(VALORES_PERSONAJES+44)	;ACTIVAMOS MALFARIO:       DONDE ESTÁ MALFARIO  0-ANDANDO 2-COCHE, ETC..
	LD DE,37
	CALL Mul8       		;HL=0 ANDANDO (HL=37 NO PUEDE SER) HL=74 COCHEN ETC
	LD DE,VALORES_PERSONAJES+37
	ADD HL,DE			;ORIGEN
	LD DE,VALORES_PERSONAJES	;DESTINO
	LD BC,37
	LDIR

	LD A,(IX+5)
	CP 2			
	CALL NC, GENERAMOS_ESPRITES	;SI ES VEHICULO 2X2 GENERAMOS SPRITES

        LD A,(IX+2)
        LD (PANTALLA),A

        CALL DETECTAME_SALTOPANTALLA    ;USA IX DISTINTO PERO CARGAPANTALLA LUEGO

	JP CARGAPANTALLA

CAMBIO_A_FMANAGER:

        CALL COLOR_I_FM                 ;CAMBIAMOS EL COLOR INTERFEIS

	CALL GUARDACTIVO		;GUARDAMOS EL ACTIVO EN SU LUGAR

	LD A,(VALORES_PERSONAJES+81)	;ACTIVAMOS FMANAGER:       DONDE ESTÁ FMANAGER  0-ANDANDO 2-COCHE, ETC..
	DEC A
	CP 255
	JR NZ,TRIKINUELA
	XOR A
      TRIKINUELA:
	LD DE,37
	CALL Mul8
	LD DE,VALORES_PERSONAJES+74
	ADD HL,DE			;ORIGEN
	LD DE,VALORES_PERSONAJES	;DESTINO
	LD BC,37
	LDIR

	LD A,(IX+5)
	CP 2
	CALL NC, GENERAMOS_ESPRITES	;SI ES VEHICULO 2X2 GENERAMOS SPRITES

        LD A,(IX+2)
        LD (PANTALLA),A

        CALL DETECTAME_SALTOPANTALLA    ;USA IX DISTINTO PERO CARGAPANTALLA LUEGO

        JP CARGAPANTALLA

NOTECLA_1:



;===============================================================================
;=============================================================================== BAJAR/SUBIR VEHICULO
;===============================================================================


LD BC, $F7FE         ; SEMIFILA 5 - 1
IN A, (C)            ; LEER PUERTO
BIT 1, A             ; COMPROBAR BIT 0 "2"
JP NZ, NO_TECLA2     ; SI NO ESTÁ PULSADO SALIMOS

CALL PAUSADE10                                 ;=========================================================QUITALO


BAJAR_VEHICULO:

	;COMPROBAMOS SI ESTAMOS DENTRO DE ALGÚN VEHÍCULO
	LD A,(IX+5)		;ES...
		CP 5
		JP Z,ESPECIAL_BAJA_SUBMARINO_P115
	CP 2			
	JR C,SUBIR_VEHICULO	;SI ES 0 o 1 NO PUEDES BAJAR PQ NO ESTAS SUBIDO A NADA


	;EN EL VEHICULO DEL QUE BAJAMOS	...
		
		JP ATTR_BAJAR		;ANTES DE PERDER COORDENADAS VEHICULO OBTENEMOS YX BAJAR Y LO GUARDAMOS EN AUXILIARES
                SIHAYHUECO:             ;SI DETECTA QUE NO PUEDES BAJAR TE SACA DE "BAJAR" (NOTECLA2)

	LD A,(IX+8)		; A QUIEN LLEVAMOS
        CP 2
	JR Z,BAJA_FMANAGER	; EN CUALQUIER OTRO CASO =1 O =3 BAJA MALFARIO,  =0 NO PUEDE SER SI LLEGAMOS AQUI

		BAJA_MALFARIO:
		CP 3		;SI IX+8=3 ENTONCES HAY QUE DEJAR IX+8=2
		JR NZ,SIALONE	;SI IX+8=2 ENTONCES TODO A CERO

			NOALONE:
			LD A,2
			LD (IX+8),A		;(IX+9 SIGUE OCUPADO=1)
			JR APEATE

			SIALONE:
			XOR A
			LD (IX+8),A
			LD (IX+9),A

			APEATE:
			;CALL ATTR_BAJAR		;ANTEDE DE PERDER COORDENADAS VEHICULO OBTENEMOS YX BAJAR Y LO PUSHEAMOS
                        ;CP 255                  ;SI VUELVE CON VALOR 255 ES QUE NO PUEDES BAJAR
                        ;JP Z,NO_TECLA2
                        CALL GUARDACTIVO	;GUARDAMOS EL VEHICULO ACTIVO EN SU LUGAR

			LD HL,VALORES_PERSONAJES+37	;MALFARIO ACTIVAR
			JR PIES_AL_SUELO
	
		BAJA_FMANAGER:
		XOR A
		LD (IX+8),A
		LD (IX+9),A
		;CALL ATTR_BAJAR		;ANTEDE DE PERDER COORDENADAS VEHICULO OBTENEMOS YX BAJAR Y LO PUSHEAMOS
                ;CP 255                     ;SI VUELVE CON VALOR 255 ES QUE NO PUEDES BAJAR
                ;JP Z,NO_TECLA2
		CALL GUARDACTIVO	;GUARDAMOS EL VEHICULO ACTIVO EN SU LUGAR

		LD HL,VALORES_PERSONAJES+74	;FMANAGER ACTIVAR

			PIES_AL_SUELO:
			LD DE,VALORES_PERSONAJES+0	;ACTIVO
			LD BC,37
			LDIR
			
			LD A,(PANTALLA)
			LD (IX+2),A		;DAMOS VALOR A PANTALLA
			XOR A
			LD (IX+7),A		;DAMOS VALOR "ANDANDO" A DONDE ESTOY

			;ASIGNAMOS VALOR YX...

                        LD A,(AUXILIAR_BAJAR+0) ;OBTENIDAS EN ATTR_BAJAR ANTES DE PERDER LOS DATOS DEL YX DEL VEHICULO
                        LD (IX+0),A
                        LD A,(AUXILIAR_BAJAR+1)
                        LD (IX+1),A
	JP CARGAPANTALLA



SUBIR_VEHICULO:					

	PUSH IY
	LD IY,VEHICULO

	LD B,2
	DOS_POCIBLE:
	PUSH BC	

	;ESTAMOS EN POSICION CERCANA?

		;YPERSONAJE+8-YVEHICULO<25
		LD A,(IX+0)
		ADD A,12				;+8
		SUB (IY+0)
		CP 29					;25
		JR NC,SIGUIENTE_VEHICULO

		;XPERSONAJE+8-XVEHICULO<25
		LD A,(IX+1)
		ADD A,12				;+8
		SUB (IY+1)
		CP 29					;25
		JR NC,SIGUIENTE_VEHICULO

	;ESTA LIBRE?

		LD A,(IY+3)
		CP 0
		JP Z,SUBIENDOME		;ESTA LIBRE, RUTINA EN RUTINAS_I
		LD A,(IY+2)		;QUÉ VEHICULO ES
		CP 3			;SI ES ROBOT 2X2 SUBES SIEMPRE,  AQUI AÑADIRIA OTROS "CP"
		JP Z,SUBIENDOME		;ESTA MEDIO LIBRE, RUTINA EN RUTINAS_I

	
	SIGUIENTE_VEHICULO:
	LD DE,4
	ADD IY,DE

	POP BC
	DJNZ DOS_POCIBLE
	POP IY


NO_TECLA2:



;===============================================================================
;=============================================================================== SPRITES ANIMADOS
;===============================================================================
;OJO CAMBIAMOS IX

LD IX,FONDITO

LD B,2
REGOLDO_FONDO:
PUSH BC


     LD A,(IX+7)           ;INDICADOR 0 NO FUNCIONA 1 SI FUNCIONA
     CP 0
     JP Z,OTRO_FONDO


          ;CONTADOR VELOCIDAD
          INC (IX+5)
          LD A,(IX+5)
          CP (IX+2)
          JP NZ,OTRO_FONDO
          XOR A
          LD (IX+5),A

          ;SELECCION DE ESPRITE GESTION DE FRAMES

          INC (IX+6)
          LD A,(IX+6)       ;CONTADOR DE FRAMES

               PRIMER_FOTOGRAMA:
                 CP 1
                 JR NZ,SEGUNDO_FOTOGRAMA
                 LD E,0          ;1º FOTOGRAMA E=0
                 JP TXASCOPINTA

               SEGUNDO_FOTOGRAMA:
                 CP 2
                 JR NZ,TERCER_FOTOGRAMA
                 CP (IX+4)        ;LIMITE DE FRAMES
                 CALL Z,CONTAFRAME_CERO
                 LD E,(IX+10)     ;2º FOTOGRAMA E=TAMAÑO SPRITE
                 JP TXASCOPINTA

               TERCER_FOTOGRAMA:
                 CALL CONTAFRAME_CERO
                 LD A,(IX+10)
                 ADD A,A
                 LD E,A           ;3º FOTOGRAMA E= TAMAÑO SPRITEx2

          TXASCOPINTA:	;AQUI ENTRA CON "E" BUFFER SPRITE Y SE LO SUMAMOS A LA BASE
          LD H,(IX+8)
          LD L,(IX+9)
          LD D,0
          ADD HL,DE
          EX DE,HL
          LD B,(IX+0)
          LD C,(IX+1)
          LD A,(IX+3)
          CALL DIBUJA

     OTRO_FONDO:
     LD BC,11
     ADD IX,BC

POP BC
DJNZ REGOLDO_FONDO

;===============================================================================
;=============================================================================== EVENTOS
;===============================================================================

;/////////////////////////////  DESDE UN VEHICULO NO PUEDES HACER NADA SALVO SUBMARINO (PARA SALIR)
;//////////////////////////////////////////////////////////////////////////////////

LD A,(VALORES_PERSONAJES+5)		;ES...
CP 5
JR Z,KUSKI
CP 2
JP NC,FINEVENTOSII


KUSKI:
;/////////////////////////////  OBTENEMOS COORDENADAS EN BAJA RESOLUCIÓN
;//////////////////////////////////////////////////////////////////////////////////

LD A,(VALORES_PERSONAJES+1)          ;X
LD D,A
LD A,(VALORES_PERSONAJES+0)          ;Y
LD E,A
CALL HRaBR                           ;"DE" "XY" EN BAJA RESOLUCIÓN
LD A,D
LD (BX),A                            ;GUARDO XB - YB  COORDENADAS EN BAJA RESOLUCIÓN, TENER ENCUENTA QUE ES YA PINTADO EL BUENO EN ESE CICLO
LD A,E
LD (BY),A

LD HL,EVENTOS

;/////////////////////////////  BUCLE EVENTOS
;//////////////////////////////////////////////////////////////////////////////////

INICIOEVENTOS:

;PONEMOS EVENTOS EN IX ---------------------------------------------------------------

PUSH HL ;(**) GUARDAMOS HL
PUSH HL
POP IX

;HEMOS TERMINADO? --------------------------------------------------------------------
              LD A,(IX)
              CP 0
              JP Z,FINEVENTOS

;ESTAMOS EN POSICIÓN? --------------------------------------------------

              LD A,(BX)
              SUB (IX+1)
	      INC A			;BUENO-(ACTIVA-1)=BUENO-ACTIVA+1
              CP 3
              JP NC,BLOQUESIGUIENTE     ;... 255NO 0SI 1SI 2SI 3NO ...

              LD A,(BY)
              SUB (IX+0)
	      INC A			;BUENO-(ACTIVA-1)=BUENO-ACTIVA+1
              CP 3
              JP NC,BLOQUESIGUIENTE     ;... 255NO 0SI 1SI 2SI 3NO ...           

;VALOR ESTADO ES CORRECTO? -------------------------------------------

              LD A,(IX+2)
              CP 0
              JR Z,OBJETO_EN_INVENTARIO

              CALL PESTADO  ;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO, usa "HL" - "BC" - "A"
              CP (IX+3)      ;COMPARRAMOS CON VALOR ESTADO A COMPROBAR
              JP NZ,BLOQUESIGUIENTE

;VALOR OBJETO EN INVENTARIO ES CORRECTO? -------------------------------------------
              OBJETO_EN_INVENTARIO:

              LD A,(IX+4)
              CP 0
              JR Z,ACTIVA_MARCADOR

              INVENTARIO_IGUAL:
	      LD A,(VALORES_PERSONAJES+8)	;QUIEN LLEVO (SIEMPRE ES 1 o 2 EN PERSONAJES)
	      CP 1
	      JR Z,ES_INVENTA1

	      ES_INVENTA2:
	      LD HL,INVENTARIO2
	      JR CHOLATE		

	      ES_INVENTA1:
	      LD HL,INVENTARIO1

	      CHOLATE:
	      LD A,(HL)
	      CP (IX+5)
              JP NZ,BLOQUESIGUIENTE


;ESTAS EN POSICION Y SE CUMPLE, EN SU CASO, CONDICION DE ESTADO Y DE INVENTARIO, ACTIVAMOS MARCADOR -------------------------------------------

              ACTIVA_MARCADOR:
	      LD A,1
	      LD (MARCADOR),A		;MARCADOR ACTIVADO  -----> HAY QUE PENSAR SI SERA IGUAL PARA TODOS O NO, EN CUYO CASO HAY QUE SACAR IX+6 Y COMPARAR, CASI UN SOLO PERO CHULO   

;CON MARCADOR ACTIVADO, COMPROBAMOS SI HAS PULSADO O NO ACCION -------------------------------------------

	      TECLAN:
       	      LD BC, $7FFE         ; SEMIFILA B - SPACE
       	      IN A, (C)            ; LEER PUERTO
       	      BIT 3, A             ; COMPROBAR BIT 3 "N"
       	      JP NZ, SIN_PULSAR    ; SI NO ESTÁ PULSADO VAMOS A RUTINAS SIN PULSAR, SOLO POR ESTAR
       	      ;HAS PULSADO "N", ENTONCES...

;/////////////////////////////  BUCLE EVENTOS: COSAS QUE SUCEDEN SOLO SI APRIETAS ACCION
;//////////////////////////////////////////////////////////////////////////////////
PULSANDO:

              LD A,(IX+6)

              ;C A M B I A R  E S T A D O  0 <-> 1  ===============================================================================================================
              CHANGESTADO:
              CP 1
              JR NZ,COGERCOSICAS	       		       

		       CALL AUXILIAR_EVENTOS    ;CAMBIA ESTADOS SEÑALADOS EN IX+7 e IX+8,  CAMBIA FONDOS ANIMADOS SEGUN IX+10 e IX+11 			
      
		       LD A,(IX+9)		;ESPECIALES	     
			 EXPECHIAL1:
			  CP 69
			  JR NZ,EXPECHIAL2
			   
                                 ;AQUI PINTAMOS GPS INTERFACE.

				LD BC,271	       ;1,15
				LD DE,GEPESECERRADO
				LD A,255
				CALL DIBUJA

				 LD A,24
				 JP testualisa 

			 EXPECHIAL2:
			  CP 70
			  JR NZ,EXPECHIAL3

				 ;ACUMULADOR ESTADOS AQUA PARA ABRIR PUERTA P35
				 LD A,(ESTADOS+40)
				 CP 1
				 JR NZ,ESTADO42_0

				 LD A,(ESTADOS+41)
				 CP 1
				 JR NZ,ESTADO42_0
				
				 ESTADO42_1:
				 LD A,1
				 LD (ESTADOS+42),A				
				 JR TEXTUALIZA

				 ESTADO42_0:
				 XOR A
				 LD (ESTADOS+42),A
				 JR TEXTUALIZA
				 
			 EXPECHIAL3:
			  CP 71
			  JR NZ,TEXTUALIZA

                             LD B,(IX+0)
                             LD C,(IX+1)
                             LD DE,JUMBLEJUMBLEJUMBLE     ;BORRAMOS BOLA
                             LD A,71
                             CALL DIBUJA

			     JP TRUCO_PANT35

		       TEXTUALIZA:
		       ;EN ESTE CASO FRASE FIJA ALEATORIA DE 3	
		       LD BC,3
		       CALL LIMITE		;A= 0 1 2
				testualisa:
                       CALL UNAFRASEB
		       CALL KOLORKAJA

  		       ;CALL FX_MINIESCALAUP
                       ;CALL PAUSADE10

                       POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		       CALL PINTASTADO
                       JP FINEVENTOSII         ;SALIMOS DEL BUCLE


              ;C O G E R   C O S I C A S  ==============================================================================================================
              COGERCOSICAS:
              CP 2
              JP NZ,USAR_OBJETOI
			
	
		;1ºBORRAMOS 1X1
			LD B,(IX+0)
			LD C,(IX+1)			
			LD A,(FONDO)
			LD DE,VACIO1X1BR
			CALL DIBUJA

		;2ºMETEMOS INVENTARIO
			LD A,(IX+7)
			CALL METEINVENTARIO
			CALL PINTAINVENTARIO_INTERFEIS

                ;3º CAMBIAMOS ESTADO A COGIDO
	        	LD A,(IX+2)             ;Nº ESTADO
                	CALL PESTADO  		;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO "HL" DIRECCION DEL ESTADO, usa "HL" - "BC" - "A"
	        	XOR 1			; 0 -> 1  y  1 -> 0
                	LD (HL),A                ;MODIFICAMOS VALOR DEL ESTADO

                            TRUCO_ETORNO:

               		CALL EFECTO2
               		;CALL PAUSADE10

	       ;4ºTEXTOS
	       		;EN ESTE CASO FRASE FIJA ALEATORIA DE 2	
	       		LD BC,2
	       		CALL LIMITE		;A= 0 1 
	       		ADD A,3			;A= 3 4
               		CALL UNAFRASEB
	       		CALL KOLORKAJA

                        POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP FINEVENTOSII         ;SALIMOS DEL BUCLE


              ;U S A R   O B J E T O    I N V E N T A R I O  ================================================================================================================
              USAR_OBJETOI:
              CP 3
              JP NZ,ACTIVAR_18
	      ;USAMOS OBJETO INVENTARIO QUE DESAPARECE, CAMBIAMOS ESTADO QUE LO HA PERMITIDO Y RESTO IGUAL QUE CAMBIAR ESTADO	

		;1º BORRAMOS INVENTARIO
                        CALL BORRAMOSINVENTARIO
			CALL PINTAINVENTARIO_INTERFEIS

                ;2º CAMBIAMOS ESTADO QUE LO HA PERMITIDO
	        	LD A,(IX+2)             ;Nº ESTADO
                	CALL PESTADO  		;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO "HL" DIRECCION DEL ESTADO, usa "HL" - "BC" - "A"
	        	XOR 1			; 0 -> 1  y  1 -> 0
                	LD (HL),A                ;MODIFICAMOS VALOR DEL ESTADO
	
		;3º IGUAL QUE CAMBIAR ESTADO, PODEMOS CAMBIAR ADEMAS ALGUN ESTADO ADICIONAL Y ACTIVAR O DESACTIVAR FONDOS

		       CALL AUXILIAR_EVENTOS    ;CAMBIA ESTADOS SEÑALADOS EN IX+7 e IX+8,  CAMBIA FONDOS ANIMADOS SEGUN IX+10 e IX+11 			
      
		;4º POSIBLES ESPECIALES
				
				LD A,(IX+9)
				CP 0
				JR Z,NO_HAY_ESPECIALES

			    ESPECIAL_PANTALLICA_20_TELETRANSPORTE:
				CP 26
				JR NZ,ESPECIAL_PANTALLICA_11_SUBMARINO
				CALL PESTADO
				INC A			;INCREMENTAMOS EL VALOR DEL ESTADO 26
				LD (HL),A
				JR NO_HAY_ESPECIALES

			    ESPECIAL_PANTALLICA_11_SUBMARINO:
				CP 55
				JR NZ,ESPECIAL_PANTALLICA_XX
				CALL PESTADO
				INC A			;INCREMENTAMOS EL VALOR DEL ESTADO 55
				LD (HL),A
				JR NO_HAY_ESPECIALES

			    ESPECIAL_PANTALLICA_XX:

			NO_HAY_ESPECIALES:
		;5º TEXTOS       
		       ;EN ESTE CASO FRASE FIJA ALEATORIA DE 2	
	       		LD BC,2
	       		CALL LIMITE		;A= 0 1 
	       		ADD A,5			;A= 5 6
               		CALL UNAFRASEB
	       		CALL KOLORKAJA

  		       CALL EFECTO3
                       ;CALL PAUSADE10

                       POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		       CALL PINTASTADO
                       JP FINEVENTOSII         ;SALIMOS DEL BUCLE


   	      ;A C T I V A R   P U E R T A 18  ====================================================================================================================
              ACTIVAR_18:
              CP 4
              JP NZ,TRAETREN_29

			;1º IGUAL QUE CAMBIAR ESTADO, PODEMOS CAMBIAR ADEMAS ALGUN ESTADO ADICIONAL Y ACTIVAR O DESACTIVAR FONDOS

		        CALL AUXILIAR_EVENTOS    ;CAMBIA ESTADOS SEÑALADOS EN IX+7 (EL DE RESORTE),  CAMBIA FONDOS ANIMADOS SEGUN IX+10 e IX+11 			

                        LD B,(IX+0)
                        LD C,(IX+1)
                        LD DE,JUMBLEJUMBLE
                        LD A,(FONDO)
                        CALL DIBUJA

			;2º LANZAMOS PINTA18 SI ESTAMOS EN P18

			LD A,(PANTALLA)
			CP 18
			CALL Z,PINTA18
			
			;7º INCREMENTAMOS ESTADO 16 ACUMULADOR DE RESORTES Y EN SU CASO ACTIVAMOS ESTADO 17
			          TRUCO_PANT35:
                        LD A,(ESTADOS+16)
		        INC A
			LD (ESTADOS+16),A
			CP 9
			JR NZ,LONGPLAY
			LD A,1
			LD (ESTADOS+17),A	;ABRIMOS PORTON P18
		        LONGPLAY:

			;4º TEXTOS
		       ;EN ESTE CASO FRASE FIJA Nº 7	
		        LD A,7
               		CALL UNAFRASEB
	       		CALL KOLORKAJA

  		       ;CALL FX_MINIESCALAUP
                       ;CALL PAUSADE10
                     
		       POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		       JP FINEVENTOSII         ;SALIMOS DEL BUCLE

	      ;E S P E C I A L    T R E N   P29  ====================================================================================================================
              TRAETREN_29:
              CP 5
              JP NZ,TELETRANSPORTE


			;1º SI TREN ESTÁ YA OCUPADO NO HACEMOS NADA
			LD A,(VALORES_PERSONAJES+526)		;EL "QUIEN LLEVO" DEL TREN EN CUESTION
			CP 0
			JR NZ,PUFOGUAGUA

			;2º CAMBIAMOS ESTADO PARA INTERRUPTOR			
	        	LD A,19             	;Nº ESTADO =19 INTERRUPTOR TRAER TREN
                	CALL PESTADO  		;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO "HL" DIRECCION DEL ESTADO, usa "HL" - "BC" - "A"
	        	XOR 1			; 0 -> 1  y  1 -> 0
                	LD (HL),A                ;MODIFICAMOS VALOR DEL ESTADO 19

			;3º TXT Y ANIMACION
		        LD A,5			;"OLE!!"
               		CALL UNAFRASEB
	       		CALL KOLORKAJA

			LD IX,DATOS_CINEMATICAS+0
			LD DE,ESPRITES_CINEMATICAS+0
			CALL QUE_CARACTER

			;5º SI TREN ESTÁ EN 29-> 16 // 16->29 Y CARGAPANTALLA

			LD A,(VALORES_PERSONAJES+520)		;PANTALLA DONDE ESTÁ EL TREN EN CUESTION
			CP 29					;YX NO HACE FALTA PORQUE COINCIDEN EN AMBAS PANTALLAS
			JR Z,BETE16

				BETE29:
				LD A,29			
				LD (VALORES_PERSONAJES+520),A
                                JR BETEX

				BETE16:
				LD A,16
				LD (VALORES_PERSONAJES+520),A

                                BETEX:
			        POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        	JP CARGAPANTALLA         ;SALIMOS DEL BUCLE Y CARGAMOS PANTALLA				
	
			PUFOGUAGUA:
			;FX SONIDITO ERROR
			;TXT 
		        LD A,8			;"NO FUNCIONA !"
               		CALL UNAFRASEB
	       		CALL KOLORKAJA
		        POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP FINEVENTOSII         ;SALIMOS DEL BUCLE

	      ;T R A N S P O R T A R S E   A  O T R A   P A N T A L L A  ====================================================================================================================
              TELETRANSPORTE:
              CP 6
              JP NZ,KKLAVE_COLOR

			RETRUKKO:	;PARA TELETRANPORTE SIN PULSAR (OPCION 7)

			;1º SE CUMPLE CONDICIÓN EXACTA?
			LD A,(VALORES_PERSONAJES+0)		;Y DEL BUENO
			CP (IX+7)
			JR NZ,TXTCOLOCATE			
			LD A,(VALORES_PERSONAJES+1)		;X DEL BUENO
			CP (IX+8)
			JR NZ,TXTCOLOCATE
	
			;2º EFECTO Y TEXTO
			;CALL PARPADEA
			;TXT 

			;3º ASIGNAMOS NUEVOS DATOS
			REUTILIZACION:				;PARA IR DE UNA PANTALLA QUE SE ENTRA POR PUERTA SIN TECLA...
			LD A,(IX+10)
			LD (VALORES_PERSONAJES+0),A		;Y DEL BUENO
			LD A,(IX+11)
			LD (VALORES_PERSONAJES+1),A		;X DEL BUENO
                        LD A,(IX+9)
                        LD (PANTALLA),A
                        LD (VALORES_PERSONAJES+2),A		;PANTALLA
                        LD A,(IX+5)
			LD (SALTO_PANTALLA),A			;SALTOPANTALLA

			POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP CARGAPANTALLA         ;SALIMOS DEL BUCLE Y CARGAMOS PANTALLA	

			;TEXTO "COLOCATE BIEN"
			TXTCOLOCATE:
			LD A,(IX+3)		;INDICA EN ESTE CASO SI DECIMOS EL TXT O NO LO DECIMOS (POR CUANDO NO PULSAMOS)		        
			CP 1
			JR Z,OIIIP
			LD A,9			;"DEBO COLOCARME MEJOR..."
               		CALL UNAFRASEB
	       		CALL KOLORKAJA
		       OIIIP:
		        POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP FINEVENTOSII         ;SALIMOS DEL BUCLE


	      ;A B R I R    C L A V E    C O L O R  ====================================================================================================================
	      KKLAVE_COLOR:
              CP 8
              JP NZ,ANALIZATOR_MALF

 		       ;CALL FX_MINIESCALAUP

		        POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP KLAVE_KOLOR           ;SALIMOS DEL BUCLE  EN RUTINAS I APDO 12


              ;A N A L I Z A D O R    T E L E T R A N S P O R T E   MALFARIO  ====================================================================================================================
	      ANALIZATOR_MALF:
              CP 9
              JP NZ,ANALIZATOR_FMAN


	      LD A,(VALORES_PERSONAJES+5)	;QUIEN
	      CP 0				;MALFARIO
	      JR Z,SI_ES_EL
	      JR NO_ES_EL
 	
		SI_ES_EL:
		 LD A,1
		 LD (ESPEJO+200),A
		 JR QUIEN_ERA_EL
		
		NO_ES_EL:
 		 XOR A
		 LD (ESPEJO+200),A

		QUIEN_ERA_EL:

			;1º SE CUMPLE CONDICIÓN EXACTA?
			LD A,(VALORES_PERSONAJES+0)		;Y DEL BUENO
			CP (IX+7)
			JR NZ,TXTCOLOCATE			
			LD A,(VALORES_PERSONAJES+1)		;X DEL BUENO
			CP (IX+8)
      		        JR NZ,TXTCOLOCATE

              PUSH IX              ;  (**//)  GUARDAMOS LOS IX PARA APROVECHAR RUTINA TELETRANSPORTE

                        LD C,(IX+1)
                        LD A,(VALORES_PERSONAJES+1)      ;LA X DEL BUENO ACTIVO
                        CP 128
                        JR NC,LACUSQUI                   ;SOLO DISMINUIMOS LA X SI ESTAMOS EN LA PARTE IZQUIERDA DE LA PANTALLA
			DEC C
                       LACUSQUI:
			LD B,(IX+0)
			DEC B


			LD IX,DATOS_CINEMATICAS+13
			LD (IX+0),C
			LD (IX+1),B			;AJUSTO LA ANIMACION A LOS DATOS YX
			LD DE,ESPRITES_CINEMATICAS+76
			CALL QUE_CARACTER
              POP IX               ;  (**//)

	      LD A,(ESPEJO+200)
	      CP 1
	      JP Z,RETRUKKO 	      ;RUTINA TELETRANSPORTE SI ES EL QUE SE ESPERABA

	      ;FX SONIDITO ERROR      ;SONIDO Y TEXTO ERROR SI NO ES LA PERSONA ADECUADA
	      ;TXT 
	        LD A,10			;"ANALISIS CHUNGO"
             	CALL UNAFRASEB
	       	CALL KOLORKAJA
		POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		JP FINEVENTOSII         ;SALIMOS DEL BUCLE	      


              ;A N A L I Z A D O R    T E L E T R A N S P O R T E   F MANAGER  ====================================================================================================================
	      ANALIZATOR_FMAN:
              CP 10
              JP NZ,ENTRA_DESIERTO

	      LD A,(VALORES_PERSONAJES+5)	;QUIEN
	      CP 1				;FMANAGER
	      JP Z,SI_ES_EL
	      JP NO_ES_EL

              ;E N T R A D A      D E S I E R T O   SOLO MALFARIO  ====================================================================================================================
	      ENTRA_DESIERTO:
              CP 11
              JP NZ,SAL_DESIERTO

			LD A,(VALORES_PERSONAJES+5)
			CP 0
			JP Z,RETRUKKO			;SI ES MALFARIO DIRECTAMENTE ENTRAS EN DESIERTO USANDO RUTINAS DE 6

			TAMPOCO_SUBMARINO_IN:		;TRUCO PARA USARLO TAMBIEN EN SUBMARINO
		  ;FX SONIDITO ERROR      ;SONIDO Y TEXTO ERROR SI NO ES MALFARIO
	          ;TXT 
	        	LD A,11			;"YO AHI NO ENTRO QUE MAL ROLLO"
             		CALL UNAFRASEB
	       		CALL KOLORKAJA
			POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
			JP FINEVENTOSII         ;SALIMOS DEL BUCLE
                        
              ;S A L I D A      D E S I E R T O   SOLO MALFARIO  ====================================================================================================================
	      SAL_DESIERTO:
              CP 12
              JP NZ,ENTRA_SUBMARINO

			LD BC,271	   ;1,15
			LD DE,VACIO2X2	   ;BORRAMOS GEPESE
			LD A,255
			CALL DIBUJA

                           XOR A
                           LD (DESIERTO1),A          ; VUELVES DESIERTO
                           JP RETRUKKO
 
  	     ;E N T R A D A      M U N D O   S U B M A R I N O   SOLO MALFARIO  ====================================================================================================================
	      ENTRA_SUBMARINO:
              CP 13
              JP NZ,SAL_SUBMARINO

			LD A,(VALORES_PERSONAJES+5)
			CP 0
			JP NZ,TAMPOCO_SUBMARINO_IN		;SI NO ES MALFARIO DIRECTAMENTE USAS RUTINA DE NO DE DESIERTO


			;CALL EFECTO FX ************************
			LD HL,ENTRADA_MUNDO_SUBMARINO		;INICIALIZAMOS MUNDO SUBMARINO
			LD DE,VALORES_PERSONAJES+0
			LD BC,37
			LDIR

                        LD A,(VALORES_PERSONAJES+54)
                        LD (VALORES_PERSONAJES+17),A		;PONEMOS VIDA Y VIDAS DE MALFARIO A SUBMARINO
                        LD A,(VALORES_PERSONAJES+55)
                        LD (VALORES_PERSONAJES+18),A

			LD A,5
			LD (VALORES_PERSONAJES+44),A		;"DONDE ESTOY" MALFARIO

			LD A,125
			LD (PANTALLA),A

			LD A,3
			LD (SALTO_PANTALLA),A			;SALTOPANTALLA

			POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP CARGAPANTALLA         ;SALIMOS DEL BUCLE Y CARGAMOS PANTALLA	


  	     ;S A L I D A      M U N D O  S U B M A R I N O   SOLO MALFARIO (IMPLICITO)  ====================================================================================================================
	      SAL_SUBMARINO:
              CP 14
              JP NZ,E_TORNO_ONE

			;CALL EFECTO FX ************************
			LD HL,SALIDA_MUNDO_SUBMARINO			;INICIALIZAMOS MALFARIO EN PANT 11
			LD DE,VALORES_PERSONAJES+0
			LD BC,17
			LDIR
                                                                        ;LA VIDA ES LA DEL SUBMARINO Y NO SE TOCA
			LD HL,VALORES_INICIALES_PERSONAJES+19		;INICIALIZAMOS MALFARIO EN PANT 11
			LD DE,VALORES_PERSONAJES+19
			LD BC,18
			LDIR

			LD A,4
			LD (SALTO_PANTALLA),A			;SALTOPANTALLA

			LD A,11
			LD (PANTALLA),A

			POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        JP CARGAPANTALLA         ;SALIMOS DEL BUCLE Y CARGAMOS PANTALLA	



            ;eTORNO PANTALLA 7  ====================================================================================================================
       E_TORNO_ONE:
       CP 15
       JP NZ,E_TORNO_TWO

	                LD IX,ETORNO

                        ;1º SI HAY ALGO LO COJO   SI NO LO HAY LO PONGO SI ESTA VACIO EL OTRO HUECO
                        LD A,(IX+3)                            ;LADO DERECHO
                        CP 0                                   ;SI IX+3=0 NO HAY NADA QUE COGER
                        JR Z,LO_PONGO

              	LO_COJO:

		        CALL METEINVENTARIO
		        CALL PINTAINVENTARIO_INTERFEIS
		        LD C,7
		        CALL BORRAeTORNO			;BORRAMOS
		        XOR A
		        LD (IX+3),A
		        LD (IX+4),A
		        JP TRUCO_ETORNO       			 ;REUTILIZAMOS RUTINAS COGER OBJETOS


                LO_PONGO:

                         LD A,(IX+0)                             ;YA HAY ALGO
                         CP 0
                         JP NZ,TXTQUE

                         LD A,(VALORES_PERSONAJES+5) 		 ;0 MALFARIO 1 FMANAGER
                         CP  0
                         JR  Z,LOPONE_MALFARIO

                       LOPONE_FMANAGER:
                         LD A,(INVENTARIO2)                	 ;PONE EN "B" EL INVENTARIO DEL PERSONAJE ACTIVO
                         LD B,A
                         CP 0
                         JP Z,TXTQUE			         ;TEXTO NO LLEVO NADA
                         SUB 6			                 ;0-1-2  PQ INVENTARIO VALIDO ES 6,7,8,9
                         CP 4
                         JP NC,TXTGUAGUA			 ;NO LO PONGO PQ NO ES OBJETO ADECUADO
					
                         XOR A			                 ;QUITA EL INVENTARIO
                         LD (INVENTARIO2),A
                         JR FIN_LOPONE
					
                       LOPONE_MALFARIO:
                         LD A,(INVENTARIO1)    		         ;PONE EN "B" EL INVENTARIO DEL PERSONAJE ACTIVO
                         LD B,A
                         CP 0
                         JP Z,TXTQUE			         ;TEXTO NO LLEVO NADA
                         SUB 6			                 ;0-1-2  PQ INVENTARIO VALIDO ES 6,7,8,9
                         CP 4
                         JP NC,TXTGUAGUA			 ;NO LO PONGO PQ NO ES OBJETO ADECUADO
					
                         XOR A			                 ;QUITA EL INVENTARIO
                         LD (INVENTARIO1),A
					
                         FIN_LOPONE:


                         LD A,B			                 ;VALOR INVENTARIO
                         LD (IX+0),A
                         CALL TRADUCCION
                         LD (IX+1),A			         ;VALOR PINTASTADO

                         CALL PINTAINVENTARIO_INTERFEIS          ;PARA PINTAR INVENTARIO BORRADO


					TXTGUAYGUAY:	
					LD A,15			;"AHI DEJO ESO"
             				CALL UNAFRASEB
	       				CALL KOLORKAJA
					POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
		        		JP CARGAPANTALLA         ;SALIMOS DEL BUCLE Y CARGAMOS PANTALLA

					TXTGUAGUA:	
	        			LD A,14			;"NO, ESTO ME LO QUEDO"
             				CALL UNAFRASEB
	       				CALL KOLORKAJA
					POP HL                  ;(**) PARA QUE NO SE CORROMPA LA PILA
					JP FINEVENTOSII         ;SALIMOS DEL BUCLE

					TXTQUE:
	        			LD A,16			;"QUE PONGO?"
             				CALL UNAFRASEB
	       				CALL KOLORKAJA
					POP HL                  ;(**) PARA QUE NO SE CORROMPA LA PILA
					JP FINEVENTOSII         ;SALIMOS DEL BUCLE

        
     E_TORNO_TWO:
     CP 16
     JP NZ,MENSAJILLOS


	                LD IX,ETORNO

                        ;1º SI HAY ALGO LO COJO   SI NO LO HAY LO PONGO SI ESTA VACIO EL OTRO HUECO
                        LD A,(IX+0)                            ;LADO IZQUIERDO
                        CP 0                                   ;SI IX+0=0 NO HAY NADA QUE COGER
                        JR Z,LO_PONGO2

              	LO_COJO2:

		        CALL METEINVENTARIO
		        CALL PINTAINVENTARIO_INTERFEIS
		        LD C,3
		        CALL BORRAeTORNO			;BORRAMOS
		        XOR A
		        LD (IX+0),A
		        LD (IX+1),A
		        JP TRUCO_ETORNO       		        ;REUTILIZAMOS RUTINAS COGER OBJETOS


                LO_PONGO2:

                         LD A,(IX+3)                             ;YA HAY ALGO
                         CP 0
                         JP NZ,TXTQUE

                         LD A,(VALORES_PERSONAJES+5) 		 ;0 MALFARIO 1 FMANAGER
                         CP  0
                         JR  Z,LOPONE_MALFARIO2

                       LOPONE_FMANAGER2:
                         LD A,(INVENTARIO2)                	 ;PONE EN "B" EL INVENTARIO DEL PERSONAJE ACTIVO
                         LD B,A
                         CP 0
                         JP Z,TXTQUE			         ;TEXTO NO LLEVO NADA
                         SUB 6			                 ;0-1-2  PQ INVENTARIO VALIDO ES 6,7,8,9
                         CP 4
                         JP NC,TXTGUAGUA			 ;NO LO PONGO PQ NO ES OBJETO ADECUADO
					
                         XOR A			                 ;QUITA EL INVENTARIO
                         LD (INVENTARIO2),A
                         JR FIN_LOPONE2
					
                       LOPONE_MALFARIO2:
                         LD A,(INVENTARIO1)    		         ;PONE EN "B" EL INVENTARIO DEL PERSONAJE ACTIVO
                         LD B,A
                         CP 0
                         JP Z,TXTQUE			         ;TEXTO NO LLEVO NADA
                         SUB 6			                 ;0-1-2  PQ INVENTARIO VALIDO ES 6,7,8,9
                         CP 4
                         JP NC,TXTGUAGUA			 ;NO LO PONGO PQ NO ES OBJETO ADECUADO
					
                         XOR A			                 ;QUITA EL INVENTARIO
                         LD (INVENTARIO1),A
					
                       FIN_LOPONE2:

                         LD A,B			                 ;VALOR INVENTARIO
                         LD (IX+3),A
                         CALL TRADUCCION
                         LD (IX+4),A			         ;VALOR PINTASTADO

                         CALL PINTAINVENTARIO_INTERFEIS          ;PARA PINTAR INVENTARIO BORRADO

                         JP TXTGUAYGUAY

              ;M E N S A J I L L O S   =============================================================================================================
              MENSAJILLOS:
              CP 17
              JP NZ,NAVE_FINAL

	        			LD A,(IX+7)		;Nº MENSAJE
             				CALL UNAFRASEB
	       				CALL KOLORKAJA

                                        LD A,(IX+8)		;Nº MENSAJE
                                        CP 0
                                        JR Z,FINMENSAJILLOS
             				CALL UNAFRASEB
	       				CALL KOLORKAJA

                                        FINMENSAJILLOS:
					POP HL                  ;(**) PARA QUE NO SE CORROMPA LA PILA
					JP FINEVENTOSII         ;SALIMOS DEL BUCLE
					
					
              ;N A V E   F I N A L   =============================================================================================================
              NAVE_FINAL:
              CP 18
              JP NZ,VIDA_EXTRA


                                       CALL EFECTO6

                                       ;ASIGNAMOS PANTALLA FICTICIA PARA QUE NO SALGA CUANDO LLEGUE EL 2º
                                       LD A,250
                                       LD (VALORES_PERSONAJES+2),A

                                       ;INCREMENTAMOS ESTADO 56
                                       LD A,(ESTADOS+56)
                                       INC A
                                       LD (ESTADOS+56),A

                                       ;VEMOS SI VAMOS AL OTRO PERSONAJE O A LA ANIMACION VICTORIOSA
                                       CP 2
                                       JP Z,VICTORIOSSA

                                       POP HL                          ;(**) PARA QUE NO SE CORROMPA LA PILA
                                       LD IX,VALORES_PERSONAJES        ;VOLVEMOS A PONER IX GUACHI
                                       JP TEJEMANEJE_NAVEFINAL         ;CAMBIO PERSONAJE



              ;V I D A    E X T R A   =============================================================================================================
              VIDA_EXTRA:
              CP 19
              JP NZ,discrepa7


                                       
                                       ; COMPROBAMOS NUMERO DE VIDAS QUE TIENES
                                       LD A,(VALORES_PERSONAJES+18)
                                       CP 9
                                       JR NZ,SANEATE

                                       LD A,26			;"YA TIENES MUCHAS"
                                       JR PERO_QUE_ME_DICES

                                       SANEATE:

                                       CALL EFECTO6

                                       ; CAMBIAMOS ESTADO PARA INTERRUPTOR
	        	               LD A,(IX+2)             	;Nº ESTADO ACTIVADOR
                	               CALL PESTADO  		;ENTRADA "A" Nº ESTADO  SALIDA "A" VALOR DE ESTADO "HL" DIRECCION DEL ESTADO, usa "HL" - "BC" - "A"
	        	               LD A,1
                	               LD (HL),A                ;MODIFICAMOS VALOR DEL ESTADO

                                       ;INCREMENTAMOS VIDA
                                       LD A,(VALORES_PERSONAJES+18)
                                       INC A
                                       LD (VALORES_PERSONAJES+18),A

                                      LD A,71
                                      LD (TINTA),A

                                       LD A,(VALORES_PERSONAJES+8)		;A QUIEN LE DAMOS LA VIDA PARA PINTAR EL NUMERO 1-MALFARIO 2-FMANAGER
                                       CP 1
                                       JR Z,COGIO_VIDA_MALFARIO

                                               COGIO_VIDA_FMANAGER:
                                               LD A,(VALORES_PERSONAJES+18)		;Nº VIDAS FMANAGER
                                               LD BC,25				        ;0,25
                                               CALL UNNUMERO
                                               JR GESUELTO

                                               COGIO_VIDA_MALFARIO:
                                               LD A,(VALORES_PERSONAJES+18)		;Nº VIDAS MALFARIO
                                               LD BC,6				        ;0,24
                                               CALL UNNUMERO

                                               GESUELTO:
                                               LD A,27              ;"ME SIENTO MEJOR, GRACIAS"


                                       ;TEXTO
                                       PERO_QUE_ME_DICES:

                                       CALL UNAFRASEB
	       		               CALL KOLORKAJA
			               POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
			               CALL PINTASTADO
			               JP FINEVENTOSII         ;SALIMOS DEL BUCLE


              ;TELETRANPORTE 7 SIN PULSAR -> TOO SE ACTIVA PULSANDO, OJO   =============================================================================================================
              discrepa7:
              CP 7
              JR NZ,COGE_COSAS

                        JP RETRUKKO

              ;COGER OBJETOS QUE NO ES EL DISPARO  =============================================================================================================
              COGE_COSAS:
              CP 69
              JP NZ,FINEVENTOS


;/////////////////////////////  BUCLE EVENTOS: COSAS QUE SUCEDEN SOLO POR ESTAR EN EL SITIO
;//////////////////////////////////////////////////////////////////////////////////
SIN_PULSAR:

              LD A,(IX+6)
              
              ;TELETRANSPORTE SIN PULSAR  ===============================================================================================================
              TELE_SIN:
              CP 7
              JR NZ,GANASTE_FIN              

		      	JP RETRUKKO


	      ;GANASTE Y FIN DEL JUEGO  ======================================================================================================================
              GANASTE_FIN:
              CP 69
              JR NZ,FINEVENTOS
    	      
              ;POP HL                   ;(**) PARA QUE NO SE CORROMPA LA PILA
              ;JP PANTALLICA_VICTORIA_FINAL

BLOQUESIGUIENTE:
POP HL  ;(**)
LD DE,12
ADD HL,DE
JP INICIOEVENTOS


;FIN BUCLE EVENTOS -------------------------------------------------------------------
FINEVENTOS:
POP HL              ;(**) PARA QUE NO SE CORROMPA LA PILA
FINEVENTOSII:




;===============================================================================
;=============================================================================== INVENTARIO
;===============================================================================

LD BC, $DFFE                ; Semifila "P" a "Y"
IN A, (C)                   ; Leemos el puerto
BIT 2, A                    ; Testeamos el bit 2  "I"   --
JP NZ, FIN_G_INVENTARIO     ; Si NO está a 0 (pulsado) salir.


LD A, (VALORES_PERSONAJES+5)
CP 2
JP NC,FIN_G_INVENTARIO		;DESDE UN VEHÍCULO NO PUEDES MANEJAR INVENTARIO

PUSH AF				;(**)

;DIBUJAMOS INTERFEIS INVENTARIO-------------------------------------

	LD BC,1793    	    		;7,1
	LD DE,3848          		;15,8
	LD HL,FONDO_INVENTARIOX
	LD A,255
	CALL RELLENA2D

	LD A,10				;INK 2 PAPER 1 BRIGHT 0
	LD (TINTA),A
	LD BC,5395			;21,19
	LD DE,OTROS_TEXTOS+0		;"INVENTARIO"
	CALL UNAFRASE
	
POP AF				;(**)
CP 0
JR Z,PAINT_MARCAINVENTARIO_MALFARIO


   PAINT_MARCAINVENTARIO_FMANAGER:

       	LD HL,FMANAFER_3X3
	LD (ESPEJO+220),HL
	LD A,(ARMA2)
	JR    EJECUTANDO_MARCAINVENTARIO

   PAINT_MARCAINVENTARIO_MALFARIO:

        LD HL,MALFARIO_3X3
	LD (ESPEJO+220),HL
	LD A,(ARMA1)
	
   EJECUTANDO_MARCAINVENTARIO:

		LD HL,VACIO1X1BR	;PONEMOS TODAS A CERO
		LD (ESPEJO+222),HL
		LD (ESPEJO+224),HL
		LD (ESPEJO+226),HL

	CP 3
	JR Z,LASTRESARMAS
	CP 2
	JR Z,LASDOSARMAS
	CP 1
	JR Z,UNASOLAARMA
	JR ALE_VENGGA

		LASTRESARMAS:
		LD HL,ARMAX+0
		LD (ESPEJO+222),HL
		LD HL,ARMAX+11
		LD (ESPEJO+224),HL
		LD HL,ARMAX+22
		LD (ESPEJO+226),HL
		JR ALE_VENGGA

		LASDOSARMAS:
		LD HL,ARMAX+0
		LD (ESPEJO+222),HL
		LD HL,ARMAX+11
		LD (ESPEJO+224),HL
		JR ALE_VENGGA

		UNASOLAARMA:
		LD HL,ARMAX+0
		LD (ESPEJO+222),HL

		ALE_VENGGA:

	LD BC,4866			;19,2
	LD DE,(ESPEJO+220)
	LD A,255
	CALL DIBUJA
	LD BC,5382			;21,6
	LD DE,(ESPEJO+222)
	LD A,255
	CALL DIBUJA
	LD BC,5384			;21,8
	LD DE,(ESPEJO+224)
	LD A,255
	CALL DIBUJA
	LD BC,5386			;21,10
	LD DE,(ESPEJO+226)
	LD A,255
	CALL DIBUJA

	CALL PINTAINVENTARIO
	CALL PAUSADE10           ;¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡ SUSTITUIR POR FX

;FIN DIBUJAMOS INTERFEIS INVENTARIO-------------------------------------

        CALL EFECTO8

	MINI_BUCLE_INVENTARIO:

	TECLAO_INV:
        LD BC, $DFFE         ; SEMIFILA Y - P
        IN A, (C)            ; LEER PUERTO
        BIT 1, A             ; COMPROBAR BIT 1 "O"
        JR NZ, TECLAP_INV        ; SI NO ESTÁ PULSADO VAMOS A TECLA "P"
        ;HAS PULSADO "O" ENTONCES:

                CALL EFECTO8

		LD HL,(JORCAS)
		LD DE,(JORCAS)
		LD A,(HL)
		;LD (GUDAR),A	;GUARDAMOS VALOR CERO
		INC HL
 		;DE YA ESTA
		LD BC,7
		LDIR
		DEC HL
		;LD A,(GUDAR)
		LD (HL),A
		CALL PINTAINVENTARIO
		CALL PINTAINVENTARIO_INTERFEIS
	        CALL PAUSADE10             ;SUSTITUIR POR FX ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
        	JR NOTECLA_INV

	TECLAP_INV:
        LD BC, $DFFE         ; SEMIFILA Y - P
        IN A, (C)            ; LEER PUERTO
        BIT 0, A             ; COMPROBAR BIT 0 "P"
        JR NZ, NOTECLA_INV        ; SI NO ESTÁ PULSADO VAMOS A TECLA "Q"
        ;HAS PULSADO "P" ENTONCES:


                CALL EFECTO8

		LD HL,(JORCAS)
		LD BC,6
		ADD HL,BC
		PUSH HL
		POP DE
		INC DE
		LD A,(DE)
		;LD (GUDAR),A
		LD BC,7
		LDDR
		LD HL,(JORCAS)
		LD (HL),A
		CALL PINTAINVENTARIO
		CALL PINTAINVENTARIO_INTERFEIS
	        CALL PAUSADE10             ;SUSTITUIR POR FX ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡

	NOTECLA_INV:
	; AQUI UNA ANIMACIÓN CHULIGUAY¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡

        ;LD BC, $FBFE         		; SEMIFILA T - Q
        ;IN A, (C)            		; LEER PUERTO
        ;BIT 2, A            		; COMPROBAR BIT 2 "E"
        LD BC, $DFFE                ; Semifila "P" a "Y"
        IN A, (C)                   ; Leemos el puerto
        BIT 2, A                    ; Testeamos el bit 2  "I"   --
        JP NZ, MINI_BUCLE_INVENTARIO    ; SI NO ESTÁ PULSADO CERRAMOS BUCLE

        CALL EFECTO3
        ;HAS PULSADO "E" ENTONCES:
	;EFECTILLO ¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡
	CALL BORRA_CAJA
	JP CARGAPANTALLA

FIN_G_INVENTARIO:

;===============================================================================
;=============================================================================== MALOS
;===============================================================================


LD IX,ORDA_MALOTES
LD A,(IX+0)
CP 0
JP Z,FINMALOS			; SI NO HAY MALOTES PASAMOS


;CONTADOR_MALOS			;SOLO SE MUEVEN 1 DE CADA 5 CICLOS

LD A,(CONTADOR_MALOS)
INC A
LD (CONTADOR_MALOS),A
CP 3
JP NZ,FINMALOS
XOR A
LD (CONTADOR_MALOS),A


LD A,(ESPRITADOR_MALOS)		;VAMOS A VER COMO QUEDA ALTERNANDO, SI DEMASIADO RÁPIDO PON CONTADOR
XOR 1				;1-> 0    0 -> 1    GESTION DE SPRITES
LD (ESPRITADOR_MALOS),A

LD A,3
LD (ESPEJO+200),A
MALOTEANDO:

;0º SI ESTAS MUERTO PASO DE TI
	LD A,(IX+10)				;VIDA
	CP 0	
	JP Z,ZZIGUIENTE_MALO

;1º ASIGNAMOS PATRON					
					
	LD A,(IX+6)				;CONTADOR PATRON		
	CP 0					
	CALL Z,ASIGNAPATRON			;ASIGNAMOS PATRON SI CONTADOR=0	, DA VALOR A IX+6, IX+7 y IX+8	

;2º BORRAMOS POSICION ACTUAL
	LD B,(IX+0)
	LD C,(IX+1)
	LD A,71
	LD HL,VACIO1X1
	CALL HR1X1B

;3º MODIFICAMOS COORDENADAS - TIENE EN CUENTA CAMBIO DE CARACTER Y COLOR FONDO
	LD H,(IX+8)
	LD L,(IX+7)
	JP (HL)

;4º SELECCION DE FOTOGRAMA SPRITE
	SELEKTA_FOTOGRAMA:
	LD A,(ESPRITADOR_MALOS)		;VAMOS A VER COMO QUEDA ALTERNANDO, SI DEMASIADO RÁPIDO PON CONTADOR
	;XOR 1				;1-> 0    0 -> 1
	;LD (ESPRITADOR_MALOS),A
	SLA A
	SLA A
	SLA A				;X8    ->   VALE 0 O VALE 8
	LD D,0
	LD E,A
	LD H,(IX+5)
	LD L,(IX+4)
	ADD HL,DE

;5º PINTANDOLO
	LD B,(IX+0)
	LD C,(IX+1)
	LD A,(IX+9)
	CALL HR1X1B

;6º CONTADOR PATRON
        DEC (IX+6)

ZZIGUIENTE_MALO:
LD BC,11
ADD IX,BC

LD A,(ESPEJO+200)
DEC A
LD (ESPEJO+200),A
CP 0
JP NZ,MALOTEANDO

FINMALOS:


;===============================================================================
;=============================================================================== BALAS CARACTER A CARACTER
;===============================================================================

LD IX,METEORO

LD A,(IX+0)
CP 0
JP Z,FIN_METEOROS

LD A,6
;LD B,6
BUCLEMETEORO:
;PUSH BC
PUSH AF

	;HAY BALA?
	LD A,(IX+0)
	CP 0
	JR NZ,PUESI_LAHAY

	POP BC
	JP FIN_METEOROS

	PUESI_LAHAY:
	
		;CONTADOR VELOCIDAD
		INC (IX+6)
		LD A,(IX+6)
		CP (IX+7)
		JR NZ,SIGUIENTE_BALA
		XOR A
		LD (IX+6),A

		;1º BORRAMOS BALA
		LD B,(IX+2)
		LD C,(IX+3)
		CALL HR1X1BORRA		;BORRA SIN ATRIBUTOS EN HR

		;2º MODIFICAMOS AVANCE

		INC (IX+8)		;CONTADOR AVANCE
                LD A,(IX+8)
		CP (IX+9)		;COMPARAMOS CON RECORRIDO
		JR NZ, NO_ERA_LIMITE		
			
			XOR A
			LD (IX+8),A	;CONTADOR AVANCE A CERO

     			LD A,(IX+0)	;INICIAMOS COORDENADAS
     			LD (IX+2),A
     			LD A,(IX+1)
   			LD (IX+3),A
			JR EA_YAPINTAS

		;3º MODIFICAMOS COORDENADAS
		NO_ERA_LIMITE:
		LD A,(IX+2)		;Y
		ADD A,(IX+4)
		LD (IX+2),A
		LD A,(IX+3)		;X
		ADD A,(IX+5)
		LD (IX+3),A

		;4º PINTAMOS
		EA_YAPINTAS:

		LD B,(IX+2)
		LD C,(IX+3)
		LD H,(IX+11)
		LD L,(IX+10)
		CALL HR1X1BS

		;5º DETECTA ACIERTO

		LD A,(VALORES_PERSONAJES+5)	;QUIEN
		CP 3
		JR Z,SIGUIENTE_BALA		;SI VA EN ROBOT ESTA BALA NO MATA, QUITAR VIDA SEGUN IX+8 BUENOS

		LD A,(VALORES_PERSONAJES+0)	;ACIERTO EN LA Y
		SUB (IX+2)
		ADD A,7
		CP 15
		JR NC,SIGUIENTE_BALA		;NO HAY ACIERTO

		LD A,(VALORES_PERSONAJES+1)	;ACIERTO EN LA X
		SUB (IX+3)
		ADD A,7
		CP 15
		JR NC,SIGUIENTE_BALA		;NO HAY ACIERTO

			;SI HAY ACIERTO, LA MUERTE POR ESTAS BALAS TE QUITAN MUCHA VIDA Y PROVOCAN CARGAPANTALLA			
			JP MUERTExBALAMETEORO

		SIGUIENTE_BALA:
		LD BC,12
		ADD IX,BC	

;POP BC
POP AF
DEC A
CP 0
JP NZ,BUCLEMETEORO
;DJNZ BUCLEMETEORO

FIN_METEOROS:

;===============================================================================
;=============================================================================== GPS MUNDO INFINITO
;===============================================================================

;SI ESTADO 28=1 Y ESTAMOS EN MUNDO DESIERTO INFINITO ENTONCES LO ACTIVO

LD A,(DESIERTO1)	
CP 1
JP NZ,FIN_GPS			;NO ESTAS EN DESIERTO

LD A,(ESTADOS+28)		;NO TIENES GPS
CP 1
JP NZ,FIN_GPS

;-> ESTAMOS EN GUAY 60,60 -> TAMPOCO PINTAMOS
LD A,(COORD_DESERT+0)
CP 60
JR NZ, yenciudad
LD A,(COORD_DESERT+1)
CP 60
JP NZ,yenciudad

	LD DE,GEPESECERRADO
	JR PINTANDO_GPS

;-> ESTAMOS EN GUAY 80,85 -> TAMPOCO PINTAMOS
yenciudad:
LD A,(COORD_DESERT+0)
CP 70 ;80
JR NZ, GEPESEON
LD A,(COORD_DESERT+1)
CP 75  ;85
JP NZ,GEPESEON

	LD DE,GEPESECERRADO
	JR PINTANDO_GPS

;-> PINTAMOS GEPESE
GEPESEON:


	;ASIGNAMOS DESTINO SEGUN HAYAMOS COGIDO BOLA CIUDAD PERDIDA O NO:

	LD A,(ESTADOS+12)		;BOLA CIUDAD PERDIDA
	CP 1
	JR Z,VUELVES_DESIERTO

	VAS_DESIERTO:
	LD D,70			;Y OBJETIVO    80
	LD E,75			;X OBJETIVO    85
	JR FIN_VUELVES

	VUELVES_DESIERTO:
	LD D,60			;Y OBJETIVO
	LD E,60			;X OBJETIVO
	FIN_VUELVES:


LD A,(COORD_DESERT+0)		;ESTUDIO EJEY
SUB D															
CALL absA			;VALOR ABSOLUTO DE A. SOLO USA "A"											
LD B,A				;DISTANCIA EN EJE Y											
																		
LD A,(COORD_DESERT+1)		;ESTUDIO EJEX																
SUB E																	
CALL absA			;VALOR ABSOLUTO DE A // DISTANCIA EJE X											

CP B
JR C,PINTA_EJEY

	PINTA_EJEX:			
		LD A,(COORD_DESERT+1)			
		CP E			
		JR C,GPS3			
			
		GPS4:			
		LD DE,GEPESE+114   ;IZQUIERDA GEPESE	
		JR PINTANDO_GPS

		GPS3:
		LD DE,GEPESE+76    ;DERECHA GEPESE	 
		JR PINTANDO_GPS

	PINTA_EJEY:	
		LD A,(COORD_DESERT+0)	
		CP D	
		JR C,GPS1	
	
		GPS2:	
		LD DE,GEPESE+38   ;ABAJO GEPESE	
		JR PINTANDO_GPS

		GPS1:	
		LD DE,GEPESE+0    ;ARRIBA GEPESE

	PINTANDO_GPS:

		LD BC,271	   ;1,15
		;LD DE,
		LD A,255
		CALL DIBUJA

FIN_GPS:

;===============================================================================
;=============================================================================== ACTIVAR BALAS
;===============================================================================

;ACTIVAR DISPARO BUENO...

	LD A,(RETARDOBALA)
	CP 0
	JR Z,TECLAM

        DEC A			;SI RETARDO NO ES IGUAL A AECRO NO PUEDES ACTIVAR NADA PARA EVITAR DISPAROS SEGUIDOS
	LD (RETARDOBALA),A
	JP ALOSMALOTES


      TECLAM:
      LD BC, $7FFE         ; SEMIFILA B - SPACE
      IN A, (C)            ; LEER PUERTO
      BIT 2, A             ; COMPROBAR BIT 2 "M"
      JP NZ, ALOSMALOTES   ; SI NO ESTÁ PULSADO VAMOS A ACTIVACION DISPAROS MALOTES
      ;HAS PULSADO "M", ENTONCES...


	;QUIEN ERES TU'
	LD A,(VALORES_PERSONAJES+5)		;ES...
	CP 2
	JP NC,ALOSMALOTES	;LOS VEHÍCULOS NO DISPARAN, SORRY


	;LLEVAS ARMA?
	CP 0			
	JR Z,MALFARIOYSUARMA

		FMANAGERYSUARMA:
		LD A,(ARMA2)
		LD D,A			;GUARDAMOS ARMA PARA SACAR DAÑO Y ALCANCE
		CP 0
		JP Z,ALOSMALOTES	;NO LLEVAS ARMA AUN
		JR ACTIVA_DISP_BUENO

		MALFARIOYSUARMA:	
		LD A,(ARMA1)
		LD D,A			;GUARDAMOS ARMA PARA SACAR DAÑO Y ALCANCE
		CP 0
		JP Z,ALOSMALOTES	;NOLLEVAS ARMA AUN

		;ACTIVAR DISPARO
		ACTIVA_DISP_BUENO:	

		LD IX,BALAX		;1º BALA
		LD A,(IX+0)		
		CP 0
		JR Z,SI_QUE_PUEDO_ACTIVAR		

		LD IX,BALAX+6		;2º BALA
		LD A,(IX+0)		
		CP 0
		JR NZ,ALOSMALOTES		

		SI_QUE_PUEDO_ACTIVAR:
		
		LD A,D			;TIPO DE ARMA = 1, 2, 3
		DEC A
		SLA A
		LD D,0
		LD E,A
		LD HL,TABLA_ARMA
		ADD HL,DE
		LD A,(HL)
		LD (IX+3),A		;DAÑO
		INC HL
		LD A,(HL)
		LD (IX+4),A		;ALCANCE

		LD A,1
		LD (IX+5),A		;DISPARA EL BUENO (PARA RUTINAS ACIERTOS)

		LD A,5
		LD (RETARDOBALA),A	;ACTIVAMOS RETARDOBALA

		LD A,(VALORES_PERSONAJES+3)	;SENTIDO DEL ACTIVO, DAMOS VALORES YX Y SENTIDO BALA
                LD B,A                          ;(LO GUARDO **)

                CP 1
                JR Z,ESUNO1
                CP 2
                JR Z,ESDOS2
                CP 3
                JR Z,ESTRES3
                ESCUATRO4:
                           LD A,(VALORES_PERSONAJES+1)
                           CP 18
                           JR C,DEMASIAO_CERCA
                LD D,3
                LD E,-3
              	JR FINEW
                ESUNO1:
                           LD A,(VALORES_PERSONAJES+0)
                           CP 62
                           JR C,DEMASIAO_CERCA
                LD D,-3
                LD E,3
                JR FINEW
                ESDOS2:
                           LD A,(VALORES_PERSONAJES+0)
                           CP 172
                           JR NC,DEMASIAO_CERCA
                LD D,10
                LD E,3
                JR FINEW
                ESTRES3:
                LD D,3
                LD E,10
                           LD A,(VALORES_PERSONAJES+1)
                           CP 236
                           JR NC,DEMASIAO_CERCA
                FINEW:
		LD (IX+2),B			;SENTIDO ESTABA EN B (LO GUARDÉ **)
                LD A,(VALORES_PERSONAJES+0)
                ADD A,D
                LD (IX+0),A			;Y BALA
                LD A,(VALORES_PERSONAJES+1)
                ADD A,E
                LD (IX+1),A			;X BALA

                DEMASIAO_CERCA:
                CALL BIP

;ACTIVAR DISPAROS DE MALOTES
ALOSMALOTES:



PUSH IY
LD IY,ORDA_MALOTES+0				;1º MALO
LD IX,BALAX+12					;DIRECCION BALA DEL 1º MALO
CALL GATILLO_MALO

LD IY,ORDA_MALOTES+11			        ;2º MALO
LD IX,BALAX+18					;DIRECCION BALA DEL 2º MALO
CALL GATILLO_MALO

LD IY,ORDA_MALOTES+22			        ;3º MALO
LD IX,BALAX+24					;DIRECCION BALA DEL 3º MALO
CALL GATILLO_MALO
POP IY


;===============================================================================
;=============================================================================== BALAS DISPAROS
;===============================================================================

LD IX,BALAX
LD B,5
BUCLEBALAX:
PUSH BC

;0º SI IX+0=0 SIGUIENTE					
	LD A,(IX+0)
	CP 0
	JP Z,XIGUIENTEBALAX				
					
;1º BORRAMOS PIXEL
	LD B,(IX+0)				
	LD C,(IX+1)				
	CALL JBPLOT0				
					
;2º DECREMENTAMOS ALCANCE					
	DEC (IX+4)
        LD A,(IX+4)
	CP 0				
	JP Z,EXPLOXION			;EXPLOSION DEBE HACER IX+0=0 CONSERVAR IX Y RETORNAR A SIGUIENTE BALA	
					
;3º INCREMENTAMOS COORDENADAS					
					
	LD A,(IX+2)			;MÁS RÁPIDO QUE SUMAR AMBAS COORDENADAS	
	CP 3				
	JR Z, BALADER				
	CP 4				
	JR Z,BALAIZQ				
	CP 2				
	JR Z,BALABAJO				
					
	BALARRIBA:				
	DEC (IX+0)
	DEC (IX+0)
	JP BALAYAMOD
	BALADER:
	INC (IX+1)
	INC (IX+1)
	JP BALAYAMOD
	BALAIZQ:
	DEC (IX+1)
	DEC (IX+1)
	JP BALAYAMOD
	BALABAJO:
	INC (IX+0)
	INC (IX+0)
	BALAYAMOD:
					
;4º DETECTAMOS CHOQUE					
					
	LD B,(IX+0)				
	LD C,(IX+1)				
	CALL JBPOINT				
	CP 1				
	JP Z,AXIERTO			;AXIERTO DEBE HACER IX+0=0 CONSERVAR IX Y RETORNAR A SIGUIENTE BALA	
					
;5º PINTAMOS BALA					
					
	LD B,(IX+0)				
	LD C,(IX+1)				
	CALL JBPLOT1				
					
;6º SIGUIENTE BALA
	
	XIGUIENTEBALAX:
	LD BC,6				
	ADD IX,BC				

POP BC
DJNZ BUCLEBALAX




;===============================================================================
;===============================================================================
;===============================================================================



HALT
HALT
;HALT



JP BUCLE_PRINCIPAL

