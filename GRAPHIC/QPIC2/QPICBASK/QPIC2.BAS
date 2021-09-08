DECLARE SUB openfile ()
DECLARE SUB linetoline ()
DECLARE SUB subfilename (what AS INTEGER)
DECLARE SUB menu ()
DECLARE SUB subget ()
DECLARE SUB subput ()
DECLARE SUB subxyc ()
DECLARE SUB free ()
DECLARE SUB subcircle ()
DECLARE SUB qqq ()
DECLARE SUB subcolor ()
DECLARE SUB quit ()
DECLARE SUB main ()
DECLARE SUB subdot ()
DECLARE SUB subpaint ()
DECLARE SUB cursor ()
DECLARE SUB subline ()

CLS
DIM SHARED filename AS STRING * 12
DIM SHARED x, y, c, sm AS INTEGER
DIM SHARED getandput(1 TO 5000)
c = 7
COLOR c

menu

SUB cursor

SHARED sendx, sendy
 SELECT CASE sm
   CASE IS = 12
   maxx = 640
   maxy = 480
   CASE IS = 13
   maxx = 320
   maxy = 200
 END SELECT
  DIM cu(3)
DO


 GET (x, y)-(x, y), cu
 PSET (x, y), 15
   pprex = prex: pprey = prey
  prex = x: prey = y


LOCATE 1
PRINT x; ; y; ; c

a$ = INPUT$(1)
SELECT CASE a$
  CASE "4": x = x - 1
  CASE "6": x = x + 1
  CASE "2": y = y + 1
  CASE "8": y = y - 1
  CASE "1": x = x - 1: y = y + 1
  CASE "9": x = x + 1: y = y - 1
  CASE "3": x = x + 1: y = y + 1
  CASE "7": x = x - 1: y = y - 1
  CASE "0": sendx = x: sendy = y: EXIT DO
  CASE "q", "Q": main
END SELECT

  IF x > maxx THEN x = maxx
  IF x < 0 THEN x = 0
  IF y > maxy THEN y = maxy
  IF y < 0 THEN y = 0

    PUT (pprex, pprey), cu, PSET
LOOP
END SUB

SUB free

SHARED sendx, sendy
 SELECT CASE sm
   CASE IS = 12
    maxx = 640
    maxy = 480
   CASE IS = 13
    maxx = 320
    maxy = 200
 END SELECT
qqq
DO
  prex = x: prey = y

LOCATE 1
PRINT x; ; y; ; c

a$ = INPUT$(1)
SELECT CASE a$
  CASE "4": x = x - 1
  CASE "6": x = x + 1
  CASE "2": y = y + 1
  CASE "8": y = y - 1
  CASE "1": x = x - 1: y = y + 1
  CASE "9": x = x + 1: y = y - 1
  CASE "3": x = x + 1: y = y + 1
  CASE "7": x = x - 1: y = y - 1
  CASE "0": EXIT DO
  CASE "q", "Q": main
END SELECT

  IF x > maxx THEN x = maxx
  IF x < 0 THEN x = 0
  IF y > maxy THEN y = maxy
  IF y < 0 THEN y = 0

  PSET (x, y)

  IF prex <> x OR prey <> y THEN WRITE #1, "pset", x, y, x, y

LOOP
  main

END SUB

SUB linetoline
SHARED sendx, sendy
 SELECT CASE sm
   CASE IS = 12
    maxx = 640
    maxy = 480
   CASE IS = 13
    maxx = 320
    maxy = 200
 END SELECT

qqq
  INPUT "x1="; lx1$
    SELECT CASE lx1$
      CASE ""
      cursor
         x1 = sendx
         y1 = sendy
      CASE "Q", "q": main
      CASE ELSE
      qqq
       INPUT "y1="; ly1$
     x1 = VAL(lx1$)
     y1 = VAL(ly1$)
    END SELECT
      PSET (x1, y1)
  WRITE #1, "Line", x1, y1, x1, y1




DO
  prex = x: prey = y

LOCATE 1
PRINT x; ; y; ; c

