' y' xxx
SCREEN 12
CLS
DIM a, b, c, d, f, e, g, h, q, x, y AS DOUBLE
q = 1
a = 0
b = 0
c = 0
d = 0
e = -240
f = 320
g = 100
DO

COLOR 15
 LOCATE 1, 1: PRINT q; a; b; c; d; e; f; g
 a$ = INPUT$(1)
 


 SELECT CASE a$
   CASE "a": q = q + 1
   CASE "s": a = a + 1
   CASE "d": b = b + 1
   CASE "f": c = c + 1

   CASE "g": q = q + .1
   CASE "h": a = a + .1
   CASE "j": b = b + .1
   CASE "k": c = c + .1

   CASE "z": q = q - 1
   CASE "x": a = a - 1
   CASE "c": b = b - 1
   CASE "v": c = c - 1

   CASE "b": q = q - .1
   CASE "n": a = a - .1
   CASE "m": b = b - .1
   CASE ",": c = c - .1

   CASE "2": e = e + 5
   CASE "8": e = e - 5
   CASE "4": f = f - 5
   CASE "6": f = f + 5

   CASE "u": g = g + 1
   CASE "i": g = g - 1
   CASE "+": g = g + 5
   CASE "-": g = g - 5

   CASE "0": CLS
   CASE ".": COLOR 0
   CASE ELSE
 END SELECT

   
 FOR x = -6 TO 6 STEP .009
     y = q * x ^ 3 + a * x ^ 2 + b * x + c
     'PSET (g * (x) + f, 480 - g * (y) + e)
    LINE (prex, prey)-(g * (x) + f, 480 - g * (y) + e)
     prex = g * (x) + f: prey = 480 - g * (y) + e

 NEXT
 COLOR 15
 '   PRINT a; b; c; d; e; f; g
LOOP

