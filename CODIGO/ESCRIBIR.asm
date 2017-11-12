


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
UNAFRASE:            ;RUTINA QUE PINTA UNA FRASE QUE OCUPA SÓLO UNA LINEA-- INPUT B "Y" C "X" DE "DIR FRASE"
   CALL RESIDENCIA
   DEC HL            ;PARA QUE FUNCIONE BUCLE DE ESCRITURA RESTO UNA
   DEC DE            ;PORQUE LUEGO SE LA VA A SUMAR AL EMPEZAR
   LD (HUCHA),HL     ;SACO DIRECCIÓN DONDE PINTAR Y GUARDO EN "HUCHA"
   LD (TRUCHA),DE    ;GUARDO PUNTERO DE FRASE EN "TRUCHA"

  YOTRALETRA:
   LD HL,(HUCHA)
   LD DE,(TRUCHA)
   INC HL
   INC DE
   LD (HUCHA),HL     ;SACO DIRECCIÓN DONDE PINTAR Y GUARDO EN "HUCHA"
   LD (TRUCHA),DE    ;GUARDO PUNTERO DE FRASE EN "TRUCHA"


   LD A,(DE)         ;SACO VALOR DE LA FRASE
   ;CP 64             ;SI ES "@" CAMBIO DE LINEA
   ;JR NZ,CHAMBI
   ;LD BC,5378
   ;INC DE
   ;JR UNAFRASE
   ;CHAMBI:
   CP 64             ;64 ES LA "@"
   RET Z             ;SI ES "@" VOLVEMOS
   CALL UNALETRA
   JR YOTRALETRA
   
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
UNAFRASEB:            ;RUTINA QUE PINTA UNA FRASE QUE PUEDE OCUPAR DOS LINEAS ADAPTADA A VADERETRO II (O COMO SE TITULE) -- 
;INPUT  A= Nº DE FRASE

PUSH AF
CALL BORRA_CAJA_BIS
POP AF

LD HL,0
LD DE,PUNTERO_TXT_CAJETIN
CALL TRUCO_CONTADOR_FRASESII	;OBTENGO HL=VALOR A SUMAR 
LD DE,TEXTOS_CAJETIN
ADD HL,DE			
EX DE,HL			;"DE" 1º LETRA DE LA FRASE

LD A,121		;MODIFICAR ESTO PARA COLOR DISTINTO SEGÚN PERSONAJE
LD (TINTA),A

	PARA_TXT_INVENTARIO:		;TRUCOS QUE SE INVENTA UNO

LD HL,16520			;DIRECCION 4,8

BUCLE_CAJETIN:

LD A,(DE)
CP 64             ;64 ES LA "@"
RET Z             ;SI ES "@" VOLVEMOS
CP 62		  ;62 ES LA ">"
CALL Z,NEXTLINE

LD (HUCHA),HL     ;SACO DIRECCIÓN DONDE PINTAR Y GUARDO EN "HUCHA"
PUSH HL
PUSH DE
CALL UNALETRA     ;PINTA UNA LETRA INPUT "A" - LETRA // "HL" - DIRECCIÓN
POP DE
POP HL
INC HL
INC DE

JR BUCLE_CAJETIN

NEXTLINE:
INC DE
LD A,(DE)
LD HL,16552
RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
UNNUMERO:            ;RUTINA QUE PINTA UN NUMERO DE 0 A 9 INPUT -- INPUT B "Y" C "X" A "NUMERO (0a9)"
   LD (TRUCHA),A     ;NOS GUARDAMOS "A"
   CALL RESIDENCIA
   LD (HUCHA),HL     ;LUEGO LO USA RUTINA "UNALETRA" PARA COLOREAR
   LD A,(TRUCHA)     ;SACAMOS "A"
   ADD A,48          ;SUMAMOS 48 PARA CONVERTIRLO EN EL CÓDIGO
   CALL UNALETRA
   RET

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
DOSNUMEROS:          ;RUTINA QUE PINTA UN NUMERO DE 0 A 99 INPUT -- INPUT B "Y" C "X" A "NUMERO (0a99)"


            LD (NUMERINES),A
            LD D,0
            GUELTITAS:
            SUB 10
            CP 100
            JR NC,SACABO
            INC D
            JR GUELTITAS
            SACABO:
            LD A,D
            PUSH BC
            PUSH DE
            CALL UNNUMERO
            POP DE
            LD E,10
            CALL Multiply
            LD A,(NUMERINES)
            SUB L
            POP BC
            INC C
            CALL UNNUMERO
            RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
