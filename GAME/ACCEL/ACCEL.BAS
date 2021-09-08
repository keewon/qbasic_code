DECLARE SUB viewtext (filename AS STRING)
DECLARE SUB config ()
DECLARE SUB qp (str AS STRING, qrow AS INTEGER, qcolumn AS INTEGER, qchrtc AS INTEGER)
DECLARE SUB retry ()
DECLARE SUB engine ()
DECLARE SUB ending ()
DECLARE SUB logo ()
DECLARE SUB message (comment$)
DECLARE SUB menu ()
DECLARE SUB config ()

DECLARE SUB stage (stagenumber AS INTEGER)
DECLARE SUB main ()
DECLARE SUB zf (way AS INTEGER, Fx AS INTEGER, Fy AS INTEGER, Tx AS INTEGER, Ty AS SINGLE)
ON ERROR GOTO errhandler
CONST laststagenumber = 9

SCREEN 12
VIEW PRINT 1 TO 30

CONST True = -1
CONST False = 0

CLS
logo
menu

errhandler:
SELECT CASE ERR
       CASE 52, 53, 64, 75, 76
       PRINT "Sorry. File Does not Exist. program down. made by Seo 1998"
       CASE 7
       PRINT "Sorry. Out of Memory. program down. made by Seo 1998"
       CASE 5
       PRINT "Sorry. Illegal function call. please check stage file. made by Seo 1998"
       CASE 62
       PRINT "Sorry. Input past end of file."
       PRINT "please check stage file's last column. This column should be filled"
       PRINT "made by Seo 1998"
       CASE ELSE
       PRINT "Sorry. Unknown Error. program down. made by Seo 1998"
       PRINT "Error Code:", ERR
END SELECT

temp$ = "[press Enter To Exit]"
PRINT temp$
DO
temp$ = INPUT$(1)
LOOP WHILE temp$ = ""
SYSTEM

SUB config
SHARED speed AS INTEGER
SHARED accel AS INTEGER
SHARED gravity AS INTEGER
       DO
           qp "‹¡¥¥ˆt·i ¬a¶wÐa¯¡‰V¯s“¡Œa (·w=Y,1 ´a“¡=N,3 aˆq=Q,0)->", 0, 28, 15
           LOCATE 26 + 2, 70:  temp$ = INPUT$(1)
           SELECT CASE temp$
              CASE "Y", "y", "1"
                OPEN "accel.cfg" FOR OUTPUT AS #2
                speed = 1800: accel = 8000: gravity = 1800
                WRITE #2, speed, accel, gravity: CLOSE #2: EXIT SUB
              CASE "N", "3", "n": EXIT DO
              CASE ELSE: EXIT SUB
           END SELECT
       LOOP

OPEN "accel.cfg" FOR INPUT AS #2
INPUT #2, speed, accel, gravity
       LOCATE 27: PRINT SPACE$(80)

       DO
           qp "­¢•¡Ÿi ‰¡Ÿa­A¶a(1-32767:Ñe¸ˆt =" + STR$(speed) + "->", 0, 28, 15
           LOCATE 26 + 2, 70: INPUT temp$
           IF temp$ = "" THEN EXIT DO
           IF VAL(temp$) <= 32767 AND VAL(temp$) >= 1 THEN
            speed = VAL(temp$)
            EXIT DO
            END IF
           qp "¹A”¡ ·³bÐa­A¶a", 0, 29, 4
           SLEEP 1: LOCATE 26 + 2, 50: PRINT "      "
       LOOP
       LOCATE 28: PRINT SPACE$(80)
       DO
           qp "Â»¥b·i ‰¡Ÿa­A¶a(1-32767:Ñe¸ˆt =" + STR$(accel) + "->", 0, 28, 15
           LOCATE 26 + 2, 70: INPUT temp$
           IF temp$ = "" THEN EXIT DO
           IF VAL(temp$) <= 32767 AND VAL(temp$) >= 1 THEN
               accel = VAL(temp$)
                EXIT DO
           END IF
           qp "¹A”¡ ·³bÐa­A¶a", 0, 29, 4
           SLEEP 1: LOCATE 26 + 2, 50: PRINT "      "
       LOOP
       LOCATE 28: PRINT SPACE$(80)
       DO
           qp "º—b ˆa­¢•¡Ÿi ‰¡Ÿa­A¶a(-32767 ~ 32767:Ñe¸ˆt =" + STR$(gravity) + "->", 0, 28, 15
           LOCATE 26 + 2, 70: INPUT temp$
           IF temp$ = "" THEN EXIT DO
           IF VAL(temp$) <= 32767 AND VAL(temp$) >= -32767 THEN
               gravity = VAL(temp$)
                EXIT DO
           END IF
           qp "¹A”¡ ·³bÐa­A¶a", 0, 29, 4
           SLEEP 1: LOCATE 26 + 2, 50: PRINT "      "
       LOOP
       LOCATE 28: PRINT SPACE$(80)

