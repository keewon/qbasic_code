DIM x, y AS SINGLE
SCREEN 12
WINDOW (0, 240)-(640, -240)

CONST Pi = 3.14159
DIM e AS SINGLE
e = EXP(1)

CONST baeyool = 20

FOR i = -5 TO 5
LINE (i * baeyool, -240)-(i * baeyool, 240), 8
NEXT

FOR i = -5 TO 5
LINE (-320, i * baeyool)-(320, i * baeyool), 8
NEXT

LINE (0, 240)-(0, -240), 15
LINE (-320, 0)-(320, 0), 15

FOR x = 0 TO 30 STEP .001

IF ABS(x) > .1 THEN
y = SQR(x) / SIN(x)'write your problem
PSET (x * baeyool, y * baeyool), 13
END IF


NEXT


