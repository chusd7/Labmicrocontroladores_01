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
	extern	__gptrget2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_numero_aleatorio
	global	_lfsr
	global	_bit7
	global	_bit6
	global	_bit5
	global	_bit4
	global	_bit3
	global	_bit2
	global	_bit1
	global	_bit0
	global	_delay

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
UD_BINGO_0	udata
_bit0	res	2

UD_BINGO_1	udata
_bit1	res	2

UD_BINGO_2	udata
_bit2	res	2

UD_BINGO_3	udata
_bit3	res	2

UD_BINGO_4	udata
_bit4	res	2

UD_BINGO_5	udata
_bit5	res	2

UD_BINGO_6	udata
_bit6	res	2

UD_BINGO_7	udata
_bit7	res	2

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_BINGO_0	udata
r0x101E	res	1
r0x101F	res	1
r0x1021	res	1
r0x1020	res	1
r0x1022	res	1
r0x1024	res	1
r0x1025	res	1
r0x1028	res	1
r0x1027	res	1
r0x1026	res	1
r0x102A	res	1
r0x1029	res	1
r0x1017	res	1
r0x1016	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
_numero_aleatorio_numero_65536_44	res	4
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_BINGO_0	idata
_lfsr
	db	0xe1, 0xac	; 44257

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
;   _numero_aleatorio
;   __gptrget2
;   __gptrget2
;   _delay
;   _numero_aleatorio
;   __gptrget2
;   __gptrget2
;   _delay
;9 compiler assigned registers:
;   r0x1024
;   r0x1025
;   r0x1026
;   STK00
;   r0x1027
;   STK01
;   r0x1028
;   r0x1029
;   r0x102A
;; Starting pCode block
S_BINGO__main	code
_main:
; 2 exit points
;	.line	58; "BINGO.c"	TRISIO = 0b00001000 ; // Se configura gp3 como entrada los demas como salidas
	MOVLW	0x08
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	59; "BINGO.c"	ANSEL = 0; //Todas las entradas se dejan como digitales
	CLRF	_ANSEL
;	.line	60; "BINGO.c"	CMCON0 = 0x07; //Se apagan los comparadores
	MOVLW	0x07
	BANKSEL	_CMCON0
	MOVWF	_CMCON0
;	.line	61; "BINGO.c"	GPIO = 0x00; //Inicializan todos los pines en 0 
	CLRF	_GPIO