TRESNUMEROS:          ;RUTINA QUE PINTA UN NUMERO DE 0 A 255 INPUT -- INPUT B "Y" C "X" A "NUMERO (0a255)" 

PUSH BC
LD (NUMERINES),A
CENTENAS:
            CP 199
            JR NC,DOSCIENES
            CP 99
            JR NC,UNCIENES
            XOR A
            CALL UNNUMERO
            JR MECENAS
            DOSCIENES:
            SUB 200
            LD (NUMERINES),A
            LD A,2
            CALL UNNUMERO
            JR MECENAS
            UNCIENES:
            SUB 100
            LD (NUMERINES),A
            LD A,1
            CALL UNNUMERO
MECENAS:
            LD E,0
            LD B,10
            BUVCLE:
            LD A,(NUMERINES)
            CP E
            JR C,TEPASASTE
            LD A,E
            ADD A,10
            LD E,A
            DJNZ BUVCLE
            TEPASASTE:
            LD A,(NUMERINES)
            SUB E
            ADD A,10
            LD (NUMERINES),A
            LD A,9
            SUB B
            POP BC
            INC C
            PUSH BC
            CALL UNNUMERO
UNIDADES:
            POP BC
            INC C
            LD A,(NUMERINES)
            CALL UNNUMERO
RET


;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
UNALETRA:            ;PINTA UNA LETRA INPUT "A" - LETRA // "HL" - DIRECCIÓN
   PUSH HL           ;NOS GUARDAMOS DIRECCIÓN

   SUB 48

   LD H,0
   LD L,A            ;PONGO EL VALOR DEL CARACTER EN HL
   ADD HL,HL         ;x2
   ADD HL,HL         ;x4
   ADD HL,HL         ;x8
   LD DE,FUENTE
   ADD HL,DE         ;AHORA HL TIENE EL VALOR DE LA DIRECCIÓN DEL CARACTER A PINTAR
   EX DE,HL          ;CAMBIAMOS: "DE" DIRECCION CARACTER A PINTAR
   POP HL            ;SACAMOS DIRECCIÓN A PINTAR EN "HL"
   LD B,8
 GARABATO:
   LD A,(DE)
   LD (HL),A
   INC H
   INC DE
 DJNZ GARABATO
 LD HL,(HUCHA)
 CALL RESIDENCIATRIBUTO
 LD A,(TINTA)
 LD (HL),A
RET

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
HUCHA:
DEFB 0,0
TRUCHA:
DEFB 0,0
TINTA:
DEFB 0
NUMERINES:
DEFB 0
FUENTEX:
DEFB 0,0



;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

OTROS_TEXTOS:
DB  "INVENTARIO@"			;  + 0
DB  "INICIO@"				;  + 11
DB  "AYUDA@"				;  + 18
DB  "EXTRA@"				;  + 24
DB  "VICTORIA;=@"			;  + 30
DB  "Q@"			        ;  + 41
DB  "A@"			        ;  + 43
DB  "O@"			        ;  + 45
DB  "P@"			        ;  + 47
DB  "1@"			        ;  + 49
DB  "2@"			        ;  + 51
DB  "M@"			        ;  + 53
DB  "N@"			        ;  + 55
DB  "I@"			        ;  + 57
DB  "1>FAR;CRY@"			;  + 59
DB  "2>CALL;OF;DUTY@"			;  + 69
DB  "3>JARL;LIFE@"			;  + 84
DB  "PRESENTA@"			        ;  + 96
DB  "EN;UN;MUNDO;EN@"			;  + 105
DB  "EN;UNA;ISLA;EN@"			;  + 120
DB  "GUERRA<<<@"			;  + 135
DB  "BLACK;MESA@"			;  + 145
DB  "1988@"			        ;  + 156
DB  "A;POR;ELLOS;=@"			;  + 161
DB  "PERO;HOY;NO<<<@"			;  + 175
DB  "MA:ANA;=@"			        ;  + 190
DB  "NONSENSE;IN;BASIC@"		;  + 199
DB  "NO;PUEDO;=@"			;  + 217
DB  "JARL;=@"			        ;  + 228
DB  "GAME;OVER@"			;  + 235


