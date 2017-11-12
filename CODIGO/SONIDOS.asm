
PISADA:         DEFB 0

;**************************************************
;PASOS
;**************************************************


PASITO:                  ;ANDANDO


LD A,(PISADA)
INC A
CP 20
JR Z,SUENAPISADA1
CP 40
JR Z,SUENAPISADA2
JR FINPASITO

SUENAPISADA1:
;              PUSH IX
;              PUSH IY
              ld hl,407     ; This is the pitch for our note
              ld de,1       ; This will be the duration it will play
              call 949
;              POP IY
;              POP IX
              LD A,6
              JR FINPASITO
SUENAPISADA2:
;              PUSH IX
;              PUSH IY
              ld hl,262     ; This is the pitch for our note
              ld de,2       ; This will be the duration it will play
              call 949
;              POP IY
;              POP IX
              XOR A
FINPASITO:
LD (PISADA),A
RET

;**************************************************
;SONIDO BIP
;**************************************************

BIP:
              PUSH IX
              PUSH IY
              ld hl,145       ; This is the pitch for our note
              ld de,13        ; This will be the duration it will play
              call 949
              POP IY
              POP IX
RET

BOP:
;              PUSH IX
;              PUSH IY
              ld hl,1642       ; This is the pitch for our note
              ld de,5        ; This will be the duration it will play
              call 949
;              POP IY
;              POP IX
RET



;******************************************************************************************************************************************************************************************************************************
;EFECTOS DE SONIDO
;**************************************************

AUXEFECTO:      DEFB 0,0


;**************************************************
;EFECTO 0
;**************************************************

EFECTO0:
              PUSH IX
              PUSH IY
              ld hl,262     ;262 This is the pitch for our note
              ld de,2       ;2 This will be the duration it will play
              call 949
              POP IY
              POP IX
RET


;**************************************************
;EFECTO 1
;**************************************************

EFECTO1:

LD B,2
MARIACHI4:
PUSH BC


           LD B,5
           MARIACHI5:
           PUSH BC

	   ld a, B		; borde azul, para actualización inmediata
	   out (254), A
           HALT             ;SI CAMBIO POR NOP RUIDO AGUDO METÁLICO
           ;NOP

           LD (AUXEFECTO),HL

              PUSH IX
              PUSH IY
              LD HL,189
              ld de,1       ; This will be the duration it will play
              call 949
              POP IY
              POP IX

           POP BC
           DJNZ MARIACHI5

POP BC
DJNZ MARIACHI4

RET

;**************************************************
;EFECTO 2
;**************************************************


EFECTO2:

LD B,10
MARIACHI2:
PUSH BC

LD HL,2500
LD (AUXEFECTO),HL

        LD B,10
        MARIACHI:
        PUSH BC

        ld a, B		; borde azul, para actualización inmediata
        out (254), A

        LD HL,(AUXEFECTO)
        LD DE,-250
        ADD HL,DE
        LD (AUXEFECTO),HL

                 PUSH IX
                 PUSH IY
                 ld de,1       ; This will be the duration it will play
                 call 949
                 POP IY
                 POP IX

    POP BC
    DJNZ MARIACHI

POP BC
DJNZ MARIACHI2

RET

;**************************************************
;EFECTO 3
;**************************************************


EFECTO3:

LD B,4
SALEROSO:
PUSH BC

LD HL,2500
LD (AUXEFECTO),HL

        LD B,23
        SALEROSA:
        PUSH BC

        LD HL,(AUXEFECTO)
        LD DE,-100
        ADD HL,DE
        LD (AUXEFECTO),HL

                 PUSH IX
                 PUSH IY
                 ld de,1       ; This will be the duration it will play
                 call 949
                 POP IY
                 POP IX

        POP BC
        DJNZ SALEROSA

POP BC
DJNZ SALEROSO

RET

;**************************************************
;EFECTO 4
;**************************************************

EFECTO4:

LD HL,2500
LD (AUXEFECTO),HL

        LD B,23
        MARICASTANA:
        PUSH BC

        LD HL,(AUXEFECTO)
        LD DE,-100
        ADD HL,DE
        LD (AUXEFECTO),HL

                 PUSH IX
                 PUSH IY
                 ld de,1       ; This will be the duration it will play
                 call 949
                 POP IY
                 POP IX

        POP BC
        DJNZ MARICASTANA