a$ = INPUT$(1)
SELECT CASE a$
  CASE "4": x = x - 1
  CASE "6": x = x + 1
  CASE "2": y = y + 1
  CASE "8": y = y - 1
  CASE "1": x = x - 1: y = y + 1
  CASE "9": x = x + 1: y = y - 1
  CASE "3": x = x + 1: y = y + 1
  CASE "7": x = x - 1: y = y - 1
  CASE "0"
     x2 = x: y2 = y
    LINE (x1, y1)-(x2, y2)
    WRITE #1, "to", x2, y2
    x1 = x2: y1 = y2
  CASE "q", "Q": main
END SELECT

  IF x > maxx THEN x = maxx
  IF x < 0 THEN x = 0
  IF y > maxy THEN y = maxy
  IF y < 0 THEN y = 0

  PRESET (prex, prey)
  PSET (x, y)
  

LOOP
  main





END SUB

SUB main

DO
qqq         '    1         2         3
       '123456789012345678901234567890123
 PRINT "LineDotXycPaintFreeCircleGetpUtToOpenQ?"
 COLOR 14
LOCATE 1, 1:  PRINT "L"
LOCATE 1, 5:  PRINT "D"
LOCATE 1, 8:  PRINT "X"
LOCATE 1, 11: PRINT "P"
LOCATE 1, 16: PRINT "F"
LOCATE 1, 20: PRINT "C"
LOCATE 1, 26: PRINT "G"
LOCATE 1, 30: PRINT "U"
LOCATE 1, 32: PRINT "T"
LOCATE 1, 34: PRINT "Q"

a$ = INPUT$(1)

  SELECT CASE a$
     CASE "L", "l": subline
     CASE "d", "D": subdot
     CASE "x", "X"
     CASE "Q", "q": quit
     CASE "O", "o": openfile
     CASE "p", "P": subpaint
     CASE "f", "F": free
     CASE "T", "t": linetoline
     CASE "c", "C": subcircle
     CASE "g", "G": subget
     CASE "u", "U": subput
  END SELECT
  LOOP
END SUB

SUB menu
 DO
 CLS
LOCATE 3
   PRINT "Qpic 2 "
   PRINT ""

   INPUT "Select      1.del  2.new 3.open 4.quit"; what
     IF what = 4 THEN END
     IF 0 < what AND what < 5 THEN subfilename (what)
   
 LOOP
END SUB

SUB openfile
SCREEN 12
OPEN "jordan.qpc" FOR INPUT AS #2

DO

   INPUT #2, COMM$, x1%, y1%, x2%, y2%

   SELECT CASE COMM$
     CASE "to"
       LINE -(x1, y1)
     CASE "line"
       LINE (x1, y1)-(x2, y2)
     CASE "circle"
       CIRCLE (x1, y1), x2
     CASE "pset"
       PSET (x1, y1)
     CASE "paint"
       PAINT (x1, y1)
   END SELECT
LOOP UNTIL (EOF(2))

END SUB

SUB qqq
 LOCATE 1
 PRINT SPACE$(80)
 LOCATE 1
END SUB

SUB quit


 CLOSE
 END
END SUB

SUB subcircle
SHARED sendx, sendy

 
qqq

  INPUT "x1="; dx1$
    SELECT CASE dx1$
      CASE ""
       cursor
       x1 = sendx
       y1 = sendy
      CASE "q", "Q": main
      CASE ELSE
qqq
      INPUT "y1="; dy1$

       x1 = VAL(dx1$): y1 = VAL(dy1$)
    END SELECT
    PSET (x1, y1)
  qqq
  INPUT "r="; r$
     SELECT CASE r$
      CASE ""
       cursor
       r = SQR((sendx - x1) ^ 2 + (sendy - y1) ^ 2)
      CASE "q", "Q": main
      CASE ELSE
        r = VAL(r$)
      END SELECT
     CIRCLE (x1, y1), r
  
  WRITE #1, "circle", x1, y1, r, r

  main



END SUB

SUB subdot
SHARED sendx, sendy
 
  DO
qqq

  INPUT "x1="; dx1$
    SELECT CASE dx1$
      CASE ""
       cursor
       x1 = sendx
       y1 = sendy
      CASE "q", "Q": EXIT DO
      CASE ELSE
qqq
      INPUT "y1="; dy1$

       x1 = VAL(dx1$): y1 = VAL(dy1$)
    END SELECT

  PSET (x1, y1)

   
  WRITE #1, "pset", x1, y1, x1, y1
