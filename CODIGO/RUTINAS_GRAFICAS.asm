;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; RUTINAS GRÁFICAS   JBGV   ----   VERSION VERANO 2015
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*



;LD A,6
;LD (23695),A      ;COLOR DRAW
;DRAWING:
;LD BC, ALTO , LARGO
;DE=0        0,0
;DE=256      1,0
;DE=1        0,1
;DE=257      1,1
;DE=511      1,-1
;DE=65281    -1,1
;DE=65535    -1,-1
;DE=65280    -1,0
;DE=255      0,-1
;LD DE, 1/-1 , 1/-1
;COORDS  23677 X   23678 Y   (OJO DE 0 A 175)
;CALL 9402

;PLOTEO:
;XOR A             ;OVER 0
;LD (23697),A

;LD B,Y
;LD C,X
;CALL #22E5




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;                               ++++ COLOREA ++++
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;CAMBIA COLOR A UNA ZONA DE PANTALLA BR

;ENTRADA          B - (Y)
;                 C - (X)
;                 D - (LARGO)
;                 E - (BAJO)
;                 A - (ATRIBUTO)

COLOREA:

LD (GUARDACOLOR),A
CALL TRIBUTOS                          ;ENTRADA "BC" SALIDA "HL" DIRECCION ATRIBUTOS  -- NO USA "DE"

COLOREAIN:                             ;PARA LLAMAR A LA RUTINA DESDE OTRAS RUTINAS DE PINTAR

LD A,(GUARDACOLOR)                     ;RECUPERAMOS EN A EL COLOR

LD B,E                                 ;BUCLE "BAJO"
PARALLI:
PUSH BC

PUSH HL                                ;GUARDAMOS HL PARA SUMARLE LUEGO 32 AL BAJAR FILA

LD B,D                                 ;BUCLE "LARGO"
PARALLA:
LD (HL),A
INC HL
DJNZ PARALLA

POP HL                                 ;BAJAMOS FILA
LD BC,32
ADD HL,BC

POP BC
DJNZ PARALLI

RET



;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;                               ++++ RELLENA ++++
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;RELLENA UNA ZONA DE PANTALLA CON MISMO PATRÓN 1X1

P1;ENTRADA          B - (Y)
;                 C - (X)
;                 D - (LARGO)
;                 E - (BAJO)
;                 A - (ATRIBUTO)
;                 HL- SPRITE

RELLENA:

LD (GUARDACOLOR),A                     ;GUARDAMOS COLOR
PUSH HL                                ;GUARDAMOS ESPRITE (---1)
LD A,D
LD (LARGO),A
LD A,E
LD (BAJO),A
POP DE                                 ;SACAMOS ESPRITE (---1)
CALL RESIDENCIA                        ;NO USA "DE"
LD (GUARDADIRECCION),HL                ;GUARDAMOS PRIMERA DIRECCIÓN PARA USAR LUEGO EN ATRIBUTOS


LD A,(BAJO)
LD B,A                                 ;BAJO
TORICO:
PUSH BC

PUSH HL                                ;GUARDAMOS 1º DIRECCION LINEA DE CUADRADITOS (---2)


     LD A,(LARGO)
     LD B,A                            ;LARGO
     AMBELES:
     PUSH BC

          PUSH DE
          PUSH HL

          LD B,8                       ;PINTAR CUADRADITO
          AINSAS:
          LD A,(DE)
          LD (HL),A
          INC H
          INC DE
          DJNZ AINSAS

          POP HL
          POP DE
          INC HL

     POP BC
     DJNZ AMBELES


POP HL                                 ;SACAMOS PRIMERA DIRECCION DE LA LINEA DE CRADRADITOS (---2)
CALL EMPANADA                          ;BAJAMOS


POP BC
DJNZ TORICO

;++ ATRIBUTOS

LD A,(LARGO)
LD D,A
LD A,(BAJO)
LD E,A
LD HL,(GUARDADIRECCION)
CALL RESIDENCIATRIBUTO
LD A,(GUARDACOLOR)
CALL COLOREAIN

RET




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;                               ++++ DIBUJA ++++
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;DIBUJA UN SPRITE DE TAMAÑO DEFINIDO EN LOS DEFBS (X/Y - DATOS - ATRIBUTOS).
;SI ATRIBUTO=255 COLOREARÁ SEGÚN DEFB, 254 SEGÚN DEFB ALTERNATIVO,  EN CASO CONTRARIO EL ATRIBUTO DEFINIDO.

