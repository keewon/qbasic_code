'this program would show the graph of "y=(sin x) ^2"
CLS
CONST pi = 3.14159
 SCREEN 12
 WINDOW (-2 * pi, 2 * pi * (480 / 640))-(2 * pi, -2 * pi * (480 / 640))
 DIM x AS DOUBLE
 DIM y AS DOUBLE
 DIM presgn AS INTEGER

FOR i = -7 TO 7
LINE (i, -10)-(i, 10), 4
NEXT

FOR i = -7 TO 7
LINE (-10, i)-(10, i), 4
NEXT

FOR i = -2 * pi TO 2 * pi STEP pi / 12
LINE (i * pi, -10)-(i * pi, 10), 3
NEXT

FOR i = -2 * pi TO 2 * pi STEP pi / 12
LINE (-10, i * pi)-(10, i * pi), 3
NEXT

 x = -2 * pi
 DO

     y = (SIN(x)) ^ 2
     LOCATE 1: PRINT x, y, presgn
     PSET (x, y)

IF presgn <> SGN(x) THEN SLEEP
presgn = SGN(x)

x = x + .01

LOOP

