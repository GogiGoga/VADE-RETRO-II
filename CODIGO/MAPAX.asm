

;*************************************************
;*************************************************
;*************** M A P A  JUEGO PRINCIPAL ********
;*************************************************
;*************************************************



; TABLAS DE CAMBIOS DE MUNDO  EN RUTINAS UNO


;=============================================================================================================

PUNTERO_MAPAX:

DEFB   0,23,40,0,  35,19,29,40,  12,20,42,32,  20,20,20,25,  0,32,44		;MUNDO 1
;      1           5   	         9	       13            17

DEFB   26,19,26,   12,10,24,  31,24,42						;MUNDO 2
;      20          23         26

DEFB   42,35,29,31								;MUNDO 3
;      29

DEFB   98,42,47,21,39,  36,30,0,36,36						;MUNDO 4
;      33          37   38         42

DEFB   0,0,42,  0,0,52,  0,0,0,  0,0,0						;MUNDO 5
;      43       46       49      52

DEFB   0,0,  25,15,  17,30							;MUNDO 6
;      55    57      59

DEFB   32,29,28									;MUNDO 7
;      61

DEFB   21,46,  11,13,  43,29							;MUNDO 8
;      64      66      68

DEFB   19,26,24,  19,9,14,  20,13,33,  6,7,6,  6,37,6,  14,12,44		;MUNDO 9
;      70         73        76         79      82       85

DEFB   66,57									;MUNDO 10
;      88

DEFB   29,17,  9,25,  31,12,  18,20,  18,36,  31,13				;MUNDO 11
;      90      92     94      96      98      100

DEFB   0,0,0,   0,0,0,   0,0,0,   0,0,0						;MUNDO 12
;      102      105      108      111

DEFB   28,21,20,   0,19,19,   0,15,16,   0,8,15					;MUNDO 13
;      114         117        120        123


DEFB   1		;A
DEFB   1,1,1,1,1,1	;B
DEFB   1,1,1,1,1	;C
DEFB   1,1,1,1		;D
DEFB   1,1,1,1		;E
DEFB   1,1,1,1,1	;F
DEFB   1,1		;G

		;ESPECIALES

DEFB 37           ;DESIERTO
;    153



MAPAX:

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  1

;PANTALLA 1
;PANTALLA 2
DEFB   5,225, 32,0,40, 33,14,23, 33,172,50, 153,51,128, 153,90,0, 133,116, 37,133,20,  255		;23
;PANTALLA 3
DEFB 5,225, 33,0,39, 33,173,35, 32,14,21, 62,148,181,50, 93,17,10,9,4,71,  162,117,0, 162,119,0, 161,134,0, 157,197,0, 159,184,0, 153,58,0,  255		;40
;PANTALLA 4
;PANTALLA 5
DEFB 5,225, 34,0,40, 32,236,49, 33,167,34, 62,82,209,50, 62,104,19,50, 63,112,65,69,  132,131, 157,121,0, 151,60,0, 150,114,0,  255		;35
;PANTALLA 6
DEFB 32,224,33, 33,12,50, 33,206,18, 64,76,97,2, 131,98, 154,203,0,  255	;19
;PANTALLA 7
DEFB 33,0,34, 33,192,34, 32,238,17, 64,64,65,2, 67,50,27,7, 195,145,0, 195,146,1, 196,199,0,  131,70,  255	 ;29
;PANTALLA 8
DEFB 125,224,65,4, 33,200,50, 33,139,50, 33,13,36, 64,142,33,2, 64,203,97,2, 153,81,0, 153,100,128, 156,150,0, 197,136,0, 199,162,0, 199,164,1,  255	;40
;PANTALLA 9
DEFB 34,0,35, 34,192,34, 131,84, 156,118,0, 255		;12
;PANTALLA 10
DEFB 33,133,66, 33,41,53, 33,12,56, 64,197,225,2, 151,67,0, 153,161,128, 255      ;20
;PANTALLA 11
DEFB 3,2, 33,33,70, 33,37,65, 33,71,36, 42,83,66, 40,147,49, 64,67,129,2, 64,225,129,2, 64,199,65,2, 176,181,0, 190,166,0, 151,75,0, 151,172,0, 255	  ;42
;PANTALLA 12
DEFB 33,56,50, 33,59,52, 33,45,39, 32,13,33, 32,14,21, 64,120,97,2, 64,187,65,2, 130,145, 151,148,0, 193,169,0,  255  	;32
;PANTALLA 13
DEFB 34,64,38, 33,12,50, 125,0,97,5, 64,76,97,2, 154,131,0, 130,180,  255   ;20
;PANTALLA 14
DEFB 33,0,34, 3,226, 34,13,37, 64,64,65,2, 131,51, 130,178,  33,236,33,  255    	;20
;PANTALLA 15
DEFB 3,2, 32,14,18, 34,0,21, 34,33,20,  131,68, 154,179,0, 154,75,0,  255	;20
;PANTALLA 16
DEFB 2,1, 32,32,49, 32,45,39, 154,113,0, 151,200,0, 37,5,21, 38,170,81, 133,100, 134,137,   255		;25
;PANTALLA 17
;PANTALLA 18
DEFB 33,0,40, 34,13,40, 63,157,65,69, 36,0,243, 0,66,22,2,7, 0,35,18,2,7, 0,4,14,2,7, 163,58,0,    255	;32
;PANTALLA 19
DEFB 4,2, 3,226, 32,78,19,  125,0,113,5, 125,13,17,5,  62,81,122,50, 61,97,104,71, 62,130,36,7, 61,146,19,71, 63,144,65,69, 150,146,0, 130,166, 155,185,0,  255   ;44