INTRO_TEXTOS:
DB  "K;SALTAR;INTRO@"			;  + 0
DB  "HACE;TIEMPO<<<@"			;  + 15
DB  "UN;FAMOSO;JUGADOR@"		;  + 30
DB  "UN;VIAJE;;;;@"			;  + 48
DB  "UNIVERSOS;PARALELOS@"		;  + 61
DB  "ES;ABDUCIDO@"			;  + 81
DB  "Y;LLEVADO;A@"			;  + 93
DB  "LEJOS;DE;ALLI<<<@"			;  + 105
DB  "TERRA;IGNOTA@"			;  + 122
DB  "6;NOVIEMBRE;1354@"			;  + 135
DB  "MASADA;DEL;DC<MALFARIO@"		;  + 152
DB  "LA;NAVE;STELA;==@"			;  + 175
DB  "OTRA;VEZ@"		         	;  + 192
DB  "VIAJES;EN;EL;TIEMPO<<<@"		;  + 201
DB  "<<<Y;COSAS;DE;ESAS<<<@"		;  + 224
DB  "VAMOS;==@"		        	;  + 246
DB  "PERO;AVECES<<<@"			;  + 255
DB  "EL;MULTIUNIVERSO<<<@"		;  + 270
DB  "ES;MUY;PEQUE:O@"			;  + 290
DB  "VICTORIA;=@"			;  + 305
DB  "DE;REGRESO;A;CASA@"		;  + 316
DB  "POR;EXTRA:OS;MUNDOS@"		;  + 334
DB  "<<<HASTA;1982@"			;  + 354
DB  ">>>>TRANSFER;MARKET>>>>@"		;  + 368
DB  "YOU;VE;101200@"			;  + 392
DB  ";NAME;;;NO<;SKILL;ENERGY;VALUE@"	;  + 406
DB  "MALFARIO;14;;;5;;;;;20;;;10000@"	;  + 437
DB  "TYPE;YOUR;BID@"			;  + 468
DB  "OR;TYPE;99;TO;CONTINUE@"		;  + 482
DB  "H>COPY@"			        ;  + 505
DB  ";;GOAL=;;@"		        ;  + 512
DB  "<<<MALFARIO<<<@"			;  + 522
DB  "<<<MUST;DIE<<<@"			;  + 537








;TEXTOS:
;DB  "GO;=@"					;+ 0

;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
PUNTERO_TXT_CAJETIN:
DEFB 18,21,30,10,11,10,8,27,14,24,16,30,13,18,20,13,11,15,24,26,15,25,15,20,14,17,17,24,17

TEXTOS_CAJETIN:
DB  "PARA;QUE>SERVIRA?@"
DB  "NO;SE;QUE>ES;ESTO<<<@"
DB  "ALGO;CAMBIA<<<>EN;ALGUN;SITIO@"
DB  "A;LA;SACA@"			
DB  "QUE;UTIL;=@"
DB  "OLE;OLE;=@"			;  10
DB  "VAMOS;=@"				;  8
DB  "ESTO;PARECIA>IMPORTANTE<<<@"	;  27
DB  "NO;FUNCIONA;=@"			;  14
DB  "DEBO;COLOCARME>MEJOR<<<@"		;  24
DB  "ANALISIS;CHUNGO@"			;  16
DB  "YO;AHI;NO;ENTRO>QUE;MAL;ROLLO@"	;  30
DB  "DONDE;ESTOY?@"			;  13
DB  "LA;NAVE;ESTA>ROTA@"		;  18
DB  "NO<ESTO;ME;LO>QUEDO@"		;  20
DB  "AHI;DEJO;ESO@"			;  13
DB  "QUE;PONGO?@"			;  11
DB  "INTERCAMBIATOR@"			;  15
DB  "ANDA<<<>ALEGRAME;EL;DIA@"		;  24
DB  "ALEACION;Z>INDESTRUCTIBLE@"	;  26
DB  "TELETRANSPORTE@"			;  15
DB  "PELIGRO;=>NO;SIN;BRUJULA@"		;  25
DB  "CIUDAD>PERDIDA@"			;  15
DB  "ANALIZADORES>DE;ADN@"		;  20
DB  "UNA;BRUJULA;=@"			;  14
DB  "LE;FALTAN>PIEZAS@"			;  17
DB  "YA;TIENES>MUCHAS@"			;  17
DB  "ME;SIENTO;MEJOR>GRACIAS@"		;  24
DB  "NO;PUEDO;YO;SOLO@"			;  17