CLOSE #2
OPEN "accel.cfg" FOR OUTPUT AS #2
WRITE #2, speed, accel, gravity
CLOSE #2

END SUB

SUB ending
          LOCATE 26 + 0: PRINT SPACE$(80)
          LOCATE 26 + 1: PRINT SPACE$(80)
          LOCATE 26 + 2: PRINT SPACE$(80)
          LOCATE 26 + 3: PRINT SPACE$(80)

qp "[‰·¬aº—] ´a»¢ ”a  e—i»¡ ¡µÐ–¯s“¡”a. ˆq¬aÐs“¡”a.", 0, 29, 11
'qp "Àq i¡ ¸iÐ–¯s“¡”a. ·¡¹A ”w¯¥·e ´·¤e·¡ –A´ö¯s“¡”a.", 0, 29, 11

temp$ = INPUT$(1)
SYSTEM

END SUB

SUB engine
DIM x AS SINGLE
DIM y AS SINGLE
DIM prex AS SINGLE
DIM prey AS SINGLE
DIM k AS SINGLE
SHARED speed AS INTEGER
SHARED accel AS INTEGER
SHARED gravity AS INTEGER
SHARED stagenumber AS INTEGER
shared engineresult as integer

OPEN "accel.cfg" FOR INPUT AS #2
INPUT #2, speed, accel, gravity
CLOSE #2

IF speed > 32767 OR speed < 1 THEN speed = 1800
IF accel > 32767 OR accel < 1 THEN accel = 8000
IF gravity > 32767 OR gravity < -32767 THEN gravity = 1800

engineresult = False
x = 0: y = 0: prex = 0: prey = 0: k = 0

qp "=====> ¸a ¯¡¸bÐ ¥©Œa¶a. ´a¢ˆáa ’Ÿa­A¶a. ¹A " + STR$(stagenumber) + "  a”w", 0, 27, 15

LOCATE 30, 80
a$ = INPUT$(1)
a$ = ""

DO
x = x + speed * .0001
a$ = INKEY$

 SELECT CASE a$
  CASE CHR$(0) + "H", "8", "5", "w", "W": k = k - accel * .0001
  CASE CHR$(0) + "P", "2", "s", "S": k = k + accel * .0001
  CASE CHR$(27)
       engineresult = 27
       EXIT DO
  CASE "P", "p"
      qp "=====> µ¡º‘ as“¡? ¸åÑÁ µÖ“¡? ‹¡”aa º‰A...", 0, 28, 3
     
      pause$ = INPUT$(1)
  CASE ELSE
 END SELECT

 y = k * (x - prex) + prey

engineresult = POINT(x, y)
IF engineresult = 4 OR engineresult = 14 OR engineresult = 7 OR engineresult = -1 THEN EXIT DO
LOCATE 28
COLOR 0
 PRINT engineresult, x, y, k
 LINE (prex, prey)-(x, y), 3

prex = x
prey = y
k = k + gravity * .00001
a$ = ""