RET


;**************************************************
;EFECTO 5
;**************************************************

EFECTO5:

LD B,5
MARIACHI12:
PUSH BC
LD HL,2620
LD (AUXEFECTO),HL

   ld a, 1		; borde AZUL, para actualización inmediata
   out (254), A
   HALT

       LD B,5
       MARIACHI13:
       PUSH BC
	 ld a, 2		; borde ROJO, para actualización inmediata
	 out (254), A
         HALT
       LD HL,(AUXEFECTO)
       LD DE,200
       ADD HL,DE
       LD (AUXEFECTO),HL
              PUSH IX
              PUSH IY
              ld de,5       ; This will be the duration it will play
              call 949
              POP IY
              POP IX
       POP BC
       DJNZ MARIACHI13
       POP BC
DJNZ MARIACHI12
	ld a, 0		; borde NEGRO, para actualización inmediata
	out (254), A
RET


;**************************************************
;EFECTO 6
;**************************************************

EFECTO6:

LD HL,300
LD (AUXEFECTO),HL

        LD B,8
        chubasquero:
        PUSH BC

        LD HL,(AUXEFECTO)
        LD DE,120
        ADD HL,DE
        LD (AUXEFECTO),HL

                 PUSH IX
                 PUSH IY
                 ld de,2       ; This will be the duration it will play
                 call 949
                 POP IY
                 POP IX

        POP BC
        DJNZ chubasquero
RET

;**************************************************
;EFECTO 7
;**************************************************

EFECTO7:

LD HL,600
LD (AUXEFECTO),HL

        LD B,8
        CAMPAMENTO:
        PUSH BC

        LD HL,(AUXEFECTO)
        LD DE,-50
        ADD HL,DE
        LD (AUXEFECTO),HL

                 PUSH IX
                 PUSH IY
                 ld de,2       ; This will be the duration it will play
                 call 949
                 POP IY
                 POP IX

        POP BC
        DJNZ CAMPAMENTO
RET


;**************************************************
;EFECTO 8
;**************************************************

EFECTO8:

LD HL,400
LD (AUXEFECTO),HL

        LD B,6
        SIRIBIRI:
        PUSH BC

           ld a, 2		; borde AZUL, para actualización inmediata
           out (254), A


        LD HL,(AUXEFECTO)
        LD DE,-50
        ADD HL,DE
        LD (AUXEFECTO),HL

                 PUSH IX
                 PUSH IY
                 ld de,2       ; This will be the duration it will play
                 call 949
                 POP IY
                 POP IX

           XOR A		; borde AZUL, para actualización inmediata
           out (254), A

        POP BC
        DJNZ SIRIBIRI

RET








;**************************************************
;B   E   E   P   O  L   A       II
;**************************************************

MUSICA1:
CALL MUSICA
JP NEXTNOTE

MUSICA2:
CALL MUSICA
JP NEXTNOTE2

MUSICA3:
CALL MUSICA           ;PARA MENU EXTRAS
JP NEXTNOTE3


; *****************************************************************************
; * The Music Box Player Engine
; *
; * Based on code written by Mark Alexander for the utility, The Music Box.
; * Modified by Chris Cowley
; *
; * Produced by Beepola v1.08.01
; ******************************************************************************
 
;START:
;                          LD    HL,MUSICDATA         ;  <- Pointer to Music Data. Change
                                                     ;     this to play a different song
MUSICA:
                          LD   A,(HL)                         ; APAÑO PARA COGER TEMPO
                          LD (TEMPO),A
                          INC HL
                          LD   A,(HL)                         ; Get the loop start pointer
                          LD   (PATTERN_LOOP_BEGIN),A
                          INC  HL
                          LD   A,(HL)                         ; Get the song end pointer
                          LD   (PATTERN_LOOP_END),A
                          INC  HL
                          LD   (PATTERNDATA1),HL
                          LD   (PATTERNDATA2),HL
                          LD   A,254
                          LD   (PATTERN_PTR),A                ; Set the pattern pointer to zero
                          DI
                          CALL  NEXT_PATTERN
                          RET   ;APAÑO
                          