;ENTRADA          B - (Y)
;                 C - (X)
;                 A - (ATRIBUTO)
;                 DE- SPRITE

DIBUJA:


LD (GUARDACOLOR),A                     ;GUARDAMOS COLOR
LD A,(DE)
LD (LARGO),A                           ;GUARDAMOS LARGO
INC DE
LD A,(DE)
LD (BAJO),A                            ;GUARDAMOS BAJO
INC DE                                 ;DEJAMOS DE AL INICIO DATOS DIBUJO ESPRITE
CALL RESIDENCIA
LD (GUARDADIRECCION),HL                ;GUARDAMOS PRIMERA DIRECCIÓN PARA USAR LUEGO EN ATRIBUTOS

LD A,(BAJO)
LD B,A                                 ;Nº DE CARACTERES HACIA ABAJO
PINSAPO:
PUSH BC

LD B,8                                 ;LOS 8 SCANLINES DEL CARACTER
PINUS:
PUSH BC

PUSH HL

LD A,(LARGO)
LD B,A                                 ;DIBUJAR SCANLINE A LO LARGO
NERIUM:
LD A, (DE)                             ;TOMAMOS DATO DEL SPRITE
LD (HL), A                             ;ESTABLECEMOS VALOR EN VIDEOMEMORIA
INC HL
INC DE
DJNZ NERIUM

POP HL
INC H

POP BC
DJNZ PINUS

LD A, L
ADD A, 32
LD L, A
JR C, CARACTER_ABAJO3
LD A, H
SUB 8
LD H, A
CARACTER_ABAJO3:

POP BC
DJNZ PINSAPO

;++ ATRIBUTOS

LD  HL,(GUARDADIRECCION)               ;SACO LA 1º DIRECCION DE DIBUJO GUARDADA TEMPORALMENTE
CALL RESIDENCIATRIBUTO                 ;OBTENGO 1º DIRECCION DE ATRIBUTOS
LD (GUARDADIRECCION),HL                ;LA CONSERVO PARA LUEGO BAJAR SIGUIENTE FILA

LD A,(GUARDACOLOR)                         ;SACO ATRIBUTO Y COMPARO CON 253, SI HAY CARRY COLOREO TODO DEL COLOR INDICADO.
CP 253
JR C,ELCOLORQUEDICES

CP 255
JR Z,COLORES_PRIMARIOS

COLORES_SECUNDARIOS:

     PUSH HL         ;GUARDO DIRECCION ATRIBUTOS
     PUSH DE
     LD A,(LARGO)
     LD D,A
     LD A,(BAJO)
     LD E,A
     CALL Multiply   ; this routine performs the operation HL=D*E
     POP DE
     ADD HL,DE
     EX DE,HL       ;YA TENGO VALORES A TRIBUTOS DE COLORES ALTERNATIVOS
     POP HL          ;VUELVO A SACAR DIRECCION DE ATRIBUTOS


COLORES_PRIMARIOS:

LD A,(BAJO)
LD B,A                                 ;Nº DE CARACTERES HACIA ABAJO
ROSMARINUS:
PUSH BC

LD A,(LARGO)
LD B,A                                 ;Nº DE CARACTERES A LO LARGO
TAXUS:
LD A,(DE)                              ;COJO COLOR DEL CARACTER
LD (HL), A                             ;ESTABLECEMOS VALOR EN ATRIBUTOS
INC HL
INC DE
DJNZ TAXUS

LD HL,(GUARDADIRECCION)                          ;BAJAMOS A SIGUIENTE FILA DE ATRIBUTOS
LD BC,32
ADD HL,BC
LD (GUARDADIRECCION),HL

POP BC
DJNZ ROSMARINUS
JR SACABOELCOLOR

ELCOLORQUEDICES:

LD A,(LARGO)                           ;USAMOS LA RUTINA "COLOREARIN" QUE ESTÁ DENTRO DE LA RUTINA "COLOREAR"
LD D,A
LD A,(BAJO)
LD E,A
LD A,(GUARDACOLOR)
CALL COLOREAIN

SACABOELCOLOR:

RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;                               ++++ RELLENA2D ++++
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;RELLENA UNA ZONA DE PANTALLA REPITIENDO SPRITE DE DIMENSIONES INCLUIDAS EN DEFB

;ENTRADA          B - (Y)
;                 C - (X)
;                 D - Nº DE REPETICIONES A LO LARGO  (*) NO ES NUMERO DE CARACTERES !!
;                 E - Nº DE REPETICIONES A LO BAJO   (*) NO ES NUMERO DE CARACTERES !!
;                 A - (ATRIBUTO)
;                 HL- SPRITE

