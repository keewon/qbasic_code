CLS
COLOR 15
PRINT "DRAW CHARACTER MADE BY SEO KEE WON"
COLOR 7
INPUT "1.NEW  2.LOAD"; NEWORLOAD
FILES
INPUT "Filename:", filename$
INPUT "Order="; order
'INPUT "PICROW="; PICROW
'INPUT "COLUMN="; PICCOLUMN
CONST PICROW = 32
CONST PICCOLUMN = 32

TYPE picture
  p AS STRING * PICROW
END TYPE

CONST WINDOWSIZE = 160
CONST TITLESIZE = 0
CONST STARTX = 0
CONST STARTy = 0 + TITLESIZE

DIM cursor AS INTEGER
DIM pic AS picture
DIM SAVING(PICROW * PICCOLUMN) AS STRING * 1
DIM picp1 AS STRING * 8
DIM picp2 AS STRING * 8
DIM picp3 AS STRING * 8
DIM picp4 AS STRING * 8

OPEN filename$ FOR RANDOM AS #3 LEN = LEN(pic)
CLS
SCREEN 12
x = 1: y = 1
GOSUB GRID
SELECT CASE NEWORLOAD
       CASE 2: GOSUB LOAD
       CASE ELSE
END SELECT


DO
  LINE (STARTX + 10 * (x - 1) + 5, STARTy + 10 * (y - 1) + 5)-(STARTX + 10 * (x - 1) + 6, STARTy + 10 * (y - 1) + 6), 11, BF

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
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = VAL(a$)
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "A", "a"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 10
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "B", "b"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 11
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "C", "c"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 12
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "D", "d"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 13
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "E", "e"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 14
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor


CASE "F", "f"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 15
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = a$
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "Z", "z"
pdcolor = 0
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  SAVING(x + PICROW * (y - 1)) = ""
  PSET ((x + STARTX + 400), (y + STARTy + 20)), 0

CASE ELSE

END SELECT

  IF x = PICROW + 1 THEN x = 1
  IF x = 0 THEN x = PICROW
  IF y = PICCOLUMN + 1 THEN y = 1
  IF y = 0 THEN y = PICCOLUMN

  LINE (STARTX + 10 * (oldx - 1) + 5, STARTy + 10 * (oldy - 1) + 5)-(STARTX + 10 * (oldx - 1) + 6, STARTy + 10 * (oldy - 1) + 6), 0, BF

LOOP


forsave:

LOCATE 1, 40
COLOR 7
FOR I = 1 TO PICCOLUMN
picp1 = SAVING((I - 1) * PICROW + 1) + SAVING((I - 1) * PICROW + 2) + SAVING((I - 1) * PICROW + 3) + SAVING((I - 1) * PICROW + 4) + SAVING((I - 1) * PICROW + 5) + SAVING((I - 1) * PICROW + 6) + SAVING((I - 1) * PICROW + 7) + SAVING((I - 1) * PICROW + 8)
picp2 = SAVING((I - 1) * PICROW + 9) + SAVING((I - 1) * PICROW + 10) + SAVING((I - 1) * PICROW + 11) + SAVING((I - 1) * PICROW + 12) + SAVING((I - 1) * PICROW + 13) + SAVING((I - 1) * PICROW + 14) + SAVING((I - 1) * PICROW + 15) + SAVING((I - 1) * PICROW + 16)
picp3 = SAVING((I - 1) * PICROW + 1 + 16) + SAVING((I - 1) * PICROW + 2 + 16) + SAVING((I - 1) * PICROW + 3 + 16) + SAVING((I - 1) * PICROW + 4 + 16) + SAVING((I - 1) * PICROW + 5 + 16) + SAVING((I - 1) * PICROW + 6 + 16) + SAVING((I - 1) * PICROW + 7 + 16) + SAVING((I - 1) * PICROW + 8 + 16)
picp4 = SAVING((I - 1) * PICROW + 9 + 16) + SAVING((I - 1) * PICROW + 10 + 16) + SAVING((I - 1) * PICROW + 11 + 16) + SAVING((I - 1) * PICROW + 12 + 16) + SAVING((I - 1) * PICROW + 13 + 16) + SAVING((I - 1) * PICROW + 14 + 16) + SAVING((I - 1) * PICROW + 15 + 16) + SAVING((I - 1) * PICROW + 16 + 16)
                                 
pic.p = picp1 + picp2 + picp3 + picp4
PRINT pic.p

PUT #3, (I) + (order - 1) * PICROW * PICCOLUMN, pic.p
NEXT
CLOSE
END

GRID:
COLOR 7
LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 0, BF

FOR I = 0 TO PICROW * 10 STEP 10
 LINE (STARTX + I, STARTy + 0)-(STARTX + I, STARTy + 320)
 IF I MOD 40 = 0 THEN LINE (STARTX + I + 1, STARTy + 0)-(STARTX + I + 1, STARTy + 320)
NEXT

FOR I = 0 TO PICCOLUMN * 10 STEP 10
 LINE (STARTX + 0, STARTy + I)-(STARTX + 320, STARTy + I)
 IF I MOD 40 = 0 THEN LINE (STARTX + 0, STARTy + I + 1)-(STARTX + 320, STARTy + I + 1)
NEXT

RETURN

LOAD:
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
CASE ELSE: pdcolor = 0
END SELECT

 SAVING((I - 1) * PICROW + k) = PD$

PAINT ((k * 10 - 5 + STARTX), (I * 10 - 5 + STARTy)), pdcolor, 7
PSET ((k + STARTX + 400), (I + STARTy + 20)), pdcolor
NEXT
NEXT
RETURN


