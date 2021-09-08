CLS
SCREEN 12
DIM x AS DOUBLE
DIM y AS DOUBLE

WINDOW (-5, 10)-(5, -10)
x = -4
LINE (-5, 0)-(5, 0), 4
LINE (-5, 10)-(5, 10), 4

DO
 y = x ^ x
PSET (x, y)
LOCATE 1: PRINT x, y
x = x + 1
SLEEP
LOOP

