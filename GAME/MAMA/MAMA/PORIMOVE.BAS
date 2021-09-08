CONST WINDOWSIZE = 0
CONST TITLESIZE = 0
CONST STARTX = 0
CONST STARTy = 0 + TITLESIZE
CLS
TYPE picture
  p AS STRING * 32
END TYPE

DIM pic AS picture
OPEN "pori" FOR RANDOM AS #3 LEN = LEN(pic)
order = 1
SCREEN 12
CLS

PAINT (1, 1), 2
numberofrecord = LOF(3) / 32

FOR I = 1 TO 32       'sero
FOR k = 1 TO 32       'garo
GET #3, I + (order - 1) * 32 * 32, pic.p

PD$ = MID$(pic.p, k, 1)

SELECT CASE PD$
CASE "0": pdcolor = 0
CASE "1": pdcolor = 1
CASE "2": pdcolor = 2
CASE "3": pdcolor = 3
CASE "4": pdcolor = 4
CASE "5": pdcolor = 5
CASE "6": pdcolor = 6
CASE "7": pdcolor = 7
CASE "8": pdcolor = 8
CASE "9": pdcolor = 9
CASE "A", "a": pdcolor = 10
CASE "B", "b": pdcolor = 11
CASE "C", "c": pdcolor = 12
CASE "D", "d": pdcolor = 13
CASE "E", "e": pdcolor = 14
CASE "F", "f": pdcolor = 15
CASE ELSE: pdcolor = 16
END SELECT

IF pdcolor <> 16 THEN PSET ((k + STARTX), (I + STARTy)), pdcolor
           
NEXT
NEXT
DIM pori(32 * 8)
DIM pori2(32 * 8)
GET (0, 0)-(32, 32), pori
GET (640 - 32, 0)-(640, 32), pori2

x1 = 0: y1 = 0
DO
oldx = x1: oldy = y1
kbda$ = INKEY$
 
IF kbda$ <> kbdb$ THEN
SELECT CASE kbda$

  CASE CHR$(0) + "H": y1 = y1 - 16
  CASE CHR$(0) + "P": y1 = y1 + 16
  CASE CHR$(0) + "M": x1 = x1 + 16
  CASE CHR$(0) + "K": x1 = x1 - 16
  CASE CHR$(27), "Q", "q": CLOSE : END
CASE ELSE

END SELECT

  IF x1 > 640 - 33 THEN x1 = 640 - 33
  IF x1 < 0 THEN x1 = 0
  IF y1 > 480 - 33 THEN y1 = 480 - 33
  IF y1 < 0 THEN y1 = 0

PUT (oldx, oldy), pori2, PSET
GET (x1, y1)-(x1 + 32, y1 + 32), pori2
PUT (x1, y1), pori, PSET

LOCATE 3: PRINT x1, y1, kbda$, kbdb$
LOCATE 5, 40: PRINT "Pori"
LOCATE 7, 40: PRINT "Quit"

IF x1 >= 320 AND x1 < 320 + 32 AND y1 >= 64 AND y1 < 64 + 16 THEN
PRINT "Pori Man Se"
ELSEIF x1 >= 320 AND x1 < 320 + 32 AND y1 >= 96 AND y1 < 96 + 16 THEN
 PRINT "Hurray     "
ELSE
PRINT "           "
END IF

END IF

kbdb$ = kbda$


LOOP


END