RELLENA2D:

LD (GUARDACOLOR),A                         ;GUARDAMOS COLOR
LD A,D
LD (REPITEX),A                         ;GUARDAMOS Nº DE REPETICIONES HORIZONTALES
LD A,E
LD (REPITEY),A                         ;GUARDAMOS Nº DE REPETICIONES VERTICALES
LD (ESPRITE),HL                        ;GUARDAMOS ESPRITE
LD A,(HL)
LD (DIMREPITEX),A                      ;GUARDAMOS DIMENSION X DEL SPRITE A REPETIR
INC HL
LD A,(HL)
LD (DIMREPITEY),A                      ;GUARDAMOS DIMENSION Y DEL SPRITE A REPETIR
LD A,B
LD (YGRIEGA),A                         ;GUARDAMOS Y INICIAL
LD A,C
LD (EQUIS),A                           ;GUARDAMOS Z INICIAL 2 VECES
LD (EQUIS2),A

LD A,(REPITEY)             ;DIBUJAMOS HACIA ABAJO
LD B,A
BABALIBA:
PUSH BC

LD A,(REPITEX)              ;DIBUJAMOS A LO LARGO
LD B,A
SAIMAZOON:
PUSH BC

LD A,(YGRIEGA)
LD B,A                      ;ENTRADA          B - (Y)
LD A,(EQUIS)                ;                 C - (X)
LD C,A                      ;                 A - (ATRIBUTO)
LD A,(GUARDACOLOR)              ;                 DE- SPRITE
LD HL,(ESPRITE)
EX DE,HL
CALL DIBUJA                 ;DIBUJO ESPRITE

LD A,(DIMREPITEX)           ;AVANZAMOS LA EQUIS HACIA LA DERECHA
LD B,A
LD A,(EQUIS)
ADD A,B
LD (EQUIS),A

POP BC
DJNZ SAIMAZOON

LD A,(EQUIS2)
LD (EQUIS),A                ;RESTAURAMOS VALOR DE "EQUIS" PARA LA FILA SIGUIENTE

LD A,(DIMREPITEY)           ;AVANZAMOS LA YGRIEGA HACIA ABAJO
LD B,A
LD A,(YGRIEGA)
ADD A,B
LD (YGRIEGA),A

POP BC
DJNZ BABALIBA

RET





;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;  ++++ HR2X2B ++++   SIN XOR  CON ATRIBUTOS    PARA GUARDIANES
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;DIBUJA UN SPRITE DE TAMAÑO 2X2 SIN XOR

HR2X2B:
LD (GUARDACOLOR),A                     ;GUARDAMOS COLOR

LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY", DESPLAZAMIENTO DE X EN "VITPOSX" OBTENIDO EN RUTINA COLOCAR
LD (VITPOSY),A
PUSH HL                                ;GUARDAMOS ESPRITE (***)
CALL COLOCAR
LD (GUARDADIRECCION),HL                ;GUARDO EN HUCHA PARA LUEGO USARLO AL BAJAR FILAS
CALL RESIDENCIATRIBUTO                 ;OBTENEMOS HL DE ATRIBUTOS
LD (DIRTEMPORAL),HL                    ;LA GUARDO PARA USARLA EN ATRIBUTOS

POP HL                                 ;SACAMOS ESPRITE (**)

LD B,16                                ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
MORA:                                  ;PUNTO DE BUCLE "C"
PUSH BC

LD D,(HL)                              ;DATO DEL ESPRITE
INC HL
LD E,(HL)
INC HL
PUSH HL                                ;GUARDAMOS POSICION SPRITE

LD A,(VITPOSX)
CP 0
JP Z,MORASINDESP

;INC A
LD B,A                                 ;BUCLE DESPLAZAMIENTO
XOR A                                  ;LIMPIO A & CARRY a CERO

MORADESPLAZAMIENTO:
RR D                                   ;ROTO 1º CARÁCTER
RR E                                   ;ROTO 2º CARACTER
RR A                                   ;ROTO 3º CARACTER
DJNZ MORADESPLAZAMIENTO

LD HL,(GUARDADIRECCION)                          ;SACO DIRECCION A PINTAR
LD (HL),D                              ;PINTO D
INC HL
LD (HL),E                              ;PINTO E
INC HL
LD (HL),A                              ;PINTO A

