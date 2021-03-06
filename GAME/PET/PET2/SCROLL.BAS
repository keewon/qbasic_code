CONST WINDOWSIZE = 160
CONST TITLESIZE = 40
SCREEN 12
TYPE picture
  p AS STRING * 12
END TYPE
 
DIM pic AS picture
FILES

INPUT "FILENAME:", FILENAME$
OPEN FILENAME$ FOR RANDOM AS #3 LEN = LEN(pic)

CLS
numberofrecord = LOF(3) / 12
'grid
LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 7, BF
STARTX = 20: STARTy = TITLESIZE + 20
FOR I = 0 TO 120 STEP 10
 LINE (STARTX + I, STARTy + 0)-(STARTX + I, STARTy + 120)
 LINE (STARTX + 0, STARTy + I)-(STARTX + 120, STARTy + I)
NEXT

FOR j = 1 TO 12
FOR I = 1 TO numberofrecord
 GET #3, I, pic.p

FOR k = 1 TO 12

PD$ = MID$(pic.p, k, 1)

SELECT CASE PD$
CASE "0": PDCOLOR = 0
CASE "1": PDCOLOR = 1
CASE "2": PDCOLOR = 2
CASE "3": PDCOLOR = 3
CASE "4": PDCOLOR = 4
CASE "5": PDCOLOR = 5
CASE "6": PDCOLOR = 6
CASE "7": PDCOLOR = 7
CASE "8": PDCOLOR = 8
CASE "9": PDCOLOR = 9
CASE "A": PDCOLOR = 10
CASE "B": PDCOLOR = 11
CASE "C": PDCOLOR = 12
CASE "D": PDCOLOR = 13
CASE "E": PDCOLOR = 14
CASE "F": PDCOLOR = 15
CASE ELSE: PDCOLOR = 7
END SELECT

PAINT (160 - (STARTX + j * 10 - 5), (k * 10 - 5 + STARTy)), PDCOLOR, 15
SLEEP
NEXT

NEXT

NEXT

