       
'this program would show the graph of "y = (1 / x + 1) ^ (x)"
CLS
 SCREEN 12
 WINDOW (0, 3)-(100000, 0)
 DIM x AS DOUBLE
 DIM y AS DOUBLE
LINE (-500, 0)-(500, 0), 3
LINE (-500, 1)-(500, 1), 4
LINE (-500, 2)-(500, 2), 4
LINE (-500, 3)-(500, 3), 4
LINE (-500, 4)-(500, 4), 4
LINE (-500, EXP(1))-(500, EXP(1)), 14
LINE (-500, 1 / EXP(1))-(500, 1 / EXP(1)), 14
LINE (-500, EXP(1) ^ 2)-(500, EXP(1) ^ 2), 14


LINE (0, 0)-(0, 500), 3
LINE (1, 0)-(1, 500), 4
LINE (2, 0)-(2, 500), 4
LINE (3, 0)-(3, 500), 4
LINE (4, 0)-(4, 500), 4
LINE (EXP(1), 0)-(EXP(1), 500), 14
LINE (1 / EXP(1), 0)-(1 / EXP(1), 500), 14
LINE (EXP(1) ^ 2, 0)-(EXP(1) ^ 2, 500), 14




x = 0
 DO
   IF x <> 0! THEN
       y = (1 / x + 1) ^ (x)
     LOCATE 1: PRINT x, y
     PSET (x, y)
   END IF
   IF x = 0! THEN LINE (0, -100)-(0, 100), 4
   IF x >= 0 THEN x = x + .01
   IF x < 0 THEN x = x + 1

LOOP


