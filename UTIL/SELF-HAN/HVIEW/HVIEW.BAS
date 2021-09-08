DECLARE SUB qp (str AS STRING, qrow AS INTEGER, qcolumn AS INTEGER, qhite AS INTEGER, qwidth AS INTEGER, qchrtc AS INTEGER, qbackc AS INTEGER)
DECLARE SUB zf (way AS INTEGER, Fx AS INTEGER, Fy AS INTEGER, Tx AS INTEGER, Ty AS SINGLE)
ON ERROR GOTO errhandler
CONST True = -1
CONST False = 0
DIM linenumber AS INTEGER
DIM content AS STRING * 80
COLOR 15
CLS
FILES
INPUT "File Path:", filepath$
    IF filepath$ = "" THEN END
    OPEN filepath$ FOR INPUT AS #1
    CLS

SCREEN 12
VIEW PRINT 1 TO 30

DO WHILE NOT EOF(1)
LINE INPUT #1, content
 linenumber = linenumber + 1
 qp content, 0, linenumber * 16, 16, 16, 15, 0
 IF linenumber = 27 THEN
 LOCATE 29: COLOR 3: PRINT "== Press Any Key To Continue == [Esc] to Exit": COLOR 15
      a$ = INPUT$(1)
         IF a$ = CHR$(27) THEN EXIT DO
         linenumber = 0
 CLS
 END IF
LOOP

END

errhandler:
SELECT CASE ERR
       CASE 52, 53, 64, 75, 76
       PRINT "Sorry. Not exist File. program down. made by Seo 1998"
       CASE 7
       PRINT "Sorry. Out of Memory. program down. made by Seo 1998"
       CASE ELSE
       PRINT "Sorry. Unknown Error. program down. made by Seo 1998"
END SELECT

END

SUB qp (str AS STRING, qrow AS INTEGER, qcolumn AS INTEGER, qhite AS INTEGER, qwidth AS INTEGER, qchrtc AS INTEGER, qbackc AS INTEGER)
DIM Code AS LONG
DIM count AS INTEGER
DIM codeF AS INTEGER
DIM codeM AS INTEGER
DIM codeL AS INTEGER

SHARED row AS INTEGER
SHARED column AS INTEGER
SHARED cwidth AS INTEGER
SHARED chite AS INTEGER
SHARED chrtc AS INTEGER
SHARED backc AS INTEGER
DIM fm  AS INTEGER
row = qrow
column = qcolumn
cwidth = qwidth
chite = qhite
chrtc = qchrtc
backc = qbackc

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
             LOCATE column / chite + 1, row / (cwidth / 2) + 1
                        PRINT MID$(str, count + i - 1, 1)

     END SELECT
    row = row + cwidth / 2
NEXT
RETURN

END SUB

SUB zf (way AS INTEGER, Fx AS INTEGER, Fy AS INTEGER, Tx AS INTEGER, Ty AS SINGLE)
SHARED row AS INTEGER
SHARED column AS INTEGER
SHARED cwidth AS INTEGER
SHARED chite AS INTEGER
SHARED chrtc AS INTEGER
SHARED backc AS INTEGER

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