DEC HL
FIIIII:
DEC HL
CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN
LD (GUARDADIRECCION),HL                          ;GUARDAMOS DIRECCIÓN EN HUCHA

POP HL                                 ;SACAMOS DIRECCION ESPRITE

POP BC
DJNZ MORA                             ;SI NO ES CERO ES QUE HAY QUE SEGUIR PINTANDO

;++ ATRIBUTOS

LD HL,(DIRTEMPORAL)

LD E,2                                    ;PONEMOS VALOR A D/E Y USAMOS RUTINA COLOREA
LD A,(VITPOSY)
CP 0
JR Z,CAGU2W3
INC E
CAGU2W3:

LD D,2
LD A,(VITPOSX)
CP 0
JR Z,CAGUW3
INC D
CAGUW3:

JP COLOREAIN


MORASINDESP:
LD HL,(GUARDADIRECCION)
LD (HL),D                              ;PINTO D
INC HL
LD (HL),E                              ;PINTO E
JR FIIIII



;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;  ++++ HR1X1B ++++   SIN XOR  CON ATRIBUTOS
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


;DIBUJA UN SPRITE DE TAMAÑO 1X1 EN HR SIN XOR

;ENTRADA          B - (Y)
;                 C - (X)
;                 A - (ATRIBUTO)
;                 HL- SPRITE

HR1X1B:


LD (GUARDACOLOR),A                     ;GUARDAMOS COLOR
LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY" , "VITPOSX" SE GUARDA APROVENCHANDO LA RUTINA "COLOCAR"
LD (VITPOSY),A
PUSH HL                                ;GUARDAMOS ESPRITE (**)
CALL COLOCAR
LD (GUARDADIRECCION),HL                ;GUARDO EN HUCHA PARA LUEGO USARLO AL BAJAR FILAS
CALL RESIDENCIATRIBUTO                 ;OBTENEMOS HL DE ATRIBUTOS
LD (DIRTEMPORAL),HL                    ;LA GUARDO PARA USARLA EN JUEGO

POP HL                                 ;SACAMOS EL SPRITE (**)

LD B,8                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILAS:                              ;PUNTO DE BUCLE "C"
PUSH BC

   LD D,(HL)                              ;DATO DEL ESPRITE
   INC HL
   PUSH HL                                ;GUARDAMOS POSICION SPRITE     -----

   LD A,(VITPOSX)                         ;CARGADO EN RUTINA "COLOCAR"
   CP 0
   JR Z,AGSINDESPB

   ;INC A
   LD B,A                                 ;BUCLE DESPLAZAMIENTO
   XOR A                                  ;LIMPIO A & CARRY a CERO

   AGDESPLAZAMIENTOB:
   RR D                                   ;ROTO 1º CARÁCTER
   RR A                                   ;ROTO 2º CARACTER
   DJNZ AGDESPLAZAMIENTOB

   LD HL,(GUARDADIRECCION)                          ;SACO DIRECCION A PINTAR
   LD (HL),D                              ;PINTO D
   INC HL
   LD (HL),A                              ;PINTO A

   DEC HL
   FFIINN:
   CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN
   LD (GUARDADIRECCION),HL                ;GUARDAMOS DIRECCIÓN EN HUCHA

   POP HL                                 ;SACAMOS DIRECCION ESPRITE     -----

POP BC
DJNZ OCHOFILAS


;++ ATRIBUTOS

LD HL,(DIRTEMPORAL)

LD E,1                                    ;PONEMOS VALOR A D/E Y USAMOS RUTINA COLOREA
LD A,(VITPOSY)
CP 0
JR Z,CAGU2W2
INC E
CAGU2W2:

LD D,1
LD A,(VITPOSX)
CP 0
JR Z,CAGUW2
INC D
CAGUW2:

JP COLOREAIN

;--------

AGSINDESPB:
LD HL,(GUARDADIRECCION)                ;SACO DIRECCION A PINTAR
LD (HL),D                              ;PINTO D
JR FFIINN




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;  ++++ HR1X1BORRA ++++   BORRA SIN ATRIBUTOS EN HR 1X1
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


;BORRA UN SPRITE DE TAMAÑO 1X1 EN HR 

;ENTRADA          B - (Y)
;                 C - (X)

HR1X1BORRA:



LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY" , "VITPOSX" SE GUARDA APROVENCHANDO LA RUTINA "COLOCAR"
LD (VITPOSY),A