LOOP

END SUB

SUB logo
viewtext "story1.txt"
END SUB

SUB main
SHARED engineresult AS INTEGER
SHARED stagenumber AS INTEGER
IF stagenumber < 1 OR stagenumber > laststagenumber THEN EXIT SUB
DO
 stage (stagenumber)
 engine
 SELECT CASE engineresult
       CASE 27: EXIT DO
       CASE 4, 7, -1
            qp "=> ´eÈaŒs”a. ”a¯¡ •¡¸å Ða¯©œ¶a ?(µ:[Y,1]/´a“¡µ¡:[N,3]/‹a e: [Q,0])", 0, 29, 12
            DO
               LOCATE 29, 80:  temp$ = INKEY$
            SELECT CASE temp$
                  CASE "Y", "y", "N", "n", "Q", "q", "1", "3", "0": EXIT DO
                  CASE ELSE
            END SELECT
            LOOP

            SELECT CASE temp$
                   CASE "Y", "y", "1": stagenumber = stagenumber - 1
                   CASE "Q", "q", "0"
          LOCATE 26 + 2: PRINT SPACE$(80)
          LOCATE 26 + 3: PRINT SPACE$(80)

                   qp "´e‘wÓ¡ ˆa­A¶a ^^;  e—e·¡: ¬á‹¡¶¥ 1998", 0, 29, 15: SYSTEM
                   CASE "N", "n", "3": EXIT DO
            END SELECT
       CASE 14
            IF stagenumber = laststagenumber THEN ending
            qp "==> ‘A, ¸iÐa‰¡ ·¶¯s“¡”a. ‰­¢ ¸iÐ¥Á¶a. ”a·q a”w·e " + STR$(stagenumber + 1) + "  a”w", 0, 29, 14
            temp$ = INPUT$(1)
       CASE ELSE: PRINT "Sorry, It maybe has some bugs. please call me: 02) 646-4286": PRINT "End:Bugs": END
 END SELECT
 stagenumber = stagenumber + 1
LOOP

END SUB

SUB menu
SHARED stagenumber AS INTEGER
SHARED speed AS INTEGER
DO
          LOCATE 26 + 0: PRINT SPACE$(80)
          LOCATE 26 + 1: PRINT SPACE$(80)
          LOCATE 26 + 2: PRINT SPACE$(80)
          LOCATE 26 + 3: PRINT SPACE$(80)
qp "‰¡Ÿa­A¶a==> 1. a”w³i‹¡ 2.§µ¸až¤aŽ‹¡ 3.º·¥¸w 4.”aŸe a”w 0.{‹¡", 0, 27, 15
temp$ = INPUT$(1)
 SELECT CASE temp$
       CASE "1": stagenumber = 1: main
       CASE "2": config
       CASE "3": viewtext "accel.cap": CLS
       CASE "4"
           qp "ˆi  a”w·e? (1-" + STR$(laststagenumber) + ")", 0, 28, 15
           LOCATE 28, 20: INPUT temp$
           stagenumber = VAL(temp$)
           main
       CASE "0": qp "´e‘wÓ¡ ˆa­A¶a ^^;  e—e·¡: ¬á‹¡¶¥ 1998", 0, 29, 15: SYSTEM
       CASE ELSE
 END SELECT
LOOP

END SUB

SUB qp (str AS STRING, qrow AS INTEGER, qcolumn AS INTEGER, qchrtc AS INTEGER)

DIM Code AS LONG
DIM count AS INTEGER
DIM codeF AS INTEGER
DIM codeM AS INTEGER
DIM codeL AS INTEGER

SHARED chrtc AS INTEGER
SHARED row AS INTEGER
SHARED column AS INTEGER
DIM fm  AS INTEGER

row = qrow
column = (qcolumn - 1) * 16
cwidth = 16
chite = 16
chrtc = qchrtc
 
