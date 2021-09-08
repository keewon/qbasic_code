'x2 ~ x-2
SCREEN 12
CLS
DIM a, b, c, d, f, e, g, h, q, x, y, z, pz AS DOUBLE
a = 0
b = 0
c = 0
q = 0
w = 0
e = -240
f = 320
g = 70
pz = 123
ON ERROR GOTO errorr
errorr:
  IF ERR = 6 THEN RESUME NEXT

DO

COLOR 15
 LOCATE 1, 1: PRINT a; b; c; q; w; e; f; g; pz
 a$ = INPUT$(1)
 


 SELECT CASE a$
   CASE "a": a = a + 1
   CASE "s": b = b + 1
   CASE "d": c = c + 1
   CASE "f": q = q + 1
   CASE "g": w = w + 1

   CASE "h": a = a + .1
   CASE "j": b = b + .1
   CASE "k": c = c + .1
   CASE "l": q = q - .1
   CASE ";": w = w - .1

   CASE "z": a = a - 1
   CASE "x": b = b - 1
   CASE "c": c = c - 1
   CASE "v": q = q - 1
   CASE "b": w = w - 1

   CASE "n": a = a - .1
   CASE "m": b = b - .1
   CASE ",": c = c - .1
   CASE ".": q = q - .1
   CASE "/": w = w - .1

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

prex = g * (-6) + f: prey = 480 - g * (-6) + e
 FOR x = -5 TO 5 STEP .005
      y = a * x ^ 2 + b * x + c + q * (1 / x) + w * (1 / x ^ 2)

    
    LINE (prex, prey)-(g * (x) + f, 480 - g * (y) + e)

     prex = g * (x) + f: prey = 480 - g * (y) + e
  NEXT

 FOR x = -5 TO 5 STEP .005
     z = 2 * a * x + b + (-1) * q * (1 / x ^ 2) + (-2) * w * (1 / x ^ 3)
                         '   IF z > -.25 AND z < .25 THEN PRINT z
     IF z > -.01 AND z < .01 THEN
        pz = z
        COLOR 4

       zy = a * x ^ 2 + b * x + c + q * x ^ (-1) + w * (1 / x ^ 2)
     
       PSET (g * (x) + f, 480 - g * (zy) + e)
     
      END IF
 NEXT

 COLOR 15
 '   PRINT a; b; c; d; e; f; g
LOOP