;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
PUNTERO_TXT_INVENTARIO:
DEFB 5,16,14,14,16,9,20

TEXTOS_INVENTARIO:

DB  "NADA@"			;  5
DB  "UNA;LLAVE;CHULA@"		;  16
DB  "MEDIA;CAPSULA@"		;  14
DB  "MEDIA;CAPSULA@"		;  14
DB  "TARRO;DE;FLUZZO@"		;  16
DB  "MANIVELA@"			;  9
DB  "UNA;LLAVE>MEGACHULA@"	;  20




;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

;FUENTE SPECTRUM 15360+48*8=15744  EXISTE PROBLEMA DE ESPACIO EN BLANCO



FUENTE:     ;VA DESDE EL 0 HASTA LA "Z", LA HE COGIDO DE LAS FUENTES QUE VIENEN CON EL "BASIN", MUCHAS GRACIAS !!


;DEAD FOREST DE "DAMIEN G"  BASIN

;DEFB  24,60,102,214,198,204,120,0,       12,28,12,12,24,24,52,0          ; 0 - 1
;DEFB  120,236,12,24,112,230,188,0,       118,30,12,60,134,230,124,0      ; 2 - 3
;DEFB  40,48,48,102,252,78,24,0,          124,98,240,220,6,206,124,0      ; 4 - 5
;DEFB  28,50,96,124,230,238,124,0,        122,230,12,28,56,24,16,0        ; 6 - 7
;DEFB  56,108,198,124,198,238,124,0,      120,204,198,126,6,156,120,0     ; 8 - 9
;DEFB  0,0,0,0,0,0,24,48,                 0,0,0,0,0,0,0,0                 ; : - ;      (*)":" ES ","     ";" ES "ESPACIO"
;DEFB  0,0,0,0,0,0,24,0,                  24,12,28,24,8,16,48,0           ; < - =      (*)"<" ES "."     "=" ES "!"
;DEFB  0,0,0,240,30,0,0,0,                124,238,70,28,16,8,24,0         ; > - ?      (*)">" ES "-"
;DEFB  120,252,150,126,238,222,106,0,     104,56,40,108,124,198,172,0     ; @ - A
;DEFB  184,108,102,124,102,118,220,0,     56,108,194,192,192,102,60,0     ; B - C
;DEFB  184,108,102,102,102,102,220,0,     188,98,104,120,96,118,220,0     ; D - E
;DEFB  188,98,104,120,96,96,208,0,        56,108,192,222,204,230,122,0    ; F - G
;DEFB  170,102,102,126,102,102,204,0,     44,24,24,24,24,24,44,0          ; H - I
;DEFB  22,12,12,12,140,220,120,0,         170,102,108,120,108,102,204,0   ; J - K
;DEFB  192,96,96,96,96,102,188,0,         164,254,254,214,214,198,140,0   ; L - M
;DEFB  170,230,246,254,222,206,132,0,     52,120,204,134,198,236,120,0    ; N - O
;DEFB  184,236,102,108,112,96,208,0,      56,108,102,198,214,108,54,0     ; P - Q
;DEFB  216,124,102,124,102,102,202,0,     54,110,96,60,142,230,124,0      ; R - S
;DEFB  118,122,152,24,24,24,52,0,         170,110,102,102,102,102,60,0    ; T - U
;DEFB  172,198,198,108,108,60,24,0,       108,108,198,214,254,238,68,0    ; V - W
;DEFB  172,102,108,56,108,204,108,0,      76,198,102,60,24,24,48,0        ; X - Y
;DEFB  184,236,24,48,98,204,124,0                                         ; Z