CALL COLOCAR
;LD (GUARDADIRECCION),HL                ;GUARDO EN HUCHA PARA LUEGO USARLO AL BAJAR FILAS

   LD A,(VITPOSX)                         ;CARGADO EN RUTINA "COLOCAR"
   CP 0
   JR Z,AGSINDESPBorra

LD B,8                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILASBorra:                              ;PUNTO DE BUCLE "C"

   LD (HL),0                              ;PINTO 0
   INC HL
   LD (HL),0                              ;PINTO 0
   DEC HL
   CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN

DJNZ OCHOFILASBorra

RET

;--------

AGSINDESPBorra:
LD B,8                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILASBorra2:                              ;PUNTO DE BUCLE "C"
LD (HL),0                              ;PINTO 0
CALL EMPANADAHR
DJNZ OCHOFILASBorra2
RET




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;  ++++ HR2X2BORRA ++++   BORRA SIN ATRIBUTOS EN HR 2X2
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


;BORRA UN SPRITE DE TAMAÑO 2X2 EN HR 

;ENTRADA          B - (Y)
;                 C - (X)

HR2X2BORRA:


LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY" , "VITPOSX" SE GUARDA APROVENCHANDO LA RUTINA "COLOCAR"
LD (VITPOSY),A

CALL COLOCAR

   LD A,(VITPOSX)                         ;CARGADO EN RUTINA "COLOCAR"
   CP 0
   JR Z,AGSINDESPBorra2X2

LD B,16                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILASBorra2X2:                              ;PUNTO DE BUCLE "C"

   LD (HL),0                              ;PINTO 0
   INC HL
   LD (HL),0                              ;PINTO 0
   INC HL
   LD (HL),0                              ;PINTO 0
   DEC HL
   DEC HL
   CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN

DJNZ OCHOFILASBorra2X2

RET

;--------

AGSINDESPBorra2X2:
LD B,16                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILASBorra22X2:                              ;PUNTO DE BUCLE "C"
LD (HL),0                              ;PINTO 0
INC HL
LD (HL),0                              ;PINTO 0
DEC HL
CALL EMPANADAHR
DJNZ OCHOFILASBorra22X2
RET




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;  ++++ HR1X1BS ++++   SIN XOR  SIN ATRIBUTOS
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


;DIBUJA UN SPRITE DE TAMAÑO 1X1 EN HR SIN XOR Y SIN ATRIBUTOS

;ENTRADA          B - (Y)
;                 C - (X)
;                 HL- SPRITE

HR1X1BS:

LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY" , "VITPOSX" SE GUARDA APROVENCHANDO LA RUTINA "COLOCAR"
LD (VITPOSY),A
PUSH HL                                ;GUARDAMOS ESPRITE (**)
CALL COLOCAR
LD (GUARDADIRECCION),HL                ;GUARDO EN HUCHA PARA LUEGO USARLO AL BAJAR FILAS

POP HL                                 ;SACAMOS EL SPRITE (**)

LD B,8                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILASB:                              ;PUNTO DE BUCLE "C"
PUSH BC

   LD D,(HL)                              ;DATO DEL ESPRITE
   INC HL
   PUSH HL                                ;GUARDAMOS POSICION SPRITE     -----

   LD A,(VITPOSX)                         ;CARGADO EN RUTINA "COLOCAR"
   CP 0
   JR Z,AGSINDESPBB

   ;INC A
   LD B,A                                 ;BUCLE DESPLAZAMIENTO
   XOR A                                  ;LIMPIO A & CARRY a CERO

   AGDESPLAZAMIENTOBB:
   RR D                                   ;ROTO 1º CARÁCTER
   RR A                                   ;ROTO 2º CARACTER
   DJNZ AGDESPLAZAMIENTOBB

   LD HL,(GUARDADIRECCION)                          ;SACO DIRECCION A PINTAR
   LD (HL),D                              ;PINTO D
   INC HL
   LD (HL),A                              ;PINTO A

   DEC HL
   FFIINNB:
   CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN
   LD (GUARDADIRECCION),HL                ;GUARDAMOS DIRECCIÓN EN HUCHA

   POP HL                                 ;SACAMOS DIRECCION ESPRITE     -----

POP BC
DJNZ OCHOFILASB


RET

;--------

AGSINDESPBB:
LD HL,(GUARDADIRECCION)                ;SACO DIRECCION A PINTAR
LD (HL),D                              ;PINTO D
JR FFIINNB



;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;  ++++ HR2X2BS ++++   SIN XOR  SIN ATRIBUTOS
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


;DIBUJA UN SPRITE DE TAMAÑO 2X2 EN HR SIN XOR Y SIN ATRIBUTOS