LOOP
  main
END SUB

SUB subfilename (what AS INTEGER)
qqq

  
  FILES
  INPUT "filename (*.bas)"; filename
  IF filename = "            " THEN menu
   SELECT CASE what
     CASE 1
      KILL filename
      menu
     CASE 2
      INPUT "screen mode (12 or 13)"; sm
          OPEN filename FOR APPEND AS #1
           SCREEN sm

           main
     CASE 3
      openfile

     CASE ELSE: menu
     END SELECT

  CLS
END SUB

SUB subget
SHARED sendx, sendy


qqq
  INPUT "x1="; lx1$
    SELECT CASE lx1$
      CASE ""
      cursor
         x1 = sendx
         y1 = sendy
      CASE "Q", "q":
      CASE ELSE
      qqq
       INPUT "y1="; ly1$
     x1 = VAL(lx1$): y1 = VAL(ly1$)
    END SELECT


qqq
 INPUT "x2="; lx2$
    SELECT CASE lx2$
      CASE ""
       cursor
       x2 = sendx
       y2 = sendy

      CASE ELSE
        qqq
         INPUT "y2="; ly2$

       x2 = VAL(lx2$): y2 = VAL(ly2$)
    END SELECT
 qqq
  GET (x1, y1)-(x2, y2), getandput
  WRITE #1, "get", x1, y1, x2, y2, ",getandput"
  

main

END SUB

SUB subline
SHARED sendx, sendy

DO
qqq
  INPUT "x1="; lx1$
    SELECT CASE lx1$
      CASE ""
      cursor
         x1 = sendx
         y1 = sendy
      CASE "Q", "q": EXIT DO
      CASE ELSE
      qqq
       INPUT "y1="; ly1$
     x1 = VAL(lx1$)
     y1 = VAL(ly1$)
    END SELECT
      PSET (x1, y1)

qqq
 INPUT "x2="; lx2$
    SELECT CASE lx2$
      CASE ""
       cursor
       x2 = sendx
       y2 = sendy

      CASE ELSE
        qqq
         INPUT "y2="; ly2$

       x2 = VAL(lx2$): y2 = VAL(ly2$)
    END SELECT
    PSET (x2, y2)
 qqq
   INPUT "b or bf "; borbf$
  SELECT CASE borbf$
          CASE "b"
            LINE (x1, y1)-(x2, y2), , B
          CASE "bf"
            LINE (x1, y1)-(x2, y2), , BF
          CASE ELSE
            LINE (x1, y1)-(x2, y2)
  END SELECT

    
  WRITE #1, "Line", x1, y1, x2, y2
LOOP
main
END SUB

SUB subpaint
SHARED sendx, sendy
qqq

  INPUT "x1="; px1$
    SELECT CASE px1$
      CASE "q", "Q": main
      CASE ""
      cursor
       x1 = sendx
       y1 = sendy

      CASE ELSE
      qqq
  INPUT "y1="; py1$

      x1 = VAL(px1$): y1 = VAL(py1$)
    END SELECT



 PAINT (x1, y1)
   
  WRITE #1, "paint", x1, y1, x1, y1
  main
END SUB

SUB subput
SHARED sendx, sendy

qqq
  INPUT "x1="; lx1$
    SELECT CASE lx1$
      CASE ""
      cursor
         x1 = sendx
         y1 = sendy
      CASE "Q", "q": main
      CASE ELSE
      qqq
       INPUT "y1="; ly1$
     x1 = VAL(lx1$)
     y1 = VAL(ly1$)
    END SELECT
qqq
    INPUT "and,or,pset,preset,xor"; how$
       SELECT CASE how$
              CASE "and", "AND":       PUT (x1, y1), getandput, AND
              CASE "or", "OR":         PUT (x1, y1), getandput, OR
              CASE "pset", "PSET":     PUT (x1, y1), getandput, PSET
              CASE "preset", "PRESET": PUT (x1, y1), getandput, PRESET
              CASE "xor", "XOR":       PUT (x1, y1), getandput, XOR
              CASE ELSE:               PUT (x1, y1), getandput
       END SELECT
    WRITE #1, "put", x1, y1, "getandput", how$

main

END SUB