; SERIF "SIN AUTOR" BASIN
;DEFB 24,36,70,90,98,36,24,0,         8,24,40,8,8,8,62,0         ; 0 - 1
;DEFB 56,68,4,24,32,68,124,0,         62,4,8,28,2,34,28,0        ; 2 - 3
;DEFB 8,24,42,126,10,8,28,0,          62,34,32,60,2,34,28,0      ; 4 - 5
;DEFB 8,16,32,120,68,68,56,0,         126,68,8,56,16,16,56,0     ; 6 - 7
;DEFB 24,36,24,36,66,66,60,0,         56,68,68,60,8,16,32,0      ; 8 - 9
;DEFB 0,0,0,0,0,8,8,16,               0,0,0,0,0,0,0,0            ; : - ;           (*)":" ES ","     ";" ES "ESPACIO"
;DEFB 0,0,0,0,0,24,24,0,              16,16,16,16,16,0,16,0      ; < - =           (*)"<" ES "."     "=" ES "!"
;DEFB 0,0,0,0,62,0,0,0,               60,66,4,8,8,0,8,0          ; > - ?           (*)">" ES "-"
;DEFB 0,60,74,86,94,64,60,0,          16,40,40,68,124,130,198,0  ; @ - A
;DEFB 120,36,36,60,34,34,124,0,       28,38,64,64,64,38,28,0     ; B - C
;DEFB 120,36,34,34,34,36,120,0,       126,34,40,56,40,34,126,0   ; D - E
;DEFB 126,34,40,56,40,32,112,0,       24,38,64,78,66,38,26,0     ; F - G
;DEFB 238,68,68,124,68,68,238,0,      124,16,16,16,16,16,124,0   ; H - I
;DEFB 62,42,8,8,8,72,48,0,            238,68,72,112,72,68,238,0  ; J - K
;DEFB 112,32,32,32,32,34,126,0,       198,108,84,68,68,68,238,0  ; L - M
;DEFB 206,68,100,84,76,68,230,0,      24,36,66,66,66,36,24,0     ; N - O
;DEFB 124,34,34,60,32,32,112,0,       24,36,66,66,74,36,28,0     ; P - Q
;DEFB 120,36,36,56,36,36,118,0,       62,66,64,60,2,66,124,0     ; R - S
;DEFB 254,146,16,16,16,16,56,0,       238,68,68,68,68,68,56,0    ; T - U
;DEFB 198,130,68,68,40,40,16,0,       238,68,68,68,84,108,198,0  ; V - W
;DEFB 130,68,40,16,40,68,130,0,       238,68,40,16,16,16,56,0    ; X - Y
;DEFB 254,132,8,16,32,66,254,0                                   ; Z



