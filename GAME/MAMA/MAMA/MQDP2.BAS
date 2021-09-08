CLS
COLOR 15
PRINT "DRAW CHARACTER MADE BY SEO KEE WON"
COLOR 7
INPUT "1.NEW  2.LOAD"; NEWORLOAD
FILES
INPUT "Filename:", filename$
INPUT "Order="; order
CONST PICROW = 32
CONST PICCOLUMN = 32

CONST WINDOWSIZE = 160
CONST TITLESIZE = 0
CONST STARTX = 0
CONST STARTy = 0 + TITLESIZE

DIM cursor AS INTEGER
DIM co(1 TO 7)

TYPE characterdata
     header AS STRING * 4
     dat AS STRING * 32
END TYPE

DIM cdata AS charcterdata

OPEN filename$ FOR BINARY AS #3
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
  CASE CHR$(0) + "H": y = y - 1  'up
  CASE CHR$(0) + "P": y = y + 1  'down
  CASE CHR$(0) + "M": x = x + 1  'right
  CASE CHR$(0) + "K": x = x - 1  'left
  CASE CHR$(27), "Q", "q": CLOSE : END
  CASE "S", "s": GOTO forsave
  CASE "C", "c": GOSUB changecolor
  CASE "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = VAL(a$)
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "A", "a"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 10
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "B", "b"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 11
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "C", "c"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 12
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "D", "d"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 13
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "E", "e"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 14
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor


CASE "F", "f"
LINE ((x - 1) * 10 + 1, (y - 1) * 10 + 1)-(x * 10 - 1, y * 10 - 1), 0, BF
pdcolor = 15
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
  PSET ((x + STARTX + 400), (y + STARTy + 20)), pdcolor

CASE "Z", "z"
pdcolor = 0
  PAINT ((x * 10 - 2 + STARTX), (y * 10 - 2 + STARTy)), pdcolor, 7
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

CLOSE
END


GRID:
COLOR 7
LOCATE 1, 40: PRINT "quit:Esc  save:S  Change Color:C"
LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 0, BF

FOR i = 0 TO PICROW * 10 STEP 10
 LINE (STARTX + i, STARTy + 0)-(STARTX + i, STARTy + 320)
 IF i MOD 40 = 0 THEN LINE (STARTX + i + 1, STARTy + 0)-(STARTX + i + 1, STARTy + 320)
NEXT

FOR i = 0 TO PICCOLUMN * 10 STEP 10
 LINE (STARTX + 0, STARTy + i)-(STARTX + 320, STARTy + i)
 IF i MOD 40 = 0 THEN LINE (STARTX + 0, STARTy + i + 1)-(STARTX + 320, STARTy + i + 1)
NEXT

RETURN

LOAD:

GET #3, , cdata

FOR i = 1 TO 4 STEP 1                      'header
      
         co(2 * i - 2) = INT(ASC(MID$(cdata.header, i, 1)) / 16)
         co(2 * i - 1) = ASC(MID$(cdata.header, i, 1)) MOD 16
NEXT

FOR i = 1 TO 16
          ASC(MID$(cdata.dat, i, 1))/8

RETURN

changecolor:
FOR i = 1 TO 7
    LOCATE i + 3, 40
     PRINT "input color"; i; " :"
     INPUT "", co(i)
NEXT
RETURN