FOR count = 1 TO LEN(str) STEP 2
    IF INT(ASC(MID$(str, count, 1)) / 2 ^ 7) = 0 THEN GOSUB printEng ELSE GOSUB PrintHan
NEXT count

EXIT SUB

PrintHan:
Code = (ASC(MID$(str, count, 1)) * 2 ^ 8 + ASC(MID$(str, count + 1, 1))) MOD 2 ^ 15
codeF = INT(Code / (2 ^ 10))
codeM = INT(Code / (2 ^ 5)) MOD (2 ^ 5) + 32
codeL = Code MOD (2 ^ 5) + 64
'SELECT CASE codeM
    IF codeM >= 35 AND codeM <= 39 THEN zf 1, 14, 1, 14, 8
    IF codeM >= 42 AND codeM <= 44 THEN zf 1, 14, 1, 14, 8
    IF codeM = 46 OR codeM = 47 OR codeM = 50 THEN zf 1, 14, 1, 14, 8
    IF codeM >= 53 AND codeM <= 55 THEN zf 1, 14, 1, 14, 8
    IF codeM = 60 OR codeM = 61 THEN zf 1, 14, 1, 14, 8
    IF codeM = 36 OR codeM = 38 OR codeM = 42 OR codeM = 44 OR codeM = 47 OR codeM = 54 THEN zf 1, 11, 1, 11, 8
    IF codeM = 35 OR codeM = 46 THEN zf 1, 14, 3, 16, 3
    IF codeM = 36 OR codeM = 47 THEN zf 1, 12, 3, 14, 3
    IF codeM = 37 THEN
         zf 1, 14, 2, 16, 2
         zf 1, 14, 4, 16, 4
    END IF
    IF codeM = 44 THEN
         zf 1, 8, 2, 10, 2
         zf 1, 8, 4, 10, 4
    END IF
    IF codeM = 39 OR codeM = 53 THEN zf 1, 12, 3, 14, 3
    IF codeM = 42 OR codeM = 54 THEN zf 1, 8, 3, 10, 3
    IF codeM = 43 OR codeM = 38 THEN
         zf 1, 12, 2, 14, 2
         zf 1, 12, 4, 14, 4
    END IF
    IF codeM = 45 OR codeM = 51 OR codeM = 59 THEN zf 1, 2, 8, 14, 8
    IF codeM = 52 OR codeM = 58 THEN zf 1, 2, 7, 14, 7
    IF codeM = 45 THEN zf 1, 8, 6, 8, 7
    IF codeM = 46 OR codeM = 47 OR codeM = 50 THEN
         zf 1, 1, 8, 7, 8
         zf 1, 4, 8, 4, 6
    END IF
    IF codeM = 51 THEN
         zf 1, 6, 6, 6, 8
         zf 1, 10, 6, 10, 8
    END IF
    IF codeM = 52 THEN zf 1, 8, 9, 8, 8
    IF codeM >= 53 AND codeM <= 55 THEN
         zf 1, 1, 7, 7, 7
         zf 1, 4, 8, 4, 9
    END IF
    IF codeM = 58 THEN
         zf 1, 6, 9, 6, 8
         zf 1, 10, 9, 10, 8
    END IF
    IF codeM = 60 THEN zf 1, 1, 7, 7, 7
    IF codeM = 45 OR codeM = 52 OR codeM = 51 OR codeM = 58 OR codeM = 59 THEN fm = True ELSE fm = False

