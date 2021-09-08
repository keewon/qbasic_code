CONST WINDOWSIZE = 160
CONST TITLESIZE = 21
CONST STARTX = 20
CONST STARTy = 20 + TITLESIZE
CLS
TYPE picture
  p AS STRING * 12
END TYPE

DIM pic AS picture
FILES
INPUT "Filename=", filename$
INPUT "Order=", order
OPEN filename$ FOR RANDOM AS #3 LEN = LEN(pic)
SCREEN 12
CLS
'grid
LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 0, BF

FOR i = 0 TO 120 STEP 10
 LINE (STARTX + i, STARTy + 0)-(STARTX + i, STARTy + 120)
 LINE (STARTX + 0, STARTy + i)-(STARTX + 120, STARTy + i)
NEXT

numberofrecord = LOF(3) / 12

FOR i = 1 TO 12       'sero
FOR k = 1 TO 12       'garo
GET #3, i + (order - 1) * 144, pic.p

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
CASE "A", "a": PDCOLOR = 10
CASE "B", "b": PDCOLOR = 11
CASE "C", "c": PDCOLOR = 12
CASE "D", "d": PDCOLOR = 13
CASE "E", "e": PDCOLOR = 14
CASE "F", "f": PDCOLOR = 15
CASE ELSE: PDCOLOR = 0
END SELECT

PAINT ((k * 10 - 5 + STARTX), (i * 10 - 5 + STARTy)), PDCOLOR, 15

NEXT
NEXT


CLOSE #3