;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  2
;PANTALLA 20
DEFB 3,225, 3,2, 33,3,131, 96,13,7,16,1,2, 172,92,0, 172,170,0, 174,148,0, 197,136,0,   255             ;26
;PANTALLA 21
DEFB 3,225, 33,131,131, 33,158,17, 64,190,33,2, 172,57,0, 172,59,0,     255       ;19
;PANTALLA 22
DEFB 3,225, 3,226, 33,34,194, 33,98,147, 33,144,33, 96,18,1,22,1,2,  173,107,0, 173,108,1,  255        ;26
;PANTALLA 23
DEFB 3,2, 33,131,132, 172,85,0, 172,60,0,     255		;12
;PANTALLA 24
DEFB 33,98,50, 64,162,97,2, 131,86,    255        ;10
;PANTALLA 25
DEFB 33,50,34, 33,105,51, 3,226, 62,8,193,50, 64,114,65,2, 64,201,97,2, 172,117,0,     255    ;24
;PANTALLA 26
DEFB 3,2, 3,1, 33,129,81, 33,39,84, 132,51, 172,141,0, 172,195,0, 64,161,161,2, 64,167,161,2, 64,44,97,2,      255                ;31
;PANTALLA 27
DEFB 33,39,130, 3,1, 64,32,225,2, 96,13,15,16,1,2, 130,193, 151,186,0, 172,156,0,     255	;24
;PANTALLA 28
DEFB 33,0,243, 33,109,37, 37,5,21, 38,171,65, 64,96,129,2, 64,105,129,2, 33,103,35, 62,183,66,50, 62,232,162,50, 161,199,0, 151,193,0, 133,100, 134,138,    255         ;42

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  3
;PANTALLA 29
DEFB 9,226, 2,225, 33,0,39, 33,2,19, 37,133,20, 39,188,33, 64,98,33,2, 63,221,65,69, 162,170,128, 162,171,128, 156,54,0, 151,60,0, 157,195,0, 133,116,  255		;42
;PANTALLA 30
DEFB 9,226, 9,2, 33,160,51, 153,129,0, 154,99,0, 159,140,128, 160,181,128, 160,185,128, 169,43,0, 170,166,0, 170,168,1, 197,203,0,   255			;35
;PANTALLA 31
DEFB 9,226, 9,2, 169,37,0, 169,211,64, 169,184,0, 169,61,48, 171,81,1, 171,129,1, 171,93,0, 171,141,0,    255			;29
;PANTALLA 32
DEFB 9,226, 9,2, 33,96,49, 33,108,49, 36,0,243, 161,90,0, 163,55,0,  64,129,65,2, 64,140,65,2, 169,218,0,  255		;31

