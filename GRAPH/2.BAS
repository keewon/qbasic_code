DECLARE FUNCTION f5! (x AS DOUBLE)
DECLARE FUNCTION f4! (x AS DOUBLE)
DECLARE SUB f3 ()
DECLARE FUNCTION f! (x AS DOUBLE)
DECLARE FUNCTION f2! (x AS DOUBLE)

CONST Pi = 3.14159
CONST v = 320
CONST g = 980
DIM i AS DOUBLE

CLS
'INPUT "v="; v
FOR i = 0 TO 90
'FOR i = 25 TO 45
SELECT CASE i

CASE 0 TO 22: LOCATE i + 1, 1
CASE 23 TO 45: LOCATE i + 1 - 23, 21
CASE 46 TO 67: LOCATE i + 1 - 46, 41
CASE 68 TO 90: LOCATE i + 1 - 68, 61

END SELECT

PRINT i; "->"; f5(i)


NEXT
SLEEP

FUNCTION f (x AS DOUBLE)

DIM h1 AS DOUBLE
DIM t AS DOUBLE
DIM r AS DOUBLE
DIM a AS DOUBLE

a = x * Pi / 180

h1 = ((v * SIN(a)) ^ 2) / (2 * g)

t = SQR((2 * (h1 + h0)) / g) + v * SIN(a) / g

r = v * COS(a) * t

f = r

END FUNCTION

FUNCTION f2 (x AS DOUBLE)

DIM h1 AS DOUBLE
DIM t1 AS DOUBLE
DIM t AS DOUBLE
DIM r AS DOUBLE
DIM a AS DOUBLE

a = x * Pi / 180

t1 = 2 * v * SIN(a) / g

t = (-v * SIN(a) + SQR(v ^ 2 * SIN(a) ^ 2 + 2 * g * h0)) / g

r = v * COS(a) * (t + t1)

f2 = r

END FUNCTION

SUB f3
DIM x AS DOUBLE
x = 36
DIM h1 AS DOUBLE
DIM t AS DOUBLE
DIM r AS DOUBLE
DIM a AS DOUBLE

a = x * Pi / 180

h1 = ((v * SIN(a)) ^ 2) / (2 * g)

t = SQR((2 * (h1 + h0)) / g) + v * SIN(a) / g

r = v * COS(a) * t

PRINT "v="; v
PRINT "x="; x
PRINT "a="; a
PRINT "h1="; h1
PRINT "t="; t
PRINT "R="; r


END SUB

FUNCTION f4 (x AS DOUBLE)
DIM t AS DOUBLE
DIM r AS DOUBLE
DIM y AS DOUBLE
DIM a AS DOUBLE
r = 83
a = x * Pi / 180

t = r / v / COS(a)
y = v * SIN(a) * t - 1 / 2 * g * t ^ 2

f4 = y

END FUNCTION

FUNCTION f5 (x AS DOUBLE)
DIM r AS DOUBLE
DIM a AS DOUBLE

a = x * Pi / 180

r = (TAN(a) - TAN(22 * Pi / 180)) * 2 * v ^ 2 * COS(a) ^ 2 / g

f5 = r

END FUNCTION

