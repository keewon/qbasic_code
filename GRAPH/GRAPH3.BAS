
DIM x, y, r, t AS SINGLE
SCREEN 12
WINDOW (-320, 240)-(320, -240)

CONST Pi = 3.14159
CONST baeyool = 100

FOR i = -5 TO 5
LINE (i * baeyool, -240)-(i * baeyool, 240), 8
NEXT

FOR i = -5 TO 5
LINE (-320, i * baeyool)-(320, i * baeyool), 8
NEXT

LINE (0, 240)-(0, -240), 15
LINE (-320, 0)-(320, 0), 15

FOR t = 0 TO Pi / 4 STEP .001
LOCATE 1, 1: PRINT t / Pi; "                     "
IF (COS(2 * t)) >= 0 THEN
r = SQR(4 * COS(2 * t))  'write your problem

x = r * COS(t)
y = r * SIN(t)

PSET (CINT(x * baeyool), CINT(y * baeyool)), 14

r = -SQR(4 * COS(2 * t))  'write your problem

x = r * COS(t)
y = r * SIN(t)

PSET (CINT(x * baeyool), CINT(y * baeyool)), 14

END IF
'a$ = INPUT$(1)
NEXT

            