'SELECT CASE codeF
    IF codeF = 2 OR codeF = 3 OR codeF = 5 OR codeF = 6 OR codeF = 7 OR codeF = 8 THEN zf 1, 2, 1, 8 + fm * (-6), 1
    IF codeF = 14 OR codeF = 15 OR codeF = 17 OR codeF = 18 OR codeF = 19 THEN zf 1, 2, 1, 8 + fm * (-6), 1
    IF codeF >= 4 AND codeF <= 10 THEN zf 1, 2, 5, 8 + fm * (-6), 5
    IF codeF = 18 OR codeF = 19 THEN zf 1, 2, 5, 8 + fm * (-6), 5
    IF codeF >= 4 AND codeF <= 6 THEN zf 1, 2, 1, 2, 5
    IF codeF = 8 OR codeF = 9 OR codeF = 10 OR codeF = 18 THEN zf 1, 2, 1, 2, 5
    IF codeF = 2 OR codeF = 3 OR codeF = 8 OR codeF = 9 OR codeF = 10 OR codeF = 17 THEN zf 1, 8 + fm * (-6), 1, 8 + fm * (-6), 5
    IF codeF = 3 OR codeF = 6 OR codeF = 10 THEN zf 1, 5 + fm * (-3), 1, 5 + fm * (-3), 5
    IF codeF = 7 OR codeF = 9 OR codeF = 10 OR codeF = 17 OR codeF = 18 THEN zf 1, 2, 3, 8 + fm * (-6), 3
    IF codeF = 7 THEN
         zf 6, 8 + fm * (-6), 2, 0, 0
         zf 6, 2, 4, 0, 0
    END IF
    IF codeF = 16 OR codeF = 20 THEN
         zf 6, 5 + fm * (-3), 0, 0, 0
         zf 1, 2, 1, 8 + fm * (-6), 1
    END IF
    IF codeF = 11 OR codeF = 14 OR codeF = 16 THEN
         zf 1, 5 + fm * (-3), 1, 2, 5
         zf 1, 5 + fm * (-3), 1, 8 + fm * (-6), 5
    END IF
    IF codeF = 12 OR codeF = 15 THEN
         zf 1, 4 + fm * (-1), 1, 2, 5
         zf 1, 4 + fm * (-1), 1, 5 + fm * (-3), 5
         zf 1, 7 + fm * (-4), 1, 5 + fm * (-3), 5
         zf 1, 7 + fm * (-4), 1, 8 + fm * (-6), 5
    END IF
    IF codeF = 13 THEN
         zf 4, 5 + fm * (-3), 3, 2, 1
    END IF
    IF codeF = 19 THEN zf 2, 4 + fm * (-1), 1, 6 + fm * (-5), 5
    IF codeF = 20 THEN zf 4, 5 + fm * (-3), 3, 2, 1

