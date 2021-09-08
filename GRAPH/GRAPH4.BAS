
DIM x, y, r, t AS SINGLE
SCREEN 12
WINDOW (-320, 240)-(320, -240)

CONST Pi = 3.14159
CONST baeyool = 90

FOR i = -5 TO 5
LINE (i * baeyool, -240)-(i * baeyool, 240), 8
NEXT

FOR i = -5 TO 5
LINE (-320, i * baeyool)-(320, i * baeyool), 8
NEXT

LINE (0, 240)-(0, -240), 15
LINE (-320, 0)-(320, 0), 15

FOR t = 0 TO 4 * Pi STEP .003

r = 1 + 2 * SIN(t / 2)'write your problem

x = r * COS(t)
y = r * SIN(t)

PSET (x * baeyool, y * baeyool), 14
NEXT

