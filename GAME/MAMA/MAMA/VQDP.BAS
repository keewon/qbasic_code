CONST WINDOWSIZE = 160
CONST TITLESIZE = 21
CONST STARTX = 20
CONST STARTy = 20 + TITLESIZE
CLS
TYPE picture
  p AS STRING * 32
END TYPE

DIM pic AS picture
FILES
INPUT "Filename=", filename$
INPUT "Order=", order
OPEN filename$ FOR RANDOM AS #3 LEN = LEN(pic)
SCREEN 12
CLS

''grid
'LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 0, BF
'FOR I = 0 TO 160 STEP 10
' LINE (STARTX + I, STARTy + 0)-(STARTX + I, STARTy + 140)
' NEXT
'
' FOR I = 0 TO 140 STEP 10
' LINE (STARTX + 0, STARTy + I)-(STARTX + 160, STARTy + I)
'NEXT
'
PAINT (1, 1), , 15
numberofrecord = LOF(3) / 32

FOR I = 1 TO 32       'sero
FOR k = 1 TO 32       'garo
GET #3, I + (order - 1) * 32 * 32, pic.p

PD$ = MID$(pic.p, k, 1)

SELECT CASE PD$
CASE "0": pdcolor = 0
CASE "1": pdcolor = 1
CASE "2": pdcolor = 2
CASE "3": pdcolor = 3
CASE "4": pdcolor = 4
CASE "5": pdcolor = 5
CASE "6": pdcolor = 6
CASE "7": pdcolor = 7
CASE "8": pdcolor = 8
CASE "9": pdcolor = 9
CASE "A", "a": pdcolor = 10
CASE "B", "b": pdcolor = 11
CASE "C", "c": pdcolor = 12
CASE "D", "d": pdcolor = 13
CASE "E", "e": pdcolor = 14
CASE "F", "f": pdcolor = 15
CASE ELSE: pdcolor = 16
END SELECT

'PAINT ((k * 10 - 5 + STARTX), (I * 10 - 5 + STARTy)), PDCOLOR, 15
IF pdcolor <> 16 THEN PSET ((k - 5 + STARTX), (I - 5 + STARTy)), pdcolor


NEXT
NEXT


CLOSE #3