;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  4
;PANTALLA 33
DEFB 9,1, 9,2, 9,225, 9,226, 39,35,150, 31,1,17, 31,206,17, 61,211,33,71, 61,132,18,71, 61,68,33,71, 61,69,27,71, 61,213,161,71, 61,198,33,71, 61,41,29,71, 61,41,97,71, 93,11,8,1,9,71, 93,15,9,1,2,71, 93,14,20,1,2,71, 186,51,0, 186,53,0, 186,25,0, 186,212,0, 93,19,16,2,1,71, 93,17,12,1,2,71, 93,13,12,1,2,71,    255      ;98
;PANTALLA 34
DEFB 9,1, 9,2, 9,225, 9,226, 31,192,17, 39,38,38, 39,41,38, 31,70,35, 31,105,35, 43,68,21, 185,142,1, 186,54,0, 186,55,0, 186,201,0, 186,202,0,   255		;42
;PANTALLA 35
DEFB 36,0,248, 31,65,212, 61,56,17,71, 93,19,16,1,4,71, 62,69,65,79, 94,11,14,5,5,79, 61,71,52,71, 62,73,49,79, 185,128,0, 185,142,1, 187,86,0, 187,89,0,    255	   ;53
;PANTALLA 36
DEFB 9,1, 9,225, 9,2, 9,226, 43,68,37, 43,41,37, 31,46,17, 185,128,0,  255	;21
;PANTALLA 37                                                          31,72,17,
DEFB 9,1, 9,225, 9,2, 9,226, 43,35,21, 43,69,21, 43,70,82, 43,154,34,  39,60,21, 31,32,17, 31,13,17, 186,51,0, 186,197,0, 186,44,0,  255     ;39
;PANTALLA 38
DEFB 9,1, 9,2, 9,225, 9,226, 43,33,70, 31,66,52, 43,42,70, 31,74,52, 31,161,19, 31,93,33, 151,147,0, 153,88,128, 153,155,0,   255     ;36
;PANTALLA 39
DEFB 9,1, 9,2, 9,225, 9,226, 31,80,17, 39,35,21, 43,101,129, 43,133,19,  132,151, 62,187,35,79, 187,188,0,   255     ;30
;PANTALLA 40
;PANTALLA 41
DEFB 9,1, 9,225, 9,2, 9,226, 39,37,21, 43,58,22, 43,28,22, 31,94,17, 62,178,35,79, 132,81, 187,179,0, 186,27,0, 186,235,0,  255    ;39
;PANTALLA 42
DEFB 9,1, 9,225, 9,2, 9,226, 43,33,70, 31,66,52, 43,42,70, 31,74,52, 31,80,33, 31,173,19, 153,148,0, 153,86,128, 151,122,0,     255       ;36


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  5
;PANTALLA 43
;PANTALLA 44
;PANTALLA 45
DEFB 13,2, 13,226, 13,1, 6,225, 36,128,20, 36,142,20, 67,38,100,7, 61,7,54,71, 61,234,18,71, 187,38,0, 187,41,0, 151,115,0, 151,124,0, 156,181,0,     255       ;42
;PANTALLA 46
;PANTALLA 47
;PANTALLA 48
DEFB 13,225, 43,128,20, 43,142,20, 61,231,50,71, 34,32,19, 34,46,19, 34,65,81, 34,73,81, 125,10,33,5, 125,1,33,5, 67,86,33,69, 153,147,0, 153,123,128, 151,197,0, 170,72,1, 198,71,0,  255    ;52
;PANTALLA 49
;PANTALLA 50
;PANTALLA 51
;PANTALLA 52
;PANTALLA 53
;PANTALLA 54



