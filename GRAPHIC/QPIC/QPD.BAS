CLS
SCREEN 12
DIM c AS INTEGER
DIM x AS INTEGER
DIM y AS INTEGER
DIM prec AS INTEGER
DIM prex AS INTEGER
DIM prey AS INTEGER
DIM puthis AS INTEGER
DIM t AS INTEGER
DIM s AS INTEGER
DIM menubar(80 * 150) AS INTEGER

start:

CLS
INPUT "File nAme"; filename$
OPEN filename$ FOR BINARY AS #1
c = 7

INPUT "x,y,c"; x, y, c
CLS
COLOR 8
FOR i = 0 TO 640 STEP 16
   LINE (i, 0)-(i, 480)
NEXT

FOR j = 0 TO 480 STEP 16
   LINE (0, j)-(640, j)
NEXT


DO

IF c = 0 THEN
COLOR 7
b$ = "b"
END IF

prex = x: prey = y: prec = c

a$ = INPUT$(1)
SELECT CASE a$
  CASE "+": c = c + 1
  CASE "-": c = c - 1
  CASE "4": x = x - 1
  CASE "6": x = x + 1
  CASE "2": y = y + 1
  CASE "8": y = y - 1
  CASE "1": x = x - 1: y = y + 1
  CASE "9": x = x + 1: y = y - 1
  CASE "3": x = x + 1: y = y + 1
  CASE "7": x = x - 1: y = y - 1
  CASE "i": cs$ = "C": y = y - 16
  CASE "k": cs$ = "C": y = y + 16
  CASE "j": cs$ = "C": x = x - 16
  CASE "l": cs$ = "C": x = x + 16
  CASE "q": CLOSE : END
  CASE "a": CLOSE : GOTO start
  CASE "c": cs$ = "C"
  CASE "v": cs$ = " "
  CASE "m": GOSUB menu
END SELECT
  IF x > 640 THEN x = 640
  IF x < 0 THEN x = 0
  IF y > 480 THEN y = 480
  IF y < 0 THEN y = 0
  IF c = -1 THEN c = 15
  IF c = 16 THEN c = 0
IF cs$ <> "C" THEN
dot:
 PUT #1, , c
 PUT #1, , x
 PUT #1, , y
COLOR prec: PSET (prex, prey)
END IF

COLOR 4: PSET (x, y) 'cursor

IF cs$ = "C" THEN PRESET (prex, prey)
LOOP

menu:
 LOCATE 1
 COLOR 7
 GET (0, 0)-(80, 150), menubar
 PRINT "draw|move"
 PRINT "789 | i"
 PRINT "4 6 |j l"
 PRINT "123 | k"
 PRINT "c:save x"
 PRINT "v:save o"
 PRINT "q:quit"
 PRINT b$; cs$; c
 PRINT x; " "; y
 SLEEP
 LOCATE 1
 PRINT "         "
 PRINT "       "
 PRINT "        "
 PRINT "       "
 PRINT "        "
 PRINT "        "
 PRINT "      "
 PRINT "     "
 PRINT "           "

        
 PUT (0, 0), menubar
RETURN


