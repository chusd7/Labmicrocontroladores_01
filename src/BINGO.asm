;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"BINGO.c"
	list	p=12f683
	radix dec
	include "p12f683.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__divsint
	extern	__modsint
	extern	__moduint
	extern	_ANSEL
	extern	_TRISIO
	extern	_CMCON0
	extern	_GPIO
	extern	_GPIObits
	extern	__gptrget1
	extern	__gptrput2
	extern	__gptrget2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_turn_off_display
	global	_display_numberu
	global	_display_numberd
	global	_numero_aleatorio
	global	_delay
	global	_SEGMENT_VALUES
	global	_lfsr

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_BINGO_0	udata
r0x100A	res	1
r0x1009	res	1
r0x100B	res	1
r0x100C	res	1
r0x100D	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1019	res	1
r0x1018	res	1
_numero_aleatorio_numero_65536_47	res	4
_main_n_65537_55	res	3
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_BINGO_0	idata
_lfsr
	db	0xe1, 0xac	; 44257


IDC_BINGO_1	code
_SEGMENT_VALUES
	retlw 0x3f	; 63
	retlw 0x06	; 6
	retlw 0x5b	; 91
	retlw 0x4f	; 79	'O'
	retlw 0x66	; 102	'f'
	retlw 0x6d	; 109	'm'
	retlw 0x7d	; 125
	retlw 0x07	; 7
	retlw 0x7f	; 127
	retlw 0x6f	; 111	'o'
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_BINGO	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   _display_numberu
;   _delay
;   __gptrget2
;   _display_numberd
;   _delay
;   __gptrget2
;   _display_numberu
;   _delay
;   __gptrget2
;   _display_numberd
;   _delay
;   _numero_aleatorio
;   _turn_off_display
;   __gptrput2
;   __gptrput2
;   __gptrget2
;   _display_numberu
;   _delay
;   __gptrget2
;   _display_numberd
;   _delay
;   __gptrget2
;   _display_numberu
;   _delay
;   __gptrget2
;   _display_numberd
;   _delay
;   _numero_aleatorio
;   _turn_off_display
;11 compiler assigned registers:
;   r0x1013
;   r0x1014
;   r0x1015
;   STK02
;   STK03
;   STK01
;   STK00
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;; Starting pCode block
S_BINGO__main	code
_main:
; 2 exit points
;	.line	107; "BINGO.c"	TRISIO = 0b00001000 ; // Se configura gp3 como entrada los demas como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	108; "BINGO.c"	ANSEL = 0b00001000; // Set GP3 as digital input
	MOVLW	0x08
	MOVWF	_ANSEL
;	.line	109; "BINGO.c"	CMCON0 = 0x07; //Se apagan los comparadores
	MOVLW	0x07
	BANKSEL	_CMCON0
	MOVWF	_CMCON0
;	.line	110; "BINGO.c"	GPIO = 0x00; //Inicializan todos los pines en 0 
	CLRF	_GPIO
;	.line	111; "BINGO.c"	S0 = 0;
	BCF	_GPIObits,4
;	.line	112; "BINGO.c"	S1 = 0;
	BCF	_GPIObits,2
;	.line	113; "BINGO.c"	S2 = 0;
	BCF	_GPIObits,1
;	.line	114; "BINGO.c"	S3 = 0;
	BCF	_GPIObits,0