;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  6
;PANTALLA 55
;PANTALLA 56
;PANTALLA 57
DEFB 33,0,40, 3,225, 134,131, 62,98,145,5, 62,118,23,5, 38,164,177, 161,82,0, 159,75,0,  255		;25
;PANTALLA 58
DEFB 2,226, 3,225, 32,233,97, 8,161, 130,116, 197,107,0,  255		;15
;PANTALLA 59
DEFB 33,0,40, 33,12,52, 64,140,97,2, 131,132, 125,2,81,5,  255		;17
;PANTALLA 60
DEFB 33,0,68, 3,1, 3,226, 32,206,18, 172,210,0, 151,182,0, 64,128,129,2, 96,9,9,20,1,2, 194,120,128,   255		;30


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  7
;PANTALLA 61
DEFB 4,2, 9,1, 9,225, 45,103,20, 43,42,21, 38,160,65, 134,130, 151,82,0, 151,69,0, 125,225,97,4, 125,1,65,4,   255	;32
;PANTALLA 62
DEFB 9,1, 9,225, 33,39,22, 33,82,145, 33,132,161, 31,119,17, 162,178,0, 162,61,128, 186,114,0, 186,125,0,   255		;29
;PANTALLA 63
DEFB 9,1, 9,225, 4,226, 31,110,19, 34,4,161, 34,231,113, 43,65,21, 36,38,21, 158,153,0, 154,107,0,    255		;28


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  8
;PANTALLA 64
DEFB 34,0,40, 13,194, 33,194,114, 125,233,49,104, 156,73,0, 134,133, 38,160,113,    255		;21
;PANTALLA 65
DEFB 44,13,40, 44,232,81, 125,224,65,104, 132,66, 158,70,128, 151,151,0, 151,107,0, 62,137,134,7, 93,16,20,7,5,71, 62,154,20,7, 62,171,20,7, 177,204,0, 150,138,0,   255	 ;46
;PANTALLA 66
DEFB 34,0,40, 13,194, 44,11,51, 131,116,   255			;11
;PANTALLA 67
DEFB 44,13,40, 44,104,51, 154,67,0, 154,177,0,    255		;13
;PANTALLA 68
DEFB 13,194, 125,0,113,105, 125,13,17,105, 34,64,38, 33,75,34, 44,203,50, 62,115,166,7, 93,15,8,8,4,71, 61,179,17,71, 151,132,0, 162,133,0, 162,166,128,    255   ;43
;PANTALLA 69
DEFB 2,1, 2,226, 32,36,81, 125,0,33,105, 44,173,35, 133,100, 37,5,21, 154,193,0, 154,91,0, 157,199,0,   255      ;29


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  9
;PANTALLA 70
DEFB 5,225, 34,0,40, 175,83,0, 158,185,0, 130,120, 133,116, 37,133,20,  255      ;19
;PANTALLA 71
DEFB 5,225, 36,131,148, 31,133,81, 31,167,19, 175,35,0, 175,76,0, 172,194,0, 172,204,0, 136,167,   255			;26
;PANTALLA 72
DEFB 5,225, 33,13,36, 32,141,36, 177,202,0, 172,67,0, 172,55,0, 172,166,0, 172,137,0,   255		;24
;PANTALLA 73
DEFB 34,0,40, 153,51,0, 175,164,0, 158,166,0, 175,168,0, 156,107,0,    255	;19
;PANTALLA 74
DEFB 175,84,0, 175,203,0, 135,133,    255      ;9
;PANTALLA 75
DEFB 33,13,40, 130,146, 151,91,0,  134,137, 38,170,81,     255		;14
;PANTALLA 76
DEFB 41,0,18, 34,64,38, 40,65,225, 42,1,226, 38,160,113, 134,133, 135,184,   255	;20
;PANTALLA 77
DEFB 42,0,242, 10,65, 33,5,101, 64,165,193,2,     255	;13
;PANTALLA 78
DEFB 42,0,226, 42,60,17, 40,64,193, 41,14,18, 33,77,38, 94,9,24,1,3,78, 176,91,0, 159,123,0, 175,154,0, 135,179,   255    ;33
;PANTALLA 79
DEFB 42,1,232, 11,2,  255		;6
;PANTALLA 80
DEFB 42,0,248, 33,133,100,  255		;7
;PANTALLA 81
DEFB 11,226, 42,0,232,    255		;6
;PANTALLA 82
DEFB 42,1,232, 11,2,   255		;6
;PANTALLA 83
DEFB 42,0,248, 31,85,83, 40,69,65, 41,68,19, 41,42,21, 33,163,113, 176,88,0, 157,121,0, 162,134,0, 162,135,0, 94,9,18,1,3,78,     255     ;37
;PANTALLA 84
DEFB 11,226, 42,0,232,  255		;6
;PANTALLA 85
DEFB 11,2, 125,0,113,5, 125,13,17,5, 42,65,230,   255		;14
;PANTALLA 86
DEFB 125,0,113,5, 125,13,17,5, 42,64,246,   255		;12
;PANTALLA 87
DEFB 11,226, 33,62,21, 125,0,113,5, 125,13,17,5, 34,66,35, 34,132,65, 42,64,38, 42,162,99, 42,200,98, 154,85,0, 132,89, 176,184,0, 62,199,81,78, 33,185,81,     255 	;44