;ENTRADA          B - (Y)
;                 C - (X)
;                 HL- SPRITE

HR2X2BS:

LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY" , "VITPOSX" SE GUARDA APROVENCHANDO LA RUTINA "COLOCAR"
LD (VITPOSY),A
PUSH HL                                ;GUARDAMOS ESPRITE (**)
CALL COLOCAR
LD (GUARDADIRECCION),HL                ;GUARDO EN HUCHA PARA LUEGO USARLO AL BAJAR FILAS

POP HL                                 ;SACAMOS EL SPRITE (**)

LD B,16                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
OCHOFILASB2X2:                              ;PUNTO DE BUCLE "C"
PUSH BC

LD D,(HL)                              ;DATO DEL ESPRITE
INC HL
LD E,(HL)
INC HL
PUSH HL                                ;GUARDAMOS POSICION SPRITE

LD A,(VITPOSX)
CP 0
JP Z,AGSINDESPBB2X2

;INC A
LD B,A                                 ;BUCLE DESPLAZAMIENTO
XOR A                                  ;LIMPIO A & CARRY a CERO

MORADESPLAZAMIENTO2X2:
RR D                                   ;ROTO 1º CARÁCTER
RR E                                   ;ROTO 2º CARACTER
RR A                                   ;ROTO 3º CARACTER
DJNZ MORADESPLAZAMIENTO2X2

LD HL,(GUARDADIRECCION)                          ;SACO DIRECCION A PINTAR
LD (HL),D                              ;PINTO D
INC HL
LD (HL),E                              ;PINTO E
INC HL
LD (HL),A                              ;PINTO A

DEC HL
FFIINNB2X2:
DEC HL
CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN
LD (GUARDADIRECCION),HL                          ;GUARDAMOS DIRECCIÓN EN HUCHA

POP HL                                 ;SACAMOS DIRECCION ESPRITE

POP BC
DJNZ OCHOFILASB2X2


RET

;--------

AGSINDESPBB2X2:
LD HL,(GUARDADIRECCION)
LD (HL),D                              ;PINTO D
INC HL
LD (HL),E                              ;PINTO E
JR FFIINNB2X2






;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;                               ++++ HR1X1 ++++   CON XOR   SIN ATRIBUTOS
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;DIBUJA UN SPRITE DE TAMAÑO 1X1 EN HR

;ENTRADA          B - (Y)
;                 C - (X)
;                 HL- SPRITE

HR1X1:

LD A,B
AND 7                                  ;DESPLAZAMIENTO DE Y GUARDADO EN "VITPOSY" , "VITPOSX" SE GUARDA APROVENCHANDO LA RUTINA "COLOCAR"
LD (VITPOSY),A
PUSH HL                                ;GUARDAMOS ESPRITE (**)
CALL COLOCAR
LD (GUARDADIRECCION),HL                ;GUARDO EN HUCHA PARA LUEGO USARLO AL BAJAR FILAS

POP HL                                 ;SACAMOS EL SPRITE (**)

LD B,8                                 ;ES LA ALTURA DEL SPRITE    , SI MODIFICAMOS ESTO VARIAMOS ALTURA 16 SERÍA 1X2 24 SERÍA 1X3 ETC.
AGUANACJ2:                              ;PUNTO DE BUCLE "C"
PUSH BC

LD D,(HL)                              ;DATO DEL ESPRITE
INC HL
PUSH HL                                ;GUARDAMOS POSICION SPRITE

LD A,(VITPOSX)                         ;CARGADO EN RUTINA "COLOCAR"
CP 0
JR Z,AGSINDESPJ2

INC A
LD B,A                                 ;BUCLE DESPLAZAMIENTO
XOR A                                  ;LIMPIO A & CARRY a CERO

AGDESPLAZAMIENTOJ2:
RR D                                   ;ROTO 1º CARÁCTER
RR A                                   ;ROTO 2º CARACTER
DJNZ AGDESPLAZAMIENTOJ2

AGSINDESPJ2:

LD C,A                                 ;PASO SEGUNDO CARACTER A "C", SI NO HABIA DESPLAZAMIENTO TOO FUNCIONA PORQUE A SERíA=0
LD HL,(GUARDADIRECCION)                ;SACO DIRECCION A PINTAR

LD A,(HL)
XOR D                                  ;PINTO D
LD (HL),A

INC HL

LD A,(HL)
XOR C                                  ;PINTO C
LD (HL),A