;DEFB  24,60,102,214,198,204,120,0,    12,28,12,12,24,24,52,0              ; 0 - 1
;DEFB  120,236,12,24,112,230,188,0,    118,30,12,60,134,230,124,0          ; 2 - 3
;DEFB  40,48,48,102,252,78,24,0,       124,98,240,220,6,206,124,0          ; 4 - 5
;DEFB  28,50,96,124,230,238,124,0,     122,230,12,28,56,24,16,0            ; 6 - 7
;DEFB  56,108,198,124,198,238,124,0,   120,204,198,126,6,156,120,0         ; 8 - 9
;DEFB  0,16,24,0,0,8,24,0,             0,0,0,0,0,0,0,0                     ; : - ;           (*)":" ES ","     ";" ES "ESPACIO"
;DEFB  0,0,0,0,0,56,56,0,              0,0,56,14,112,30,0,0                ; < - =           (*)"<" ES "."     "=" ES "!"
;DEFB  0,0,0,24,24,0,0,0,              124,238,70,28,16,8,24,0             ; > - ?           (*)">" ES "-"
;DEFB  120,252,150,126,238,222,106,0,  104,56,40,108,124,198,172,0         ; @ - A
;DEFB  184,108,102,124,102,118,220,0,  56,108,194,192,192,102,60,0         ; B - C
;DEFB  184,108,102,102,102,102,220,0,  188,98,104,120,96,118,220,0         ; D - E
;DEFB  188,98,104,120,96,96,208,0,     56,108,192,222,204,230,122,0        ; F - G
;DEFB  170,102,102,126,102,102,204,0,  44,24,24,24,24,24,44,0              ; H - I
;DEFB  22,12,12,12,140,220,120,0,      170,102,108,120,108,102,204,0       ; J - K
;DEFB  192,96,96,96,96,102,188,0,      164,254,254,214,214,198,140,0       ; L - M
;DEFB  170,230,246,254,222,206,132,0,  52,120,204,134,198,236,120,0        ; N - O
;DEFB  184,236,102,108,112,96,208,0,   56,108,102,198,214,108,54,0         ; P - Q
;DEFB  216,124,102,124,102,102,202,0,  54,110,96,60,142,230,124,0          ; R - S
;DEFB  118,122,152,24,24,24,52,0,      170,110,102,102,102,102,60,0        ; T - U
;DEFB  172,198,198,108,108,60,24,0,    108,108,198,214,254,238,68,0        ; V - W
;DEFB  172,102,108,56,108,204,108,0,   76,198,102,60,24,24,48,0            ; X - Y
;DEFB  184,236,24,48,98,204,124,0                                          ; Z


DEFB   56,108,238,254,254,124,56,0,     120,56,56,56,254,254,254,0      ; 0 - 1
DEFB   252,14,124,240,254,254,254,0,     252,14,60,14,254,254,252,0     ; 2 - 3
DEFB   224,224,238,254,254,126,14,0,     254,224,252,14,254,254,252,0   ; 4 - 5
DEFB   124,224,252,238,254,254,124,0,    254,238,30,28,60,124,124,0     ; 6 - 7
DEFB   124,238,124,238,254,254,124,0,    124,238,126,14,254,254,252,0   ; 8 - 9
DEFB   218,234,246,254,254,238,230,0,    0,0,0,0,0,0,0,0                ; : - ;           (*)":" ES "Ñ"     ";" ES "ESPACIO"
DEFB   0,0,0,0,0,56,56,0,                56,56,56,56,0,56,56,0          ; < - =           (*)"<" ES "."     "=" ES "!"
DEFB   0,0,0,24,24,0,0,0,                252,14,60,0,56,56,56,0         ; > - ?           (*)">" ES "-"
DEFB   124,238,246,238,224,254,254,126,  56,124,108,124,238,238,238,0   ; @ - A
DEFB   252,238,254,236,254,254,252,0,    124,238,224,238,254,254,124,0  ; B - C
DEFB   248,252,118,118,254,252,248,0,    254,240,124,112,254,254,254,0  ; D - E
DEFB   254,112,124,112,248,248,248,0,    126,224,238,230,254,254,126,0  ; F - G
DEFB   238,238,124,124,254,238,238,0,    124,56,56,56,124,124,124,0     ; H - I
DEFB   14,14,14,238,254,254,124,0,       238,252,248,252,254,254,238,0  ; J - K
DEFB   248,112,112,112,254,254,254,0,    198,238,254,254,254,254,238,0  ; L - M
DEFB   206,238,254,254,254,238,230,0,    124,238,238,238,254,254,124,0  ; N - O
DEFB   252,238,124,112,248,248,248,0,    124,254,238,238,238,252,110,0  ; P - Q
DEFB   252,238,126,124,238,238,238,0,    126,224,124,14,254,254,252,0   ; R - S
DEFB   254,254,56,56,124,124,124,0,      238,238,238,238,254,254,124,0  ; T - U
DEFB   238,238,238,238,254,124,56,0,     238,238,254,254,254,254,108,0  ; V - W
DEFB   198,238,124,124,254,238,238,0,    238,238,254,124,56,56,56,0     ; X - Y
DEFB   126,14,30,60,126,126,126,0                                       ; Z