;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  10
;PANTALLA 88
DEFB 6,2, 36,1,180, 6,226, 6,225, 36,13,20, 36,171,18, 36,163,18, 62,161,65,7, 62,172,65,7, 186,228,0, 186,234,0, 61,3,22,71, 61,5,24,71, 61,85,161,71, 61,7,20,71, 61,55,65,71, 61,11,35,71, 93,7,20,1,5,71, 184,199,0,     255		;66
;PANTALLA 89
DEFB 6,2, 6,1, 36,45,39, 36,193,162, 36,41,39, 36,91,33, 36,171,33, 31,7,17, 61,195,20,71, 61,197,20,71, 61,199,20,71, 93,11,20,1,12,71, 61,74,33,71, 61,171,18,71, 63,61,65,69, 63,141,65,69,   255     ;57


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  11
;PANTALLA 90
DEFB 5,225, 34,0,37, 33,160,67, 137,117, 151,52,0, 151,57,0, 154,60,0, 154,136,0, 151,200,0, 177,197,0,    255   ;29
;PANTALLA 91
DEFB 5,225, 44,13,40, 44,234,49, 137,147, 179,82,0, 180,42,0,    255           ;17
;PANTALLA 92
DEFB 34,0,40, 179,83,0, 137,150,    255                             ;9
;PANTALLA 93
DEFB 44,13,40, 44,58,50, 36,122,34, 36,203,49, 179,67,0, 180,164,0, 180,88,0, 159,201,128,    255      ;25
;PANTALLA 94
DEFB 33,0,82, 33,64,50, 34,128,36, 38,160,65, 134,130, 159,85,0, 158,198,128, 159,152,128, 180,90,0, 64,67,65,2,   255     ;31
;PANTALLA 95
DEFB 137,147, 180,149,0, 179,91,0, 44,13,40, 255                 ;12
;PANTALLA 96
DEFB 15,2, 33,160,83, 151,50,0, 151,86,0, 181,42,0, 181,124,128,  255	;18
;PANTALLA 97
DEFB 15,226, 44,173,35, 181,67,0, 181,152,128, 183,91,0, 180,187,0, 135,101,   255	;20
;PANTALLA 98
DEFB 15,2, 153,99,0, 156,165,0, 183,73,0, 181,61,0, 181,187,128,   255	     ;18
;PANTALLA 99
DEFB 15,226, 152,97,0, 181,149,128, 181,54,0, 152,183,0, 152,57,0, 183,91,0, 181,186,128, 182,120,0, 182,121,1, 197,172,0, 196,83,0, 255      ;36
;PANTALLA 100
DEFB 15,2, 15,1, 125,0,65,5, 125,8,33,4, 152,146,0, 160,163,0, 152,181,0, 152,150,0, 158,116,0, 45,40,81,   255         ;31
;PANTALLA 101
DEFB 15,226, 15,1, 181,115,0, 183,91,0, 135,180,   255		;13


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  12
;PANTALLA 102
;PANTALLA 103
;PANTALLA 104
;PANTALLA 105
;PANTALLA 106
;PANTALLA 107
;PANTALLA 108
;PANTALLA 109
;PANTALLA 110
;PANTALLA 111
;PANTALLA 112
;PANTALLA 113



;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  13
;PANTALLA 114
DEFB 36,0,248, 31,129,51, 61,155,101,71, 61,103,20,71, 61,164,225,71, 93,13,16,15,1,71, 184,193,0,    255	;28
;PANTALLA 115
DEFB 17,225, 6,2, 36,1,35, 61,96,65,71, 192,220,0, 47,67,193, 46,98,209,  255  ;21
;PANTALLA 116
DEFB 17,225, 18,226, 48,2,21, 47,80,33, 46,112,33, 192,214,0, 191,204,0,  255	;20
;PANTALLA 117
;PANTALLA 118
DEFB 18,34, 16,145, 17,113, 31,119,34, 191,81,0, 191,92,0, 192,100,0,   255	;19
;PANTALLA 119
DEFB 48,162,19, 17,113, 16,145, 18,226, 31,120,34, 191,82,0, 191,90,0,  255	;19
;PANTALLA 120
;PANTALLA 121
DEFB 18,34, 48,10,20, 47,138,81, 46,170,81, 191,107,0,  255			;15
;PANTALLA 122
DEFB 16,161, 17,129, 18,226, 48,2,19, 191,107,0, 192,118,0,  255		;16
;PANTALLA 123
;PANTALLA 124
DEFB 16,1, 18,34, 48,74,22,   255						;8
;PANTALLA 125
DEFB 46,0,209, 18,34, 18,226, 62,12,49,70, 36,14,19,   255			;15


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;M U N D O  V I A S
	;A
;PANTALLA 126
DEFB 247
	;B
;PANTALLA 127
DEFB 254
;PANTALLA 128
DEFB 252
;PANTALLA 129
DEFB 253
;PANTALLA 130
DEFB 251
;PANTALLA 131
DEFB 251
;PANTALLA 132
DEFB 254
	;C
