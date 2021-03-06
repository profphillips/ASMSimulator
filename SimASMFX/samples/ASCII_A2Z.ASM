#Show ASCII uppercase alphabet A-Z on LCD screen
	LOD A, [COUNT]
LOOP1:	SUB A, [ONE]
	CALL DISP
	CALL CHECK
	JNZ LOOP1
	HLT
COUNT:	DB  1A
ONE:	DB  01
ZERO:	DB  00
CHARS:  DB  08
CHARR:  DB  08
ALPHA:	DB  40
CR:	DB  0D
LF:	DB  0A

DISP:	PUSH A
	PUSH SR
	LOD A, [ALPHA]
	ADD A, [ONE]
	STO A, [ALPHA]
	OUT 04, A
	POP SR
	POP A
	RET

CHECK:	PUSH A
	PUSH SR
	LOD A, [CHARS]
	SUB A, [ONE]
	JZ  NEWLN
	STO A, [CHARS]
	POP SR
	POP A
	RET

NEWLN:	LOD A, [CR]
	OUT 04, A
	LOD A, [LF]
	OUT 04, A
	LOD A, [CHARR]
	STO A, [CHARS]
	POP SR
	POP A
	RET

