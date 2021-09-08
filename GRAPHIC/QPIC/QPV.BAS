CLS
SCREEN 12
DIM x AS INTEGER
DIM y AS INTEGER
DIM c AS INTEGER
DIM puthis AS INTEGER
DIM t AS INTEGER
DIM s AS INTEGER

start:


INPUT "File nAme"; filename$
OPEN filename$ FOR BINARY AS #1
CLS
COLOR 8
FOR i = 0 TO 640 STEP 16
   LINE (i, 0)-(i, 480)
NEXT

FOR j = 0 TO 480 STEP 16
   LINE (0, j)-(640, j)
NEXT


WHILE NOT EOF(1)
 GET #1, , c
 GET #1, , x
 GET #1, , y

COLOR c: PSET (x, y)
WEND