;PANTALLA 133
DEFB 244
;PANTALLA 134
DEFB 244
;PANTALLA 135
DEFB 249
;PANTALLA 136
DEFB 248
;PANTALLA 137
DEFB 247
	;D
;PANTALLA 138
DEFB 252
;PANTALLA 139
DEFB 253
;PANTALLA 140
DEFB 251	;(*)
;PANTALLA 141
DEFB 254
	;E
;PANTALLA 142
DEFB 250
;PANTALLA 143
DEFB 244
;PANTALLA 144
DEFB 244
;PANTALLA 145
DEFB 249
	;F
;PANTALLA 146
DEFB 252
;PANTALLA 147
DEFB 252	;(*)
;PANTALLA 148
DEFB 253
;PANTALLA 149
DEFB 251
;PANTALLA 150
DEFB 251
	;G
;PANTALLA 151
DEFB 247
;PANTALLA 152
DEFB 248    


;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;ESPECIALES

;PANTALLA 153   CLAVE DE COLOR
DEFB 36,0,248, 31,130,178, 31,74,50, 61,189,65,71, 0,168,10,1,7, 184,163,0, 184,164,0, 184,165,0, 184,166,0, 184,167,0, 184,168,0,    255       ;37



;--------------------------------------------------------------------------
;--------------------------------------------------------------------------
;DESIERTO

BUFFER_DESIERTO:
DEFB 7,7,4,7,7,4,10,7,4,7,4,7,7,7,3,3

DESIERTO_MAP:
;PANT DESIERT 0
DEFB 188,67,0, 188,169,0,		255	;7

;PANT DESIERT 1
DEFB 189,148,0, 189,90,0,		255	;7

;PANT DESIERT 2
DEFB 189,69,0,  			255	;4

;PANT DESIERT 3
DEFB 188,119,0, 189,155,0,		255	;7

;PANT DESIERT 4
DEFB 189,178,0, 189,72,0,		255	;7

;PANT DESIERT 5
DEFB 188,76,0, 				255	;4

;PANT DESIERT 6
DEFB 189,197,0, 189,152,0, 189,204,0,	255	;10

;PANT DESIERT 7
DEFB 188,49,0, 189,84,0,		255	;7

;PANT DESIERT 8
DEFB 189,134,0, 			255	;4

;PANT DESIERT 9
DEFB 188,199,0, 189,86,0,		255	;7

;PANT DESIERT 10
DEFB 189,109,0,				255	;4

;PANT DESIERT 11
DEFB 180,104,0, 189,91,0,		255	;7

;PANT DESIERT 12
DEFB 180,68,0, 180,169,0,		255	;7

;PANT DESIERT 13
DEFB 188,147,0, 189,118,0, 		255	;7

;PANT DESIERT 14
DEFB 138,101,				255	;3

;PANT DESIERT 15
DEFB 138,50,				255	;3



DESIERTO_60x60:
DEFB 182,85,0, 182,86,1, 152,104,0, 152,105,0, 181,106,0, 181,82,128,    255
DESIERTO_80x85:
DEFB 32,69,81, 45,104,50, 132,100, 189,146,0, 189,172,0, 189,75,0, 162,184,0,  255



;ADEMAS Y=120  15,1  Y=0 15,225  X=0 15,2   X=120 15,226


;PANTALLA VENTANA CLAVE DE COLOR DE PANT 93
VENTANA_KOLOR:
DEFB  49,50,181, 100,9,5,22,1,69, 100,19,5,22,1,69, 68,34,26,69, 100,9,26,1,10,69,  98,14,10,12,1,69,   255

;PANTALLA BOLITAS EN NAVECITA
BOLILLAS_NAVECITA:
DEFB 101,7,1,1,7,2, 101,7,30,1,7,2, 101,7,1,30,1,2,  255

;MARCO BOLITAS PARA JUEGOS EXTRA
MARCO_BOLITAS_EXTRA:
DEFB 101,12,5,22,10,67, 93,13,6,20,8,0,  255

;EXTRA FAR CRY
FONDO_FARCRY:
DEFB 93,13,6,20,7,79, 102,13,6,4,2,76, 105,20,6,20,1,76, 71,131,21,78, 200,165,0, 201,165,0,   255
;EXTRA CALL DUTY
FONDO_CALLDUTY:
DEFB 93,13,6,20,7,79, 102,13,6,4,3,76, 105,20,6,20,1,76, 72,131,21,74, 200,165,0,    255
;EXTRA JARL LIFE
FONDO_JARLLIFE:
DEFB 202,165,0,   255