;	.line	73; "BINGO.c"	while(1) {
	BANKSEL	r0x1024
	CLRF	r0x1024
	CLRF	r0x1025
_00154_DS_:
;	.line	74; "BINGO.c"	if (GP3 == 0) {  // Check if GP3 is low (button pressed)
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	GOTO	_00154_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x11=17), size=2, mask=ffff
;	.line	75; "BINGO.c"	if(i<=16){
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00250_DS_
	MOVLW	0x11
	SUBWF	r0x1024,W
_00250_DS_:
	BTFSC	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3307: created from rifx:0x7fff627e2e60
;	.line	79; "BINGO.c"	struct Numero_total* n=numero_aleatorio();
	PAGESEL	_numero_aleatorio
	CALL	_numero_aleatorio
	PAGESEL	$
	BANKSEL	r0x1026
	MOVWF	r0x1026
	MOVF	STK00,W
	MOVWF	r0x1027
	MOVF	STK01,W
;	.line	80; "BINGO.c"	if(n->Unid == 0){
	MOVWF	r0x1028
	MOVWF	STK01
	MOVF	r0x1027,W
	MOVWF	STK00
	MOVF	r0x1026,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	STK00,W
	MOVWF	r0x102A
	IORWF	r0x1029,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	81; "BINGO.c"	bit0 = 0;
	BANKSEL	_bit0
	CLRF	_bit0
	CLRF	(_bit0 + 1)
;	.line	82; "BINGO.c"	bit1 = 0;
	BANKSEL	_bit1
	CLRF	_bit1
	CLRF	(_bit1 + 1)
;	.line	83; "BINGO.c"	bit2 = 0;
	BANKSEL	_bit2
	CLRF	_bit2
	CLRF	(_bit2 + 1)
;	.line	84; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	85; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00110_DS_:
;	.line	88; "BINGO.c"	if(n->Unid == 1){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00112_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00112_DS_
;	.line	89; "BINGO.c"	bit0 = 1;
	MOVLW	0x01
	BANKSEL	_bit0
	MOVWF	_bit0
	CLRF	(_bit0 + 1)
;	.line	90; "BINGO.c"	bit1 = 0;
	BANKSEL	_bit1
	CLRF	_bit1
	CLRF	(_bit1 + 1)
;	.line	91; "BINGO.c"	bit2 = 0;
	BANKSEL	_bit2
	CLRF	_bit2
	CLRF	(_bit2 + 1)
;	.line	92; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	93; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00112_DS_:
;	.line	95; "BINGO.c"	if(n->Unid == 2){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00114_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	96; "BINGO.c"	bit0 = 0;
	BANKSEL	_bit0
	CLRF	_bit0
	CLRF	(_bit0 + 1)
;	.line	97; "BINGO.c"	bit1 = 1;
	MOVLW	0x01
	BANKSEL	_bit1
	MOVWF	_bit1
	CLRF	(_bit1 + 1)
;	.line	98; "BINGO.c"	bit2 = 0;
	BANKSEL	_bit2
	CLRF	_bit2
	CLRF	(_bit2 + 1)
;	.line	99; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	100; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00114_DS_:
;	.line	102; "BINGO.c"	if(n->Unid == 3){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00116_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00116_DS_
;	.line	103; "BINGO.c"	bit0 = 1;
	MOVLW	0x01
	BANKSEL	_bit0
	MOVWF	_bit0
	CLRF	(_bit0 + 1)
;	.line	104; "BINGO.c"	bit1 = 1;
	MOVLW	0x01
	BANKSEL	_bit1
	MOVWF	_bit1
	CLRF	(_bit1 + 1)
;	.line	105; "BINGO.c"	bit2 = 0;
	BANKSEL	_bit2
	CLRF	_bit2
	CLRF	(_bit2 + 1)
;	.line	106; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	107; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00116_DS_:
;	.line	109; "BINGO.c"	if(n->Unid == 4)
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00118_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00118_DS_
;	.line	111; "BINGO.c"	bit0 = 0;
	BANKSEL	_bit0
	CLRF	_bit0
	CLRF	(_bit0 + 1)
;	.line	112; "BINGO.c"	bit1 = 0;
	BANKSEL	_bit1
	CLRF	_bit1
	CLRF	(_bit1 + 1)
;	.line	113; "BINGO.c"	bit2 = 1;
	MOVLW	0x01
	BANKSEL	_bit2
	MOVWF	_bit2
	CLRF	(_bit2 + 1)
;	.line	114; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	115; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00118_DS_:
;	.line	117; "BINGO.c"	if(n->Unid == 5)
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00120_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00120_DS_
;	.line	119; "BINGO.c"	bit0 = 1;
	MOVLW	0x01
	BANKSEL	_bit0
	MOVWF	_bit0
	CLRF	(_bit0 + 1)
;	.line	120; "BINGO.c"	bit1 = 0;
	BANKSEL	_bit1
	CLRF	_bit1
	CLRF	(_bit1 + 1)
;	.line	121; "BINGO.c"	bit2 = 1;
	MOVLW	0x01
	BANKSEL	_bit2
	MOVWF	_bit2
	CLRF	(_bit2 + 1)
;	.line	122; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	123; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00120_DS_:
;	.line	125; "BINGO.c"	if(n->Unid == 6)
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00122_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00122_DS_
;	.line	127; "BINGO.c"	bit0 = 0;
	BANKSEL	_bit0
	CLRF	_bit0
	CLRF	(_bit0 + 1)
;	.line	128; "BINGO.c"	bit1 = 1;
	MOVLW	0x01
	BANKSEL	_bit1
	MOVWF	_bit1
	CLRF	(_bit1 + 1)
;	.line	129; "BINGO.c"	bit2 = 1;
	MOVLW	0x01
	BANKSEL	_bit2
	MOVWF	_bit2
	CLRF	(_bit2 + 1)
;	.line	130; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	131; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00122_DS_:
;	.line	134; "BINGO.c"	if (n->Unid == 7){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00124_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00124_DS_
;	.line	135; "BINGO.c"	bit0 = 1;
	MOVLW	0x01
	BANKSEL	_bit0
	MOVWF	_bit0
	CLRF	(_bit0 + 1)
;	.line	136; "BINGO.c"	bit1 = 1;
	MOVLW	0x01
	BANKSEL	_bit1
	MOVWF	_bit1
	CLRF	(_bit1 + 1)
;	.line	137; "BINGO.c"	bit2 = 1;
	MOVLW	0x01
	BANKSEL	_bit2
	MOVWF	_bit2
	CLRF	(_bit2 + 1)
;	.line	138; "BINGO.c"	bit3 = 0;
	BANKSEL	_bit3
	CLRF	_bit3
	CLRF	(_bit3 + 1)
;	.line	139; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00124_DS_:
;	.line	142; "BINGO.c"	if (n->Unid == 8){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00126_DS_
;	.line	143; "BINGO.c"	bit0 = 0;
	BANKSEL	_bit0
	CLRF	_bit0
	CLRF	(_bit0 + 1)
;	.line	144; "BINGO.c"	bit1 = 0;
	BANKSEL	_bit1
	CLRF	_bit1
	CLRF	(_bit1 + 1)
;	.line	145; "BINGO.c"	bit2 = 0;
	BANKSEL	_bit2
	CLRF	_bit2
	CLRF	(_bit2 + 1)
;	.line	146; "BINGO.c"	bit3 = 1;
	MOVLW	0x01
	BANKSEL	_bit3
	MOVWF	_bit3
	CLRF	(_bit3 + 1)
;	.line	147; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00126_DS_:
;	.line	150; "BINGO.c"	if (n->Unid == 9){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00128_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00128_DS_
;	.line	151; "BINGO.c"	bit0 = 1;
	MOVLW	0x01
	BANKSEL	_bit0
	MOVWF	_bit0
	CLRF	(_bit0 + 1)
;	.line	152; "BINGO.c"	bit1 = 0;
	BANKSEL	_bit1
	CLRF	_bit1
	CLRF	(_bit1 + 1)
;	.line	153; "BINGO.c"	bit2 = 0;
	BANKSEL	_bit2
	CLRF	_bit2
	CLRF	(_bit2 + 1)
;	.line	154; "BINGO.c"	bit3 = 1;
	MOVLW	0x01
	BANKSEL	_bit3
	MOVWF	_bit3
	CLRF	(_bit3 + 1)
;	.line	155; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00128_DS_:
;	.line	157; "BINGO.c"	if(n->Decen == 0){
	MOVLW	0x02
	BANKSEL	r0x1028
	ADDWF	r0x1028,F
	BTFSC	STATUS,0
	INCF	r0x1027,F
	BTFSC	STATUS,2
	INCF	r0x1026,F
	MOVF	r0x1028,W
	MOVWF	STK01
	MOVF	r0x1027,W
	MOVWF	STK00
	MOVF	r0x1026,W
	PAGESEL	__gptrget2
	CALL	__gptrget2
	PAGESEL	$
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	STK00,W
	MOVWF	r0x102A
	IORWF	r0x1029,W
	BTFSS	STATUS,2
	GOTO	_00130_DS_
;	.line	158; "BINGO.c"	bit4 = 0;
	BANKSEL	_bit4
	CLRF	_bit4
	CLRF	(_bit4 + 1)
;	.line	159; "BINGO.c"	bit5 = 0;
	BANKSEL	_bit5
	CLRF	_bit5
	CLRF	(_bit5 + 1)
;	.line	160; "BINGO.c"	bit6 = 0;
	BANKSEL	_bit6
	CLRF	_bit6
	CLRF	(_bit6 + 1)
;	.line	161; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	162; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00130_DS_:
;	.line	165; "BINGO.c"	if(n->Decen == 1){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00132_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00132_DS_
;	.line	166; "BINGO.c"	bit4 = 1;
	MOVLW	0x01
	BANKSEL	_bit4
	MOVWF	_bit4
	CLRF	(_bit4 + 1)
;	.line	167; "BINGO.c"	bit5 = 0;
	BANKSEL	_bit5
	CLRF	_bit5
	CLRF	(_bit5 + 1)
;	.line	168; "BINGO.c"	bit6 = 0;
	BANKSEL	_bit6
	CLRF	_bit6
	CLRF	(_bit6 + 1)
;	.line	169; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	170; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00132_DS_:
;	.line	172; "BINGO.c"	if(n->Decen == 2){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00134_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00134_DS_
;	.line	173; "BINGO.c"	bit4 = 0;
	BANKSEL	_bit4
	CLRF	_bit4
	CLRF	(_bit4 + 1)
;	.line	174; "BINGO.c"	bit5 = 1;
	MOVLW	0x01
	BANKSEL	_bit5
	MOVWF	_bit5
	CLRF	(_bit5 + 1)
;	.line	175; "BINGO.c"	bit6 = 0;
	BANKSEL	_bit6
	CLRF	_bit6
	CLRF	(_bit6 + 1)
;	.line	176; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	177; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00134_DS_:
;	.line	179; "BINGO.c"	if(n->Decen == 3){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00136_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00136_DS_
;	.line	180; "BINGO.c"	bit4 = 1;
	MOVLW	0x01
	BANKSEL	_bit4
	MOVWF	_bit4
	CLRF	(_bit4 + 1)
;	.line	181; "BINGO.c"	bit5 = 1;
	MOVLW	0x01
	BANKSEL	_bit5
	MOVWF	_bit5
	CLRF	(_bit5 + 1)
;	.line	182; "BINGO.c"	bit6 = 0;
	BANKSEL	_bit6
	CLRF	_bit6
	CLRF	(_bit6 + 1)
;	.line	183; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	184; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00136_DS_:
;	.line	186; "BINGO.c"	if(n->Decen == 4)
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00138_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00138_DS_
;	.line	188; "BINGO.c"	bit4 = 0;
	BANKSEL	_bit4
	CLRF	_bit4
	CLRF	(_bit4 + 1)
;	.line	189; "BINGO.c"	bit5 = 0;
	BANKSEL	_bit5
	CLRF	_bit5
	CLRF	(_bit5 + 1)
;	.line	190; "BINGO.c"	bit6 = 1;
	MOVLW	0x01
	BANKSEL	_bit6
	MOVWF	_bit6
	CLRF	(_bit6 + 1)
;	.line	191; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	192; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00138_DS_:
;	.line	194; "BINGO.c"	if(n->Decen == 5)
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00140_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00140_DS_
;	.line	196; "BINGO.c"	bit4 = 1;
	MOVLW	0x01
	BANKSEL	_bit4
	MOVWF	_bit4
	CLRF	(_bit4 + 1)
;	.line	197; "BINGO.c"	bit5 = 0;
	BANKSEL	_bit5
	CLRF	_bit5
	CLRF	(_bit5 + 1)
;	.line	198; "BINGO.c"	bit6 = 1;
	MOVLW	0x01
	BANKSEL	_bit6
	MOVWF	_bit6
	CLRF	(_bit6 + 1)
;	.line	199; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	200; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00140_DS_:
;	.line	202; "BINGO.c"	if(n->Decen == 6)
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00142_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00142_DS_
;	.line	204; "BINGO.c"	bit4 = 0;
	BANKSEL	_bit4
	CLRF	_bit4
	CLRF	(_bit4 + 1)
;	.line	205; "BINGO.c"	bit5 = 1;
	MOVLW	0x01
	BANKSEL	_bit5
	MOVWF	_bit5
	CLRF	(_bit5 + 1)
;	.line	206; "BINGO.c"	bit6 = 1;
	MOVLW	0x01
	BANKSEL	_bit6
	MOVWF	_bit6
	CLRF	(_bit6 + 1)
;	.line	207; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	208; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00142_DS_:
;	.line	211; "BINGO.c"	if (n->Decen == 7){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00144_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00144_DS_
;	.line	212; "BINGO.c"	bit4 = 1;
	MOVLW	0x01
	BANKSEL	_bit4
	MOVWF	_bit4
	CLRF	(_bit4 + 1)
;	.line	213; "BINGO.c"	bit5 = 1;
	MOVLW	0x01
	BANKSEL	_bit5
	MOVWF	_bit5
	CLRF	(_bit5 + 1)
;	.line	214; "BINGO.c"	bit6 = 1;
	MOVLW	0x01
	BANKSEL	_bit6
	MOVWF	_bit6
	CLRF	(_bit6 + 1)
;	.line	215; "BINGO.c"	bit7 = 0;
	BANKSEL	_bit7
	CLRF	_bit7
	CLRF	(_bit7 + 1)
;	.line	216; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00144_DS_:
;	.line	219; "BINGO.c"	if (n->Decen == 8){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00146_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00146_DS_
;	.line	220; "BINGO.c"	bit4 = 0;
	BANKSEL	_bit4
	CLRF	_bit4
	CLRF	(_bit4 + 1)
;	.line	221; "BINGO.c"	bit5 = 0;
	BANKSEL	_bit5
	CLRF	_bit5
	CLRF	(_bit5 + 1)
;	.line	222; "BINGO.c"	bit6 = 0;
	BANKSEL	_bit6
	CLRF	_bit6
	CLRF	(_bit6 + 1)
;	.line	223; "BINGO.c"	bit7 = 1;
	MOVLW	0x01
	BANKSEL	_bit7
	MOVWF	_bit7
	CLRF	(_bit7 + 1)
;	.line	224; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00146_DS_:
;	.line	227; "BINGO.c"	if (n->Decen == 9){
	BANKSEL	r0x102A
	MOVF	r0x102A,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00148_DS_
;	.line	228; "BINGO.c"	bit4 = 1;
	MOVLW	0x01
	BANKSEL	_bit4
	MOVWF	_bit4
	CLRF	(_bit4 + 1)
;	.line	229; "BINGO.c"	bit5 = 0;
	BANKSEL	_bit5
	CLRF	_bit5
	CLRF	(_bit5 + 1)
;	.line	230; "BINGO.c"	bit6 = 0;
	BANKSEL	_bit6
	CLRF	_bit6
	CLRF	(_bit6 + 1)
;	.line	231; "BINGO.c"	bit7 = 1;
	MOVLW	0x01
	BANKSEL	_bit7
	MOVWF	_bit7
	CLRF	(_bit7 + 1)
;	.line	232; "BINGO.c"	continue;
	GOTO	_00154_DS_
_00148_DS_:
;	.line	234; "BINGO.c"	GP5 = ~GP5;
	BANKSEL	r0x1028
	CLRF	r0x1028
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00001_DS_
	BANKSEL	r0x1028
	INCF	r0x1028,F
_00001_DS_:
	BANKSEL	r0x1028
	COMF	r0x1028,W
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00002_DS_:
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00003_DS_:
;	.line	236; "BINGO.c"	GP0 = bit0;
	BANKSEL	_bit0
	MOVF	_bit0,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00004_DS_:
	BTFSS	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00005_DS_:
;	.line	237; "BINGO.c"	GP1 = bit1;
	BANKSEL	_bit1
	MOVF	_bit1,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00006_DS_:
	BTFSS	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00007_DS_:
;	.line	238; "BINGO.c"	GP2 = bit2;
	BANKSEL	_bit2
	MOVF	_bit2,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00008_DS_:
	BTFSS	STATUS,0
	GOTO	_00009_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00009_DS_:
;	.line	239; "BINGO.c"	GP4 = bit3;
	BANKSEL	_bit3
	MOVF	_bit3,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00010_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00010_DS_:
	BTFSS	STATUS,0
	GOTO	_00011_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00011_DS_:
;	.line	241; "BINGO.c"	delay(10);
	MOVLW	0x0a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	242; "BINGO.c"	GP5 = ~GP5;
	BANKSEL	r0x1028
	CLRF	r0x1028
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00012_DS_
	BANKSEL	r0x1028
	INCF	r0x1028,F
_00012_DS_:
	BANKSEL	r0x1028
	COMF	r0x1028,W
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00013_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00013_DS_:
	BTFSS	STATUS,0
	GOTO	_00014_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00014_DS_:
;	.line	244; "BINGO.c"	GP0 = bit4;
	BANKSEL	_bit4
	MOVF	_bit4,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00015_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
_00015_DS_:
	BTFSS	STATUS,0
	GOTO	_00016_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
_00016_DS_:
;	.line	245; "BINGO.c"	GP1 = bit5;
	BANKSEL	_bit5
	MOVF	_bit5,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00017_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,1
_00017_DS_:
	BTFSS	STATUS,0
	GOTO	_00018_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,1
_00018_DS_:
;	.line	246; "BINGO.c"	GP2 = bit6;
	BANKSEL	_bit6
	MOVF	_bit6,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00019_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,2
_00019_DS_:
	BTFSS	STATUS,0
	GOTO	_00020_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,2
_00020_DS_:
;	.line	247; "BINGO.c"	GP4 = bit7;
	BANKSEL	_bit7
	MOVF	_bit7,W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	RRF	r0x1028,W
	BTFSC	STATUS,0
	GOTO	_00021_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
_00021_DS_:
	BTFSS	STATUS,0
	GOTO	_00022_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
_00022_DS_:
;	.line	248; "BINGO.c"	i++;
	BANKSEL	r0x1024
	INCF	r0x1024,F
	BTFSC	STATUS,2
	INCF	r0x1025,F
	GOTO	_00154_DS_
;	.line	261; "BINGO.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1016
;   STK00
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
S_BINGO__delay	code
_delay:
; 2 exit points
;	.line	262; "BINGO.c"	void delay(unsigned int tiempo)
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVF	STK00,W
	MOVWF	r0x1017
;	.line	267; "BINGO.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1018
	CLRF	r0x1019
_00261_DS_:
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	SUBWF	r0x1019,W
	BTFSS	STATUS,2
	GOTO	_00282_DS_
	MOVF	r0x1017,W
	SUBWF	r0x1018,W
_00282_DS_:
	BTFSC	STATUS,0
	GOTO	_00263_DS_
;;genSkipc:3307: created from rifx:0x7fff627e2e60
;	.line	268; "BINGO.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVLW	0x04
	MOVWF	r0x101B
_00259_DS_:
	MOVLW	0xff
	BANKSEL	r0x101A
	ADDWF	r0x101A,W
	MOVWF	r0x101C
	MOVLW	0xff
	MOVWF	r0x101D
	MOVF	r0x101B,W
	BTFSC	STATUS,0
	INCFSZ	r0x101B,W
	ADDWF	r0x101D,F
	MOVF	r0x101C,W
	MOVWF	r0x101A
	MOVF	r0x101D,W
	MOVWF	r0x101B
	MOVF	r0x101D,W
	IORWF	r0x101C,W
	BTFSS	STATUS,2
	GOTO	_00259_DS_
;	.line	267; "BINGO.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
	GOTO	_00261_DS_
_00263_DS_:
;	.line	269; "BINGO.c"	}
	RETURN	
; exit point of _delay

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
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   STK02
;   STK01
;   STK00
;; Starting pCode block
S_BINGO__numero_aleatorio	code
_numero_aleatorio:
; 2 exit points
;	.line	43; "BINGO.c"	bit = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5)) & 1;
	BANKSEL	_lfsr
	MOVF	_lfsr,W
	BANKSEL	r0x101E
	MOVWF	r0x101E
	BANKSEL	_lfsr
	MOVF	(_lfsr + 1),W
	BANKSEL	r0x101F
	MOVWF	r0x101F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
	BCF	STATUS,0
	BANKSEL	_lfsr
	RRF	(_lfsr + 1),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_lfsr
	RRF	_lfsr,W
	BANKSEL	r0x1021
	MOVWF	r0x1021
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1020,F
	RRF	r0x1021,F
	MOVF	r0x1021,W
	XORWF	r0x101E,F
	MOVF	r0x1020,W
	XORWF	r0x101F,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
	BCF	STATUS,0
	BANKSEL	_lfsr
	RRF	(_lfsr + 1),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_lfsr
	RRF	_lfsr,W
	BANKSEL	r0x1021
	MOVWF	r0x1021
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1020,F
	RRF	r0x1021,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1020,F
	RRF	r0x1021,F
	MOVF	r0x1021,W
	XORWF	r0x101E,F
	MOVF	r0x1020,W
	XORWF	r0x101F,F
	BANKSEL	_lfsr
	SWAPF	_lfsr,W
	ANDLW	0x0f
	BANKSEL	r0x1021
	MOVWF	r0x1021
	BANKSEL	_lfsr
	SWAPF	(_lfsr + 1),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	ANDLW	0xf0
	IORWF	r0x1021,F
	XORWF	r0x1020,F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1020,F
	RRF	r0x1021,F
	MOVF	r0x1021,W
	XORWF	r0x101E,F
	MOVF	r0x1020,W
	XORWF	r0x101F,F
	MOVLW	0x01
	ANDWF	r0x101E,F
	CLRF	r0x101F
;;shiftRight_Left2ResultLit:5474: shCount=1, size=2, sign=0, same=0, offr=0
;	.line	45; "BINGO.c"	lfsr = (lfsr >> 1) | (bit << 15);
	BCF	STATUS,0
	BANKSEL	_lfsr
	RRF	(_lfsr + 1),W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	BANKSEL	_lfsr
	RRF	_lfsr,W
	MOVWF	_lfsr
	BANKSEL	r0x1021
	MOVWF	r0x1021
	RRF	r0x101E,W
	CLRF	r0x1022
	RRF	r0x1022,F
;;1	CLRF	r0x1023
;;99	MOVF	r0x1021,W
	MOVF	r0x1022,W
	IORWF	r0x1020,W
	BANKSEL	_lfsr
	MOVWF	(_lfsr + 1)
;	.line	48; "BINGO.c"	aux=lfsr % 100;
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
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x101E
;	.line	50; "BINGO.c"	numero.Unid = aux % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
	MOVWF	r0x1021
	BANKSEL	_numero_aleatorio_numero_65536_44
	MOVWF	(_numero_aleatorio_numero_65536_44 + 0)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	BANKSEL	_numero_aleatorio_numero_65536_44
	MOVWF	(_numero_aleatorio_numero_65536_44 + 1)
;	.line	51; "BINGO.c"	numero.Decen = (aux / 10) % 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x101E
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	__divsint
	CALL	__divsint
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x101E
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x101E,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	__modsint
	CALL	__modsint
	PAGESEL	$
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x101E
	BANKSEL	_numero_aleatorio_numero_65536_44
	MOVWF	(_numero_aleatorio_numero_65536_44 + 2)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=1, AOP_TYPE(res)=8
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	BANKSEL	_numero_aleatorio_numero_65536_44
	MOVWF	(_numero_aleatorio_numero_65536_44 + 3)
;	.line	52; "BINGO.c"	return &numero;
	MOVLW	high (_numero_aleatorio_numero_65536_44 + 0)
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVLW	(_numero_aleatorio_numero_65536_44 + 0)
	MOVWF	r0x101E
	CLRF	r0x1021
	MOVF	r0x101E,W
	MOVWF	STK01
	MOVF	r0x101F,W
	MOVWF	STK00
	MOVLW	0x00
;	.line	53; "BINGO.c"	}
	RETURN	
; exit point of _numero_aleatorio


;	code size estimation:
;	  676+  205 =   881 instructions ( 2172 byte)

	end