NEXTNOTE:
                          CALL  PLAYNOTE
                          CALL RAND8

       LD BC, $FDFE         ; SEMIFILA G - A
       IN A, (C)            ; LEER PUERTO
       BIT 1, A             ; COMPROBAR BIT 1 "S"
       JR NZ, NEXTNOTE        ; SI NO ESTÁ PULSADO VAMOS A TECLA "P"
       ;HAS PULSADO "S" ENTONCES:

                          ;XOR   A
                          ;IN    A,($FE)
                          ;AND   $1F
                          ;CP    $1F
                          ;JR    Z,NEXTNOTE                    ; Play next note if no key pressed

                          EI
                          RET                                 ; Return from playing tune
                          
                          
NEXTNOTE2:
                          CALL  PLAYNOTE
                          CALL RAND8

       LD BC, $FBFE         ; SEMIFILA T - Q
       IN A, (C)            ; LEER PUERTO
       BIT 2, A             ; COMPROBAR BIT 2 "E"
       JR NZ, NEXTNOTE2        ; SI NO ESTÁ PULSADO VAMOS A TECLA "P"
       ;HAS PULSADO "E" ENTONCES:

                          ;XOR   A
                          ;IN    A,($FE)
                          ;AND   $1F
                          ;CP    $1F
                          ;JR    Z,NEXTNOTE                    ; Play next note if no key pressed

                          EI
                          RET                                 ; Return from playing tune

                          
NEXTNOTE3:
                          CALL  PLAYNOTE

       LD BC, $FBFE         ; SEMIFILA T - Q
       IN A, (C)            ; LEER PUERTO
       BIT 2, A             ; COMPROBAR BIT 2 "E"
       JR NZ, ALUNO         ; SI NO ESTÁ PULSADO VAMOS A TECLA "1"
       ;HAS PULSADO "E" ENTONCES:
                          EI
                          JP MENUS_INICIO    ;NO HEMOS VENIDO CON UN CALL

       ALUNO:
       LD BC, $F7FE         ; SEMIFILA 5 - 1
       IN A, (C)            ; LEER PUERTO
       BIT 0, A             ; COMPROBAR BIT 0 "1"
       JR NZ, ALDOS        ; SI NO ESTÁ PULSADO VAMOS A TECLA "2"
       ;HAS PULSADO "E" ENTONCES:
                          EI
                          JP FAR_CRY    ;NO HEMOS VENIDO CON UN CALL
       ALDOS:
       LD BC, $F7FE         ; SEMIFILA 5 - 1
       IN A, (C)            ; LEER PUERTO
       BIT 1, A             ; COMPROBAR BIT 1 "2"
       JR NZ, ALTRES        ; SI NO ESTÁ PULSADO VAMOS A TECLA "3"
       ;HAS PULSADO "E" ENTONCES:
                          EI
                          JP CALL_DUTY    ;NO HEMOS VENIDO CON UN CALL
       ALTRES:
       LD BC, $F7FE         ; SEMIFILA 5 - 1
       IN A, (C)            ; LEER PUERTO
       BIT 2, A             ; COMPROBAR BIT 2 "3"
       JR NZ, NEXTNOTE3     ; SI NO ESTÁ PULSADO BUCLEAS
       ;HAS PULSADO "E" ENTONCES:
                          EI
                          JP JARL_LIFE    ;NO HEMOS VENIDO CON UN CALL

PATTERN_PTR:              DEFB 0
NOTE_PTR:                 DEFB 0