;	.line	121; "BINGO.c"	while(1) {
	BANKSEL	r0x1013
	CLRF	r0x1013
	CLRF	r0x1014
_00162_DS_:
;	.line	122; "BINGO.c"	if (i==0 && GP3==1){
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	IORWF	r0x1013,W
	BTFSS	STATUS,2
	GOTO	_00007_DS_
	CLRF	r0x1015
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,3
	GOTO	_00001_DS_
	BANKSEL	r0x1015
	INCF	r0x1015,F
_00001_DS_:
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00007_DS_
;	.line	123; "BINGO.c"	n->Unid=0;
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK03
	BANKSEL	_main_n_65537_55
	MOVF	_main_n_65537_55,W
	MOVWF	STK01
	MOVF	(_main_n_65537_55 + 1),W
	MOVWF	STK00
	MOVF	(_main_n_65537_55 + 2),W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
;	.line	124; "BINGO.c"	n->Decen=0;
	MOVLW	0x02
	BANKSEL	_main_n_65537_55
	ADDWF	_main_n_65537_55,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	CLRF	r0x1016
	RLF	r0x1016,F
	BANKSEL	_main_n_65537_55
	MOVF	(_main_n_65537_55 + 1),W
	BANKSEL	r0x1016
	ADDWF	r0x1016,F
	CLRF	r0x1017
	RLF	r0x1017,F
	BANKSEL	_main_n_65537_55
	MOVF	(_main_n_65537_55 + 2),W
	BANKSEL	r0x1017
	ADDWF	r0x1017,F
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK01
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVF	r0x1017,W
	PAGESEL	__gptrput2
	CALL	__gptrput2
	PAGESEL	$
;	.line	125; "BINGO.c"	display_numberu(n->Unid);
	BANKSEL	_main_n_65537_55
	MOVF	_main_n_65537_55,W
	MOVWF	STK01
	MOVF	(_main_n_65537_55 + 1),W
	MOVWF	STK00
	MOVF	(_main_n_65537_55 + 2),W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	_display_numberu
	CALL	_display_numberu
	PAGESEL	$
;	.line	126; "BINGO.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	127; "BINGO.c"	GP5 = ~GP5;
	BANKSEL	r0x1019
	CLRF	r0x1019
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00002_DS_
	BANKSEL	r0x1019
	INCF	r0x1019,F
_00002_DS_:
	BANKSEL	r0x1019
	COMF	r0x1019,W
	MOVWF	r0x1019
	RRF	r0x1019,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00003_DS_:
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00004_DS_:
;	.line	128; "BINGO.c"	display_numberd(n->Decen);
	BANKSEL	r0x1015
	MOVF	r0x1015,W
	MOVWF	STK01
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVF	r0x1017,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	_display_numberd
	CALL	_display_numberd
	PAGESEL	$
;	.line	129; "BINGO.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	130; "BINGO.c"	GP5 = ~GP5; 
	BANKSEL	r0x1015
	CLRF	r0x1015
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00005_DS_
	BANKSEL	r0x1015
	INCF	r0x1015,F
_00005_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1015
	RRF	r0x1015,W
	BTFSC	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00006_DS_:
	BTFSS	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00007_DS_:
;	.line	132; "BINGO.c"	display_numberu(n->Unid);
	BANKSEL	_main_n_65537_55
	MOVF	_main_n_65537_55,W
	MOVWF	STK01
	MOVF	(_main_n_65537_55 + 1),W
	MOVWF	STK00
	MOVF	(_main_n_65537_55 + 2),W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
	MOVWF	r0x1015
	MOVWF	STK00
	MOVF	r0x1016,W
	PAGESEL	_display_numberu
	CALL	_display_numberu
	PAGESEL	$
;	.line	133; "BINGO.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	134; "BINGO.c"	GP5 = ~GP5;
	BANKSEL	r0x1015
	CLRF	r0x1015
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00008_DS_
	BANKSEL	r0x1015
	INCF	r0x1015,F
_00008_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1015
	RRF	r0x1015,W
	BTFSC	STATUS,0
	GOTO	_00009_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00009_DS_:
	BTFSS	STATUS,0
	GOTO	_00010_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00010_DS_:
;	.line	135; "BINGO.c"	display_numberd(n->Decen);
	MOVLW	0x02
	BANKSEL	_main_n_65537_55
	ADDWF	_main_n_65537_55,W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	CLRF	r0x1016
	RLF	r0x1016,F
	BANKSEL	_main_n_65537_55
	MOVF	(_main_n_65537_55 + 1),W
	BANKSEL	r0x1016
	ADDWF	r0x1016,F
	CLRF	r0x1017
	RLF	r0x1017,F
	BANKSEL	_main_n_65537_55
	MOVF	(_main_n_65537_55 + 2),W
	BANKSEL	r0x1017
	ADDWF	r0x1017,F
	MOVF	r0x1015,W
	MOVWF	STK01
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVF	r0x1017,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	_display_numberd
	CALL	_display_numberd
	PAGESEL	$
;	.line	136; "BINGO.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	137; "BINGO.c"	GP5 = ~GP5; 
	BANKSEL	r0x1015
	CLRF	r0x1015
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00011_DS_
	BANKSEL	r0x1015
	INCF	r0x1015,F
_00011_DS_:
	BANKSEL	r0x1015
	COMF	r0x1015,W
	MOVWF	r0x1015
	RRF	r0x1015,W
	BTFSC	STATUS,0
	GOTO	_00012_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00012_DS_:
	BTFSS	STATUS,0
	GOTO	_00013_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00013_DS_:
;	.line	141; "BINGO.c"	if (GP3 == 0) {  // Check if GP3 is low (button pressed)
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	GOTO	_00162_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x11=17), size=2, mask=ffff
;	.line	142; "BINGO.c"	if(i<=16){
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00186_DS_
	MOVLW	0x11
	SUBWF	r0x1013,W
_00186_DS_:
	BTFSC	STATUS,0
	GOTO	_00157_DS_
;;genSkipc:3307: created from rifx:0x7fff1ca2fb80
;	.line	146; "BINGO.c"	n=numero_aleatorio();
	PAGESEL	_numero_aleatorio
	CALL	_numero_aleatorio
	PAGESEL	$
	BANKSEL	_main_n_65537_55
	MOVWF	(_main_n_65537_55 + 2)
	MOVF	STK00,W
	MOVWF	(_main_n_65537_55 + 1)
	MOVF	STK01,W
	MOVWF	_main_n_65537_55
;	.line	147; "BINGO.c"	i++;
	BANKSEL	r0x1013
	INCF	r0x1013,F
	BTFSC	STATUS,2
	INCF	r0x1014,F
	GOTO	_00162_DS_
_00157_DS_:
;	.line	150; "BINGO.c"	turn_off_display();
	PAGESEL	_turn_off_display
	CALL	_turn_off_display
	PAGESEL	$
	GOTO	_00162_DS_
;	.line	160; "BINGO.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _delay
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _delay
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _delay
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   _delay
;4 compiler assigned registers:
;   STK01
;   STK00
;   r0x1011
;   r0x1012
;; Starting pCode block
S_BINGO__turn_off_display	code
_turn_off_display:
; 2 exit points
;	.line	91; "BINGO.c"	S0 = ((SEGMENT_VALUES[0] >> 0) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00014_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00014_DS_:
	BTFSS	STATUS,0
	GOTO	_00015_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00015_DS_:
;	.line	92; "BINGO.c"	S1 = ((SEGMENT_VALUES[0] >> 1) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00016_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00016_DS_:
	BTFSS	STATUS,0
	GOTO	_00017_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00017_DS_:
;	.line	93; "BINGO.c"	S2 = ((SEGMENT_VALUES[0] >> 2) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00018_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00018_DS_:
	BTFSS	STATUS,0
	GOTO	_00019_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00019_DS_:
;	.line	94; "BINGO.c"	S3 = ((SEGMENT_VALUES[0] >> 3) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00020_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00020_DS_:
	BTFSS	STATUS,0
	GOTO	_00021_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00021_DS_:
;	.line	95; "BINGO.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	96; "BINGO.c"	GP5 = ~GP5;
	BANKSEL	r0x1011
	CLRF	r0x1011
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00022_DS_
	BANKSEL	r0x1011
	INCF	r0x1011,F
_00022_DS_:
	BANKSEL	r0x1011
	COMF	r0x1011,W
	MOVWF	r0x1011
	RRF	r0x1011,W
	BTFSC	STATUS,0
	GOTO	_00023_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00023_DS_:
	BTFSS	STATUS,0
	GOTO	_00024_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00024_DS_:
;	.line	97; "BINGO.c"	S0 = ((SEGMENT_VALUES[0] >> 0) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00025_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00025_DS_:
	BTFSS	STATUS,0
	GOTO	_00026_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00026_DS_:
;	.line	98; "BINGO.c"	S1 = ((SEGMENT_VALUES[0] >> 1) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00027_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00027_DS_:
	BTFSS	STATUS,0
	GOTO	_00028_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00028_DS_:
;	.line	99; "BINGO.c"	S2 = ((SEGMENT_VALUES[0] >> 2) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00029_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00029_DS_:
	BTFSS	STATUS,0
	GOTO	_00030_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00030_DS_:
;	.line	100; "BINGO.c"	S3 = ((SEGMENT_VALUES[0] >> 3) & 1);
	MOVLW	(_SEGMENT_VALUES + 0)
	MOVWF	STK01
	MOVLW	high (_SEGMENT_VALUES + 0)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x1012
	RRF	r0x1012,W
	BTFSC	STATUS,0
	GOTO	_00031_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00031_DS_:
	BTFSS	STATUS,0
	GOTO	_00032_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00032_DS_:
;	.line	101; "BINGO.c"	delay(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	102; "BINGO.c"	GP5 = ~GP5;
	BANKSEL	r0x1011
	CLRF	r0x1011
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00033_DS_
	BANKSEL	r0x1011
	INCF	r0x1011,F
_00033_DS_:
	BANKSEL	r0x1011
	COMF	r0x1011,W
	MOVWF	r0x1011
	RRF	r0x1011,W
	BTFSC	STATUS,0
	GOTO	_00034_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00034_DS_:
	BTFSS	STATUS,0
	GOTO	_00035_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00035_DS_:
;	.line	104; "BINGO.c"	}
	RETURN	
; exit point of _turn_off_display

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;6 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   STK01
;   r0x100B
;   r0x100C
;; Starting pCode block
S_BINGO__display_numberu	code
_display_numberu:
; 2 exit points
;	.line	79; "BINGO.c"	void display_numberu(int u){
	BANKSEL	r0x1009
	MOVWF	r0x1009
	MOVF	STK00,W
;	.line	82; "BINGO.c"	S0 = ((SEGMENT_VALUES[u] >> 0) & 1);
	MOVWF	r0x100A
	ADDLW	(_SEGMENT_VALUES + 0)
	MOVWF	r0x100A
	MOVF	r0x1009,W
	BTFSC	STATUS,0
	INCFSZ	r0x1009,W
	ADDLW	high (_SEGMENT_VALUES + 0)
	MOVWF	r0x1009
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x01
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00036_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00036_DS_:
	BTFSS	STATUS,0
	GOTO	_00037_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00037_DS_:
;	.line	83; "BINGO.c"	S1 = ((SEGMENT_VALUES[u] >> 1) & 1);
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00038_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00038_DS_:
	BTFSS	STATUS,0
	GOTO	_00039_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00039_DS_:
;	.line	84; "BINGO.c"	S2 = ((SEGMENT_VALUES[u] >> 2) & 1);
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00040_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00040_DS_:
	BTFSS	STATUS,0
	GOTO	_00041_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00041_DS_:
;	.line	85; "BINGO.c"	S3 = ((SEGMENT_VALUES[u] >> 3) & 1);
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x100A
	RRF	r0x100A,W
	BTFSC	STATUS,0
	GOTO	_00042_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00042_DS_:
	BTFSS	STATUS,0
	GOTO	_00043_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00043_DS_:
;	.line	88; "BINGO.c"	}
	RETURN	
; exit point of _display_numberu

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;   __gptrget1
;6 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   STK01
;   r0x100B
;   r0x100C
;; Starting pCode block
S_BINGO__display_numberd	code
_display_numberd:
; 2 exit points
;	.line	69; "BINGO.c"	void display_numberd(int d) {
	BANKSEL	r0x1009
	MOVWF	r0x1009
	MOVF	STK00,W
;	.line	72; "BINGO.c"	S0 = ((SEGMENT_VALUES[d] >> 0) & 1);
	MOVWF	r0x100A
	ADDLW	(_SEGMENT_VALUES + 0)
	MOVWF	r0x100A
	MOVF	r0x1009,W
	BTFSC	STATUS,0
	INCFSZ	r0x1009,W
	ADDLW	high (_SEGMENT_VALUES + 0)
	MOVWF	r0x1009
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x01
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00044_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00044_DS_:
	BTFSS	STATUS,0
	GOTO	_00045_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00045_DS_:
;	.line	73; "BINGO.c"	S1 = ((SEGMENT_VALUES[d] >> 1) & 1);
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x02
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00046_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00046_DS_:
	BTFSS	STATUS,0
	GOTO	_00047_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00047_DS_:
;	.line	74; "BINGO.c"	S2 = ((SEGMENT_VALUES[d] >> 2) & 1);
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x04
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x100C
	RRF	r0x100C,W
	BTFSC	STATUS,0
	GOTO	_00048_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00048_DS_:
	BTFSS	STATUS,0
	GOTO	_00049_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00049_DS_:
;	.line	75; "BINGO.c"	S3 = ((SEGMENT_VALUES[d] >> 3) & 1);
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0x08
	BTFSS	STATUS,2
	MOVLW	0x01
	MOVWF	r0x100A
	RRF	r0x100A,W
	BTFSC	STATUS,0
	GOTO	_00050_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00050_DS_:
	BTFSS	STATUS,0
	GOTO	_00051_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00051_DS_:
;	.line	78; "BINGO.c"	}
	RETURN	
; exit point of _display_numberd

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __modsint
;   __divsint
;   __modsint
;   __moduint
;   __modsint
;   __divsint
;   __modsint
;9 compiler assigned registers:
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   STK02
;   STK01
;   STK00
;; Starting pCode block
S_BINGO__numero_aleatorio	code
_numero_aleatorio:
; 2 exit points
;	.line	56; "BINGO.c"	bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1;
	BANKSEL	_lfsr
	MOVF	_lfsr,W
	BANKSEL	r0x1009
	MOVWF	r0x1009
	BANKSEL	_lfsr
	MOVF	(_lfsr + 1),W
	BANKSEL	r0x100A
	MOVWF	r0x100A
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
	BCF	STATUS,0
	BANKSEL	_lfsr
	RRF	(_lfsr + 1),W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	BANKSEL	_lfsr
	RRF	_lfsr,W
	BANKSEL	r0x100C
	MOVWF	r0x100C
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x100B,F
	RRF	r0x100C,F
	MOVF	r0x100C,W
	XORWF	r0x1009,F
	MOVF	r0x100B,W
	XORWF	r0x100A,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
	BCF	STATUS,0
	BANKSEL	_lfsr
	RRF	(_lfsr + 1),W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	BANKSEL	_lfsr
	RRF	_lfsr,W
	BANKSEL	r0x100C
	MOVWF	r0x100C
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x100B,F
	RRF	r0x100C,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x100B,F
	RRF	r0x100C,F
	MOVF	r0x100C,W
	XORWF	r0x1009,F
	MOVF	r0x100B,W
	XORWF	r0x100A,F
	BANKSEL	_lfsr
	SWAPF	_lfsr,W
	ANDLW	0x0f
	BANKSEL	r0x100C
	MOVWF	r0x100C
	BANKSEL	_lfsr
	SWAPF	(_lfsr + 1),W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	ANDLW	0xf0
	IORWF	r0x100C,F
	XORWF	r0x100B,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x100B,F
	RRF	r0x100C,F
	MOVF	r0x100C,W
	XORWF	r0x1009,F
	MOVF	r0x100B,W
	XORWF	r0x100A,F
	MOVLW	0x01
	ANDWF	r0x1009,F
	CLRF	r0x100A
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
;	.line	58; "BINGO.c"	lfsr = (lfsr >> 1) | (bit << 15);
	BCF	STATUS,0
	BANKSEL	_lfsr
	RRF	(_lfsr + 1),W
	BANKSEL	r0x100B
	MOVWF	r0x100B
	BANKSEL	_lfsr
	RRF	_lfsr,W
	MOVWF	_lfsr
	BANKSEL	r0x100C
	MOVWF	r0x100C
	RRF	r0x1009,W
	CLRF	r0x100D
	RRF	r0x100D,F
;;1	CLRF	r0x100E
;;99	MOVF	r0x100C,W
	MOVF	r0x100D,W
	IORWF	r0x100B,W
	BANKSEL	_lfsr
	MOVWF	(_lfsr + 1)
;	.line	61; "BINGO.c"	aux=lfsr % 100;
	MOVLW	0x64
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	_lfsr,W
	MOVWF	STK00
	MOVF	(_lfsr + 1),W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x1009
;	.line	63; "BINGO.c"	numero.Unid = aux % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	STK00,W
	MOVWF	r0x100C
	BANKSEL	_numero_aleatorio_numero_65536_47
	MOVWF	(_numero_aleatorio_numero_65536_47 + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	BANKSEL	_numero_aleatorio_numero_65536_47
	MOVWF	(_numero_aleatorio_numero_65536_47 + 1)
;	.line	64; "BINGO.c"	numero.Decen = (aux / 10) % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x1009
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x1009
	BANKSEL	_numero_aleatorio_numero_65536_47
	MOVWF	(_numero_aleatorio_numero_65536_47 + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	BANKSEL	_numero_aleatorio_numero_65536_47
	MOVWF	(_numero_aleatorio_numero_65536_47 + 3)
;	.line	65; "BINGO.c"	return &numero;
	MOVLW	high (_numero_aleatorio_numero_65536_47 + 0)
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVLW	(_numero_aleatorio_numero_65536_47 + 0)
	MOVWF	r0x1009
	CLRF	r0x100C
	MOVF	r0x1009,W
	MOVWF	STK01
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVLW	0x00
;	.line	66; "BINGO.c"	}
	RETURN	
; exit point of _numero_aleatorio

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;; Starting pCode block
S_BINGO__delay	code
_delay:
; 2 exit points
;	.line	26; "BINGO.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1009
	MOVWF	r0x1009
	MOVF	STK00,W
	MOVWF	r0x100A
;	.line	31; "BINGO.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x100B
	CLRF	r0x100C
_00111_DS_:
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	SUBWF	r0x100C,W
	BTFSS	STATUS,2
	GOTO	_00132_DS_
	MOVF	r0x100A,W
	SUBWF	r0x100B,W
_00132_DS_:
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3307: created from rifx:0x7fff1ca2fb80
;	.line	32; "BINGO.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVLW	0x04
	MOVWF	r0x100E
_00109_DS_:
	MOVLW	0xff
	BANKSEL	r0x100D
	ADDWF	r0x100D,W
	MOVWF	r0x100F
	MOVLW	0xff
	MOVWF	r0x1010
	MOVF	r0x100E,W
	BTFSC	STATUS,0
	INCFSZ	r0x100E,W
	ADDWF	r0x1010,F
	MOVF	r0x100F,W
	MOVWF	r0x100D
	MOVF	r0x1010,W
	MOVWF	r0x100E
	MOVF	r0x1010,W
	IORWF	r0x100F,W
	BTFSS	STATUS,2
	GOTO	_00109_DS_
;	.line	31; "BINGO.c"	for(i=0;i<tiempo;i++)
	INCF	r0x100B,F
	BTFSC	STATUS,2
	INCF	r0x100C,F
	GOTO	_00111_DS_
_00113_DS_:
;	.line	33; "BINGO.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  705+  236 =   941 instructions ( 2354 byte)

	end