'SELECT CASE codeL
fm = False
    IF codeL = 66 OR codeL = 67 OR codeL = 72 OR codeL = 73 OR codeL = 81 OR codeL = 88 OR codeL = 90 OR codeL = 91 OR codeL = 92 THEN zf 1, 2, 10, 14, 10
    IF codeL = 69 OR codeL = 72 OR codeL = 73 OR codeL = 81 OR codeL = 83 OR codeL = 91 OR codeL = 92 THEN zf 1, 2, 14, 14, 14
    IF codeL = 69 OR codeL = 72 OR codeL = 81 OR codeL = 83 OR codeL = 91 THEN zf 1, 2, 10, 2, 14
    IF codeL = 66 OR codeL = 81 OR codeL = 83 OR codeL = 90 THEN zf 1, 14, 10, 14, 14
    IF codeL = 73 OR codeL = 91 OR codeL = 90 OR codeL = 83 THEN zf 1, 2, 12, 14, 12
    IF codeL = 73 THEN
         zf 6, 2, 13, 0, 0
         zf 6, 14, 11, 0, 0
    END IF
    IF codeL = 89 OR codeL = 93 THEN
         zf 6, 8, 10, 0, 0
         zf 1, 1, 11, 11, 11
    END IF
    IF codeL = 85 OR codeL = 88 OR codeL = 89 THEN
         zf 1, 8, 10, 2, 14
         zf 1, 8, 10, 14, 14
    END IF
    IF codeL = 87 THEN zf 4, 8, 12, 2, 1
    IF codeL = 93 THEN zf 4, 8, 12, 2, 1
    IF codeL = 67 OR codeL = 68 THEN
         zf 1, 1, 10, 6, 10
         zf 1, 6, 10, 6, 14
    END IF
    IF codeL = 71 OR codeL = 70 THEN
         zf 1, 1, 10, 1, 14
         zf 1, 1, 14, 6, 14
    END IF
    IF codeL >= 74 AND codeL <= 80 THEN
         zf 1, 1, 10, 6, 10
         zf 1, 1, 12, 6, 12
         zf 1, 1, 14, 6, 14
         zf 6, 1, 13, 0, 0
         zf 6, 6, 11, 0, 0
    END IF
    IF codeL = 84 THEN
         zf 2, 1, 12, 6, 14
         zf 1, 1, 10, 1, 11
         zf 1, 6, 10, 6, 11
    END IF
    IF codeL = 67 OR codeL = 70 OR codeL = 74 OR codeL = 75 OR codeL = 78 OR codeL = 79 THEN zf 1, 9, 10, 14, 10
    IF codeL = 67 OR codeL = 74 OR codeL = 75 OR codeL = 76 THEN zf 1, 14, 10, 14, 14
    IF codeL = 68 OR codeL = 70 OR codeL = 77 OR codeL = 84 OR codeL = 86 THEN
         zf 1, 8, 14, 11, 10
         zf 1, 14, 14, 12, 10
    END IF
    IF codeL = 86 THEN
         zf 1, 1, 14, 3, 10
         zf 1, 6, 14, 4, 10
    END IF
    IF codeL = 75 OR codeL = 76 OR codeL = 78 THEN zf 1, 9, 10, 9, 14
    IF codeL = 71 OR codeL = 80 THEN
         zf 6, 11, 10, 0, 0
         zf 1, 9, 11, 14, 11
         zf 4, 11, 13, 2, .5
    END IF
    IF codeL = 75 OR codeL = 76 OR codeL = 78 OR codeL = 79 THEN zf 1, 9, 14, 14, 14
    IF codeL = 79 THEN zf 2, 10, 10, 13, 14
     row = row + cwidth
RETURN

printEng:
FOR i = 1 TO 2 STEP 1
   IF count + i - 1 > LEN(str) THEN EXIT FOR
   IF ASC(MID$(str, count + i - 1, 1)) >= 129 THEN
        count = count - 1
      EXIT FOR
   END IF
   codeF = ASC(MID$(str, count + i - 1, 1))
   IF INT(codeF) / 2 ^ 7 = 1 THEN
       count = count - 1
       EXIT FOR
   END IF
     SELECT CASE codeF
         CASE 48
         zf 2, 1, 1, 6, 14
         CASE 49
         zf 1, 6, 1, 6, 14
         CASE 50
         zf 1, 1, 1, 6, 1
         zf 1, 6, 1, 6, 7
         zf 1, 6, 7, 1, 7
         zf 1, 1, 7, 1, 14
         zf 1, 1, 14, 6, 14
         CASE 51
         zf 1, 1, 1, 6, 1
         zf 1, 6, 7, 1, 7
         zf 1, 1, 14, 6, 14
         zf 1, 6, 1, 6, 14
         CASE 52
         zf 1, 1, 1, 1, 7
         zf 1, 6, 7, 1, 7
         zf 1, 6, 1, 6, 14
         CASE 53
         zf 1, 1, 1, 6, 1
         zf 1, 1, 1, 1, 7
         zf 1, 6, 7, 1, 7
         zf 1, 6, 7, 6, 14
         zf 1, 1, 14, 6, 14
         CASE 54
         zf 1, 1, 1, 6, 1
         zf 1, 1, 1, 1, 7
         zf 2, 1, 7, 6, 14
         CASE 55
         zf 1, 1, 1, 6, 1
         zf 1, 6, 1, 6, 14
         CASE 56
         zf 2, 1, 1, 6, 7
         zf 2, 1, 7, 6, 14
         CASE 57
         zf 2, 1, 1, 6, 7
         zf 1, 6, 7, 6, 14
         zf 1, 1, 14, 6, 14
         CASE ELSE
             LOCATE qcolumn, row / (cwidth / 2) + 1
             COLOR chrtc
                        PRINT MID$(str, count + i - 1, 1)

     END SELECT
    row = row + cwidth / 2