DEC HL
CALL EMPANADAHR                        ;BAJAMOS SIGUIENTE SCAN
LD (GUARDADIRECCION),HL                ;GUARDAMOS DIRECCIÓN EN HUCHA

POP HL                                 ;SACAMOS DIRECCION ESPRITE

POP BC
DJNZ AGUANACJ2


RET




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; CÁLCULO DE DIRECCIONES
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; DIRECCION PANTALLA EN BR
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

RESIDENCIA:

;ENTRADA          B(Y)
;                 C(X)
;SALIDA           HL - DIRECCION

    LD A,B
    AND $18
    ADD A,$40
    LD H,A

    LD A,B
    AND 7
    RRCA
    RRCA
    RRCA
    LD L,A

    LD A,C
    ADD A,L
    LD L,A
RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; DIRECCION PANTALLA EN HR
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

COLOCAR:

;ENTRADA          B(Y)
;                 C(X)
;SALIDA           HL - DIRECCION
;                 A- VITPOSX  y EN VARIABLE (VITPOSX)

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
LD (VITPOSX),A
RET

COLOCARB:    ;LO MISMO SIN CALCULAR NI GUARDAR VITPOS

;ENTRADA     B (Y) C(X)
;
;SALIDA            HL - DIRECCION

;LD A,(Y)
;LD B,A
LD A,C ; Ponemos en A la X
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
    ;LD A, C ; Recuperamos la coordenada (X)
    ;AND 7
    ;LD (VITPOSX),A
RET

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; DIRECCION ATRIBUTOS DESDE DIRECCION PIXELS
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

RESIDENCIATRIBUTO:
;ENTRADA    HL ADRESS PANTALLA
;SALIDA     HL ADRESS ATRIBUTOS     (FUSILADO DEL SABREWULF DEL TOMMYGUN, GRACIAS !!)

    LD A,H                          ; get the high byte of screen address
    RRA                             ; divide h by 8
    RRA                             ;
    RRA                             ;
    AND 3                           ; keep lower 3 bits,  these mimick the lower 4 bits of the attribute address
    OR 88                           ; set the high order byte to the start of the attribute block
    LD H,A                          ; load the result into h
RET

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; DIRECCION ATRIBUTOS DESDE COORDENADA YX BR             CURSO DE COMPILER SPECCY.ORG
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

TRIBUTOS:
;ENTRADA          B(Y)
;                 C(X)
;SALIDA           HL - DIRECCION ATRIBUTOS

LD A, B
RRCA
RRCA
RRCA
AND 3
ADD A, $58
LD H, A
LD A, B
AND 7
RRCA
RRCA
RRCA
ADD A,C
LD L,A
RET

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; DIRECCION ATRIBUTOS DESDE COORDENADA HR  OCUPA 22 VELOCIDAD 90
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


TRIBUTOSHR:

;ENTRADA     B (Y) C(X)
;
;SALIDA            HL - DIRECCION

LD A,C ; Ponemos en A la X
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

    LD A,H                          ; get the high byte of screen address
    RRA                             ; divide h by 8
    RRA                             ;
    RRA                             ;
    AND 3                           ; keep lower 3 bits,  these mimick the lower 4 bits of the attribute address
    OR 88                           ; set the high order byte to the start of the attribute block
    LD H,A                          ; load the result into h
RET




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; RUTINAS AUXILIARES
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; EMPANADAS PARA BAJAR A FILA DE ABAJO EN PANTALLA DIBUJO DETECTANDO POSIBLE CAMBIO DE TERCIO
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

EMPANADA:

;ENTRADA      HL
;SALIDA       HL DE ABAJO

   LD A, L                    ; RUTINA FUSILADA DEL CURSO DE COMPILER   "http://wiki.speccy.org/cursos/ensamblador/gfx2_direccionamiento#calculo-de-posiciones-diferenciales-de-caracter"
   ADD A, 32
   LD L, A
   RET NC
   LD A, H
   ADD A, 8
   LD H, A
   RET

EMPANADAHR:
;ENTRADA      HL
;SALIDA       HL DE ABAJO

   INC H                      ;BAJO UN SCAN
   LD A,H		      ;CON ESTA EMPANADA COMPRUEBO SI HAY SALTO DE CARACTER O TERCIO Y EN ESE CASO
   AND 7		      ;AJUSTO LA DIRECCIÓN DE PANTALLA
   JR NZ,ALAYASTA3
   LD A,L
   ADD A,32
   LD L,A
   JR C,ALAYASTA3
   LD A,H
   SUB 8
   LD H,A
   ALAYASTA3:
RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;                  -  HRaBR  -
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


HRaBR:
; ENTRADA    "D" - "E" (XY EN HR)
; SALIDA     "D" - "E" (XY EN BR)

    LD A,D
    SRA A
    SRA A
    SRA A
    AND 31
    LD D,A

    LD A,E
    SRA A
    SRA A
    SRA A
    AND 31
    LD E,A
RET


BRaHR:
; ENTRADA    "B" - "C" (YX EN BR)
; SALIDA     "B" - "C" (YX EN HR)
    SLA B
    SLA B
    SLA B

    SLA C
    SLA C
    SLA C
RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
; DATOS AUXILIARES PARA CÁLCULOS
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

GUARDACOLOR:      DEFB 0
GUARDADIRECCION:  DEFB 0,0
DIRTEMPORAL:      DEFB 0,0
VITPOSX:          DEFB 0
VITPOSY:          DEFB 0
LARGO:            DEFB 0
BAJO:             DEFB 0

REPITEX:          DEFB 0        ;USADAS EN RELLENA2D
REPITEY:          DEFB 0
DIMREPITEX:       DEFB 0
DIMREPITEY:       DEFB 0
EQUIS:            DEFB 0
EQUIS2:           DEFB 0
YGRIEGA:          DEFB 0
ESPRITE:          DEFB 0,0

;**********************************************************************************************************************************
;**********************************************************************************************************************************
;**********************************************************************************************************************************
;DEL CURSO DE COMPILER SPECCY.ORG:
;**********************************************************************************************************************************
;**********************************************************************************************************************************
;**********************************************************************************************************************************
;TABLAS PRECALCULADAS DE DIRECCIÓN DE PANTALLA Y 64 BYTES LIBRES USADOS EN XXX.


   ; Macro de alineacion para PASMO
align   macro value
       if $ mod value
       ds value - ($ mod value)
       endif
       endm

align 256

Scanline_Offsets:
LUT_Scanlines_LO:
  DB $00, $00, $00, $00, $00, $00, $00, $00, $20, $20, $20, $20
  DB $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $40
  DB $60, $60, $60, $60, $60, $60, $60, $60, $80, $80, $80, $80
  DB $80, $80, $80, $80, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
  DB $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $E0, $E0, $E0, $E0
  DB $E0, $E0, $E0, $E0, $00, $00, $00, $00, $00, $00, $00, $00
  DB $20, $20, $20, $20, $20, $20, $20, $20, $40, $40, $40, $40
  DB $40, $40, $40, $40, $60, $60, $60, $60, $60, $60, $60, $60
  DB $80, $80, $80, $80, $80, $80, $80, $80, $A0, $A0, $A0, $A0
  DB $A0, $A0, $A0, $A0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0
  DB $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $00, $00, $00, $00
  DB $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20
  DB $40, $40, $40, $40, $40, $40, $40, $40, $60, $60, $60, $60
  DB $60, $60, $60, $60, $80, $80, $80, $80, $80, $80, $80, $80
  DB $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $C0, $C0, $C0, $C0
  DB $C0, $C0, $C0, $C0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0

BYTE_LIBRE:
  DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  DB 0, 0, 0, 0

LUT_Scanlines_HI:
  DB $40, $41, $42, $43, $44, $45, $46, $47, $40, $41, $42, $43
  DB $44, $45, $46, $47, $40, $41, $42, $43, $44, $45, $46, $47
  DB $40, $41, $42, $43, $44, $45, $46, $47, $40, $41, $42, $43
  DB $44, $45, $46, $47, $40, $41, $42, $43, $44, $45, $46, $47
  DB $40, $41, $42, $43, $44, $45, $46, $47, $40, $41, $42, $43
  DB $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
  DB $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $48, $49, $4A, $4B
  DB $4C, $4D, $4E, $4F, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
  DB $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $48, $49, $4A, $4B
  DB $4C, $4D, $4E, $4F, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
  DB $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53
  DB $54, $55, $56, $57, $50, $51, $52, $53, $54, $55, $56, $57
  DB $50, $51, $52, $53, $54, $55, $56, $57, $50, $51, $52, $53
  DB $54, $55, $56, $57, $50, $51, $52, $53, $54, $55, $56, $57
  DB $50, $51, $52, $53, $54, $55, $56, $57, $50, $51, $52, $53
  DB $54, $55, $56, $57, $50, $51, $52, $53, $54, $55, $56, $57
