'this program would show the graph of "y=x^(1/x)"
CLS
 DIM x AS DOUBLE
 DIM y AS DOUBLE
 DIM yprime AS DOUBLE
 DIM ydoubleprime AS DOUBLE
 DIM preydoubleprime AS DOUBLE
 DIM preyprime AS DOUBLE

 CONST linelimit = 1000
 CONST TRUE = -1
 CONST false = 0
 CONST MAXLEFT = 0
 CONST maxup = 2
 CONST maxright = 10
 CONST maxdown = 0
 CONST STARTX = MAXLEFT
 CONST XPLUS = .1
 CONST yprime0stop = TRUE
 CONST yprimenot0stop = false
 CONST ydoubleprime0stop = TRUE
 CONST ydoubleprimenot0stop = false
 CONST limitofwrong = XPLUS / 2
 CONST endx = maxright
 CONST printnumber = TRUE

 SCREEN 12
 WINDOW (MAXLEFT, maxup)-(maxright, maxdown)

LINE (-linelimit, 0)-(linelimit, 0), 3
LINE (-linelimit, 1)-(linelimit, 1), 4
LINE (-linelimit, 2)-(linelimit, 2), 4
LINE (-linelimit, 3)-(linelimit, 3), 4
LINE (-linelimit, 4)-(linelimit, 4), 4
LINE (-linelimit, EXP(1))-(linelimit, EXP(1)), 14
LINE (-linelimit, 1 / EXP(1))-(linelimit, 1 / EXP(1)), 14
LINE (-linelimit, EXP(1) ^ 2)-(linelimit, EXP(1) ^ 2), 14


LINE (0, -linelimit)-(0, linelimit), 3
LINE (1, -linelimit)-(1, linelimit), 4
LINE (2, -linelimit)-(2, linelimit), 4
LINE (3, -linelimit)-(3, linelimit), 4
LINE (4, -linelimit)-(4, linelimit), 4
LINE (EXP(1), -linelimit)-(EXP(1), linelimit), 14
LINE (1 / EXP(1), -linelimit)-(1 / EXP(1), linelimit), 14
LINE (EXP(1) ^ 2, -linelimit)-(EXP(1) ^ 2, linelimit), 14
LINE ((1 / EXP(1)) ^ 2, -linelimit)-((1 / EXP(1)) ^ 2, linelimit), 14

x = STARTX
 DO
   IF x <> 0! THEN
       y = x ^ (1 / x)
     IF printnumber = TRUE THEN

     LOCATE 1
     PRINT "                             "
     PRINT "                             "
     PRINT "                             "
     PRINT "                             "

     LOCATE 1
     PRINT "x="; x
     PRINT "y="; y
     PRINT "yp="; yprime
     PRINT "ydp="; ydoubleprime
     END IF

     PSET (x, y)
   END IF
       preyprime = yprime
       preydoubleprime = ydoubleprime

   IF x <> 0 THEN
       yprime = (x ^ (1 / x)) * ((1 / x ^ 2) - (1 / x ^ 2) * (LOG(x)))
       ydoubleprime = (x ^ (1 / x) * ((1 / (x ^ 2)) - (1 / (x ^ 2)) * LOG(x)) ^ 2) + (x ^ (1 / x)) * ((-3 / (x ^ 3)) + (2 / (x ^ 3)) * LOG(x))
   END IF
'yprime
'   IF yprime0stop = TRUE AND yprime > -1 * limitofwrong AND yprime < limitofwrong THEN
    IF yprime0stop = TRUE AND SGN(yprime) <> SGN(preyprime) THEN

        LOCATE 1, 41: PRINT "yprime=0"
        A$ = INPUT$(1)
        LOCATE 1, 41: PRINT "        "
        END IF
  
   IF yprimenot0stop = TRUE THEN
        IF yprime < -1 * limitofwrong OR yprime > limitofwrong THEN
        LOCATE 1, 41: PRINT "yprime<>0"
        A$ = INPUT$(1)
        LOCATE 1, 41: PRINT "              "
        END IF
   END IF

'ydoubleprime

   IF ydoubleprime0stop = TRUE AND SGN(preydoubleprime) <> SGN(ydoubleprime) THEN
        LOCATE 1, 41: PRINT "y doubleprime is changed"
        A$ = INPUT$(1)
        LOCATE 1, 41: PRINT "                        "
   END IF
   
        IF ydoubleprimenot0stop = TRUE THEN
            IF SGN(preydoubleprime) = SGN(ydoubleprime) THEN
               LOCATE 1, 41: PRINT "ydoubleprime <> 0"
               A$ = INPUT$(1)
               LOCATE 1, 41: PRINT "                 "
            END IF
         END IF

'   IF ydoubleprime0stop = TRUE AND ydoubleprime > -1 * limitofwrong AND ydoubleprime < limitofwrong THEN a$ = INPUT$(1)
'   IF ydoubleprimenot0stop = TRUE THEN
'        IF ydoubleprime < -1 * limitofwrong OR ydoubleprime > limitofwrong THEN a$ = INPUT$(1)
'   END IF

   IF x = 0! THEN LINE (0, -100)-(0, 100), 4
   IF x >= 0 THEN x = x + XPLUS
   IF x < 0 THEN x = x + 1
   IF endx - x > -limitofwrong AND endx - x < limitofwrong THEN EXIT DO
LOOP

