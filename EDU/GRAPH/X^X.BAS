'this program would show the graph of "y=x^x"
CLS
 SCREEN 12
 WINDOW (-10, 30)-(3, -30)
 DIM x AS DOUBLE
 DIM y AS DOUBLE
LINE (-5, 0)-(5, 0), 4
LINE (-5, 1)-(5, 1), 4

 x = -1
 DO
   IF x <> 0! THEN
     y = x ^ x
     LOCATE 1: PRINT x, y
     PSET (x, y)
   END IF
   IF x = 0! THEN LINE (0, -100)-(0, 100), 4
   IF x >= 0 THEN x = x + .001
   IF x < 0 THEN x = x + 1


LOOP