NEXT
RETURN

END SUB

SUB stage (stagenumber AS INTEGER)
CLS
'when You make stage , You should change laststagenumber (it locates in Main procedure(not Main sub-routine))
SCREEN 12
DIM x1 AS INTEGER
DIM x2 AS INTEGER
DIM y1 AS INTEGER
DIM y2 AS SINGLE
DIM c AS INTEGER
DIM comm AS INTEGER
DIM filename AS STRING
filename = STR$(stagenumber) + ".stg"
OPEN RTRIM$(LTRIM$(filename)) FOR INPUT AS #4

LINE (0, 0)-(639, 405), 7, B
LINE (5, 5)-(634, 400), 7, B
PAINT (1, 20), 7, 7
LINE (0, 0)-(639, 5), 0, BF
LINE (0, 0)-(3, 3), 3, BF
DO
         INPUT #4, comm, x1, y1, x2, y2, c, comment$
SELECT CASE comm
     CASE 5
       qp comment$, x1, y1, c
     CASE 3
       LINE -(x1, y1), c
     CASE 2
       SELECT CASE comment$
        CASE "B", "b"
             LINE (x1, y1)-(x2, y2), c, B
        CASE "bf", "BF"
             LINE (x1, y1)-(x2, y2), c, BF
        CASE ELSE
             LINE (x1, y1)-(x2, y2), c
        END SELECT
     CASE 4
       SELECT CASE comment$
        CASE "bf", "BF"
             CIRCLE (x1, y1), x2, c, , , y2
             PAINT (x1, y1), c, c
        CASE ELSE
             CIRCLE (x1, y1), x2, c, , , y2
        END SELECT

     CASE 1: PSET (x1, y1), c
     CASE 7: PAINT (x1, y1), c, x2

   END SELECT

LOOP UNTIL (EOF(4))


CLOSE #4

END SUB

SUB viewtext (filename AS STRING)
CLS

DIM linenumber AS INTEGER
DIM content AS STRING * 80
    OPEN filename FOR INPUT AS #1
    CLS

DO WHILE NOT EOF(1)
LINE INPUT #1, content
 linenumber = linenumber + 1
 qp content, 0, linenumber, 15
 temp$ = INKEY$
 IF temp$ <> "" THEN EXIT DO
 IF linenumber = 27 THEN
 qp "[´a¢ˆáa ’Ÿa­A¶a]", 0, 28, 13
      temp$ = INPUT$(1)
         IF temp$ = CHR$(27) THEN EXIT DO
         linenumber = 0
         CLS
 END IF
LOOP
CLOSE #1
END SUB

SUB zf (way AS INTEGER, Fx AS INTEGER, Fy AS INTEGER, Tx AS INTEGER, Ty AS SINGLE)

SHARED row AS INTEGER
SHARED column AS INTEGER
SHARED chrtc AS INTEGER
cwidth = 16
chite = 16

SELECT CASE way
    CASE 1  'line
     LINE ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16))-((row + Tx) * (cwidth / 16), (column + Ty) * (chite / 16)), chrtc
    CASE 2  'line b
     LINE ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16))-((row + Tx) * (cwidth / 16), (column + Ty) * (chite / 16)), chrtc, B
    CASE 3 'line bf
     LINE ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16))-((row + Tx) * (cwidth / 16), (column + Ty) * (chite / 16)), chrtc, BF
    CASE 4  'circle
     CIRCLE ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16)), Tx, chrtc, , , Ty
    CASE 5  'circle bf
     CIRCLE ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16)), Tx, chrtc, , , Ty
     PAINT ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16)), chrtc
    CASE 6  'pset
     PSET ((row + Fx) * (cwidth / 16), (column + Fy) * (chite / 16)), chrtc
END SELECT
END SUB

