DIM x, y AS SINGLE
SCREEN 12
WINDOW (-320, 240)-(320, -240)

CONST Pi = 3.14159
DIM e AS SINGLE
e = EXP(1)

CONST baeyool = 90

FOR i = -5 TO 5
LINE (i * baeyool, -240)-(i * baeyool, 240), 8
NEXT

FOR i = -5 TO 5
LINE (-320, i * baeyool)-(320, i * baeyool), 8
NEXT

LINE (0, 240)-(0, -240), 15
LINE (-320, 0)-(320, 0), 15

FOR x = 0 TO 2 STEP .001

y = x ^ 2'write your problem
PSET (x * baeyool, y * baeyool), 13
y = SQR(x)  'write your problem
PSET (x * baeyool, y * baeyool), 13

NEXT

