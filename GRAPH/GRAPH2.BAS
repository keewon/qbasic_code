
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
'''''''''''''''''''''''''''''''''''''''''''''

FOR t = 0 TO 2 * Pi STEP .005

IF (SIN(t)) >= 0 THEN
r = SQR(SQR(2) * SIN(t))  'write your problem
END IF

 x = r * COS(t)
 y = r * SIN(t)

         PSET (x * baeyool, y * baeyool), 14
''''''''''''''''''''''''''''''''''''''''''''
IF (SIN(t)) >= 0 THEN
r = -SQR(SQR(2) * SIN(t))   'write your problem
END IF

 x = r * COS(t)
 y = r * SIN(t)

         PSET (x * baeyool, y * baeyool), 14

NEXT

''''''''''''''''2nd''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''

FOR t = 0 TO Pi STEP .0025

IF (SIN(2 * t)) >= 0 THEN
r = SQR(2 * SIN(2 * t))'write your problem
END IF

 x = r * COS(t)
 y = r * SIN(t)

         PSET (x * baeyool, y * baeyool), 12
''''''''''''''''''''''''''''''''''''''''''''
IF (SIN(2 * t)) >= 0 THEN
r = -SQR(2 * SIN(2 * t))'write your problem
END IF

 x = r * COS(t)
 y = r * SIN(t)

         PSET (x * baeyool, y * baeyool), 12

NEXT
            