; ********************************************************************************************************
; * NEXT_PATTERN
; *
; * Select the next pattern in sequence (and handle looping if we've reached PATTERN_LOOP_END
; * Execution falls through to PLAYNOTE to play the first note from our next pattern
; ********************************************************************************************************
NEXT_PATTERN:
                          LD   A,(PATTERN_PTR)
                          INC  A
                          INC  A
                          DEFB $FE                           ; CP n
PATTERN_LOOP_END:         DEFB 0
                          JR   NZ,NO_PATTERN_LOOP
                          DEFB $3E                           ; LD A,n
PATTERN_LOOP_BEGIN:       DEFB 0
NO_PATTERN_LOOP:          LD   (PATTERN_PTR),A
			                    DEFB $21                            ; LD HL,nn
PATTERNDATA1:             DEFW $0000
                          LD   E,A                            ; (this is the first byte of the pattern)
                          LD   D,0                            ; and store it at TEMPO
                          ADD  HL,DE
                          LD   E,(HL)
                          INC  HL
                          LD   D,(HL)
                          LD   A,(DE)                         ; Pattern Tempo -> A
	                	      LD   (TEMPO),A                      ; Store it at TEMPO

                          LD   A,1
                          LD   (NOTE_PTR),A

PLAYNOTE: 
			                    DEFB $21                            ; LD HL,nn
PATTERNDATA2:             DEFW $0000
                          LD   A,(PATTERN_PTR)
                          LD   E,A
                          LD   D,0
                          ADD  HL,DE
                          LD   E,(HL)
                          INC  HL
                          LD   D,(HL)                         ; Now DE = Start of Pattern data
                          LD   A,(NOTE_PTR)
                          LD   L,A
                          LD   H,0
                          ADD  HL,DE                          ; Now HL = address of note data
                          LD   D,(HL)
                          LD   E,1

; IF D = $0 then we are at the end of the pattern so increment PATTERN_PTR by 2 and set NOTE_PTR=0
                          LD   A,D
                          AND  A                              ; Optimised CP 0
                          JR   Z,NEXT_PATTERN

                          PUSH DE
                          INC  HL
                          LD   D,(HL)
                          LD   E,1

                          LD   A,(NOTE_PTR)
                          INC  A
                          INC  A
                          LD   (NOTE_PTR),A                   ; Increment the note pointer by 2 (one note per chan)

                          POP  HL                             ; Now CH1 freq is in HL, and CH2 freq is in DE

                          LD   A,H
                          DEC  A
                          JR   NZ,OUTPUT_NOTE

                          LD   A,D                            ; executed only if Channel 2 contains a rest
                          DEC  A                              ; if DE (CH1 note) is also a rest then..
                          JR   Z,PLAY_SILENCE                 ; Play silence

OUTPUT_NOTE:              LD   A,(TEMPO)
                          LD   C,A
                          LD   B,0
                          LD   A,(BORDER_COL)
                          EX   AF,AF'
                          LD   A,(BORDER_COL)                   ; So now BC = TEMPO, A and A' = BORDER_COL
                          LD   IXH,D
                          LD   D,$10
EAE5:                     NOP
                          NOP
EAE7:                     EX   AF,AF'
                          DEC  E
                          OUT  ($FE),A
                          JR   NZ,EB04

                          LD   E,IXH
                          XOR  D
                          EX   AF,AF'
                          DEC  L
                          JP   NZ,EB0B

EAF5:                     OUT  ($FE),A
                          LD   L,H
                          XOR  D
                          DJNZ EAE5

                          INC  C
                          JP   NZ,EAE7

                          RET

EB04:
                          JR   Z,EB04
                          EX   AF,AF'
                          DEC  L
                          JP   Z,EAF5
EB0B:
                          OUT  ($FE),A
                          NOP
                          NOP
                          DJNZ EAE5
                          INC  C
                          JP   NZ,EAE7
                          RET

PLAY_SILENCE:
                          LD   A,(TEMPO)
                          CPL
                          LD   C,A
SILENCE_LOOP2:            PUSH BC
                          PUSH AF
                          LD   B,0
SILENCE_LOOP:             PUSH HL
                          LD   HL,0000
                          SRA  (HL)
                          SRA  (HL)
                          SRA  (HL)
                          NOP
                          POP  HL
                          DJNZ SILENCE_LOOP
                          DEC  C
                          JP   NZ,SILENCE_LOOP
                          POP  AF
                          POP  BC
                          RET


; *** DATA ***
BORDER_COL:               DEFB 0
TEMPO:                    DEFB 240

UNBLUS:
                    DEFB 240   ;** TEMPO
                    DEFB 40   ; Loop start point * 2
                    DEFB 60   ; Song Length * 2
PATTERNDATA:        DEFW      PAT0
                    DEFW      PAT0
                    DEFW      PAT2
                    DEFW      PAT2
                    DEFW      PAT0
                    DEFW      PAT0
                    DEFW      PAT3
                    DEFW      PAT2
                    DEFW      PAT0
                    DEFW      PAT4
                    DEFW      PAT1
                    DEFW      PAT1
                    DEFW      PAT5
                    DEFW      PAT5
                    DEFW      PAT1
                    DEFW      PAT1
                    DEFW      PAT6
                    DEFW      PAT5
                    DEFW      PAT1
                    DEFW      PAT7
                    DEFW      PAT8
                    DEFW      PAT8
                    DEFW      PAT9
                    DEFW      PAT9
                    DEFW      PAT8
                    DEFW      PAT8
                    DEFW      PAT10
                    DEFW      PAT9
                    DEFW      PAT8
                    DEFW      PAT7

; *** Pattern data consists of pairs of frequency values CH1,CH2 with a single $0 to
; *** Mark the end of the pattern, and $01 for a rest
PAT0:
         DEFB 240  ; Pattern tempo
             DEFB 215,1
             DEFB 1,1
             DEFB 215,1
             DEFB 1,1
             DEFB 171,1
             DEFB 1,1
             DEFB 215,1
             DEFB 144,1
             DEFB 1,1
             DEFB 161,1
             DEFB 171,1
             DEFB 1,1
             DEFB 240,1
             DEFB 1,1
             DEFB 215,1
             DEFB 1,1
         DEFB $0
PAT1:
         DEFB 240  ; Pattern tempo
             DEFB 215,54
             DEFB 1,1
             DEFB 215,54
             DEFB 1,1
             DEFB 180,54
             DEFB 1,1
             DEFB 215,1
             DEFB 144,54
             DEFB 1,1
             DEFB 161,61
             DEFB 171,1
             DEFB 1,57
             DEFB 240,54
             DEFB 1,1
             DEFB 215,1
             DEFB 1,1
         DEFB $0
PAT2:
         DEFB 240  ; Pattern tempo
             DEFB 161,1
             DEFB 1,1
             DEFB 161,1
             DEFB 1,1
             DEFB 128,1
             DEFB 1,1
             DEFB 161,1
             DEFB 108,1
             DEFB 1,1
             DEFB 121,1
             DEFB 128,1
             DEFB 1,1
             DEFB 180,1
             DEFB 1,1
             DEFB 161,1
             DEFB 1,1
         DEFB $0
PAT3:
         DEFB 240  ; Pattern tempo
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
             DEFB 114,1
             DEFB 1,1
             DEFB 144,1
             DEFB 96,1
             DEFB 1,1
             DEFB 108,1
             DEFB 114,1
             DEFB 1,1
             DEFB 161,1
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
         DEFB $0
PAT4:
         DEFB 240  ; Pattern tempo
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
         DEFB $0
PAT5:
         DEFB 240  ; Pattern tempo
             DEFB 161,40
             DEFB 1,1
             DEFB 161,40
             DEFB 1,1
             DEFB 128,40
             DEFB 1,1
             DEFB 161,1
             DEFB 108,40
             DEFB 1,1
             DEFB 121,45
             DEFB 128,1
             DEFB 1,43
             DEFB 180,40
             DEFB 1,1
             DEFB 161,1
             DEFB 1,1
         DEFB $0
PAT6:
         DEFB 240  ; Pattern tempo
             DEFB 144,36
             DEFB 1,1
             DEFB 144,36
             DEFB 1,1
             DEFB 114,36
             DEFB 1,1
             DEFB 144,1
             DEFB 96,36
             DEFB 1,1
             DEFB 108,40
             DEFB 114,1
             DEFB 1,38
             DEFB 161,36
             DEFB 1,1
             DEFB 144,1
             DEFB 1,1
         DEFB $0
PAT7:
         DEFB 240  ; Pattern tempo
             DEFB 144,36
             DEFB 1,1
             DEFB 144,36
             DEFB 1,1
             DEFB 144,36
             DEFB 1,1
             DEFB 144,1
             DEFB 144,36
             DEFB 1,1
             DEFB 144,36
             DEFB 144,1
             DEFB 1,36
             DEFB 144,36
             DEFB 1,36
             DEFB 144,36
             DEFB 1,36
         DEFB $0
PAT8:
         DEFB 240  ; Pattern tempo
             DEFB 215,54
             DEFB 1,1
             DEFB 215,54
             DEFB 1,1
             DEFB 180,54
             DEFB 1,1
             DEFB 215,1
             DEFB 144,54
             DEFB 1,1
             DEFB 161,61
             DEFB 171,1
             DEFB 1,57
             DEFB 240,54
             DEFB 1,43
             DEFB 215,45
             DEFB 1,61
         DEFB $0
PAT9:
         DEFB 240  ; Pattern tempo
             DEFB 161,40
             DEFB 1,1
             DEFB 161,40
             DEFB 1,1
             DEFB 128,40
             DEFB 1,1
             DEFB 161,1
             DEFB 108,40
             DEFB 1,1
             DEFB 121,45
             DEFB 128,1
             DEFB 1,43
             DEFB 180,40
             DEFB 1,32
             DEFB 161,34
             DEFB 1,45
         DEFB $0
PAT10:
         DEFB 240  ; Pattern tempo
             DEFB 144,36
             DEFB 1,1
             DEFB 144,36
             DEFB 1,1
             DEFB 114,36
             DEFB 1,1
             DEFB 144,1
             DEFB 96,36
             DEFB 1,1
             DEFB 108,40
             DEFB 114,1
             DEFB 1,38
             DEFB 161,36
             DEFB 1,28
             DEFB 144,30
             DEFB 1,40
         DEFB $0
         
         
;******************************************************************

EXORCISTA:

                    DEFB 234   ;TEMPO
                    DEFB 0   ; Loop start point * 2
                    DEFB 20   ; Song Length * 2
;PATTERNDATA:
                    DEFW      PATA0
                    DEFW      PATA0
                    DEFW      PATA1
                    DEFW      PATA4
                    DEFW      PATA5
                    DEFW      PATA0
                    DEFW      PATA3
                    DEFW      PATA3
                    DEFW      PATA2
                    DEFW      PATA2

; *** Pattern data consists of pairs of frequency values CH1,CH2 with a single $0 to
; *** Mark the end of the pattern, and $01 for a rest
PATA0:
         DEFB 234  ; Pattern tempo
             DEFB 72,1
             DEFB 54,1
             DEFB 72,1
             DEFB 48,1
             DEFB 72,1
             DEFB 61,1
             DEFB 54,1
             DEFB 72,1
             DEFB 45,1
             DEFB 72,1
             DEFB 40,1
             DEFB 72,1
             DEFB 48,1
             DEFB 45,1
         DEFB $0
PATA1:
         DEFB 234  ; Pattern tempo
             DEFB 72,1
             DEFB 54,1
             DEFB 72,1
             DEFB 48,1
             DEFB 72,1
             DEFB 61,1
             DEFB 54,1
             DEFB 72,144
             DEFB 45,1
             DEFB 72,1
             DEFB 40,1
             DEFB 72,1
             DEFB 48,1
             DEFB 45,1
         DEFB $0
PATA2:
         DEFB 234  ; Pattern tempo
             DEFB 72,144
             DEFB 54,108
             DEFB 72,144
             DEFB 48,96
             DEFB 72,144
             DEFB 61,121
             DEFB 54,108
             DEFB 72,144
             DEFB 45,91
             DEFB 72,144
             DEFB 40,81
             DEFB 72,144
             DEFB 48,96
             DEFB 45,91
         DEFB $0
PATA3:
         DEFB 234  ; Pattern tempo
             DEFB 1,144
             DEFB 1,108
             DEFB 1,144
             DEFB 1,96
             DEFB 1,144
             DEFB 1,121
             DEFB 1,108
             DEFB 1,144
             DEFB 1,91
             DEFB 1,144
             DEFB 1,81
             DEFB 1,144
             DEFB 1,96
             DEFB 1,91
         DEFB $0
PATA4:
         DEFB 234  ; Pattern tempo
             DEFB 72,1
             DEFB 54,1
             DEFB 72,1
             DEFB 48,1
             DEFB 72,1
             DEFB 61,1
             DEFB 54,1
             DEFB 72,144
             DEFB 45,91
             DEFB 72,144
             DEFB 40,1
             DEFB 72,1
             DEFB 48,1
             DEFB 45,1
         DEFB $0
PATA5:
         DEFB 234  ; Pattern tempo
             DEFB 72,1
             DEFB 54,1
             DEFB 72,1
             DEFB 48,1
             DEFB 72,1
             DEFB 61,1
             DEFB 54,1
             DEFB 72,144
             DEFB 45,91
             DEFB 72,144
             DEFB 40,81
             DEFB 72,144
             DEFB 48,96
             DEFB 45,91
         DEFB $0
