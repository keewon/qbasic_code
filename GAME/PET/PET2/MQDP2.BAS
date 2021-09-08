
CONST WINDOWSIZE = 160
CONST TITLESIZE = 21
CONST STARTX = 20
CONST STARTy = 20 + TITLESIZE

DIM cursor AS INTEGER
DIM picp1 AS STRING * 6
DIM picp2 AS STRING * 6

TYPE picture
  p AS STRING * 12
END TYPE
DIM pic AS picture
DIM saving(144) AS STRING * 1
CLS
FILES
INPUT "Filename:", filename$
INPUT "Order="; order
OPEN filename$ FOR RANDOM AS #3 LEN = LEN(pic)
CLS
SCREEN 12

x = 1: y = 1
grid:
LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 0, BF

FOR i = 0 TO 120 STEP 10
 LINE (STARTX + i, STARTy + 0)-(STARTX + i, STARTy + 120)
 LINE (STARTX + 0, STARTy + i)-(STARTX + 120, STARTy + i)
NEXT

DO
  LINE (STARTX + 10 * (x - 1) + 5, STARTy + 10 * (y - 1) + 5)-(STARTX + 10 * (x - 1) + 6, STARTy + 10 * (y - 1) + 6), 4, BF

  oldy = y: oldx = x

a$ = INPUT$(1)
SELECT CASE a$
  CASE "U", "u": y = y - 1
  CASE "J", "j": y = y + 1
  CASE "K", "k": x = x + 1
  CASE "H", "h": x = x - 1
  CASE "S", "s": GOTO forsave
  CASE "q": CLOSE : END
CASE "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
pdcolor = VAL(a$)
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$

CASE "A", "a"
pdcolor = 10
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$

CASE "B", "b"
pdcolor = 11
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$

CASE "C", "c"
pdcolor = 12
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$

CASE "D", "d"
pdcolor = 13
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$

CASE "E", "e"
pdcolor = 14
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$

CASE "F", "f"
pdcolor = 15
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 15
  saving(x + 12 * (y - 1)) = a$
CASE ELSE

END SELECT

  IF x = 13 THEN x = 1
  IF x = 0 THEN x = 12
  IF y = 13 THEN y = 1
  IF y = 0 THEN y = 12

  LINE (STARTX + 10 * (oldx - 1) + 5, STARTy + 10 * (oldy - 1) + 5)-(STARTX + 10 * (oldx - 1) + 6, STARTy + 10 * (oldy - 1) + 6), 0, BF

LOOP


forsave:
LOCATE 15
COLOR 7
FOR i = 1 TO 12

picp1 = saving((i - 1) * 12 + 1) + saving((i - 1) * 12 + 2) + saving((i - 1) * 12 + 3) + saving((i - 1) * 12 + 4) + saving((i - 1) * 12 + 5) + saving((i - 1) * 12 + 6)
picp2 = saving((i - 1) * 12 + 7) + saving((i - 1) * 12 + 8) + saving((i - 1) * 12 + 9) + saving((i - 1) * 12 + 10) + saving((i - 1) * 12 + 11) + saving((i - 1) * 12 + 12)
pic.p = picp1 + picp2
PRINT pic.p

PUT #3, (i) + (order - 1) * 144, pic.p
NEXT



CLOSE
END





