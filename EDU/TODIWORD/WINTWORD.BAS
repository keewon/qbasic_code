DECLARE SUB start ()
DECLARE SUB qhan (han$, row, column, CHRTC, backc)
DECLARE SUB cprint (sentence AS STRING, row AS INTEGER, column AS INTEGER, CHRTC AS INTEGER)
DECLARE SUB CLEAN ()
DECLARE SUB makewfile ()
DECLARE SUB main ()
DECLARE SUB cfgfileopen ()
DECLARE SUB suberrhandle ()
DECLARE SUB show ()
DECLARE SUB saverand ()
DECLARE SUB help ()
DECLARE SUB quit ()
DECLARE SUB showmean ()
DECLARE SUB reconfig ()
TYPE word
 content AS STRING * 30
 mean AS STRING * 30
END TYPE

DIM SHARED nwf1 AS INTEGER
DIM SHARED nword AS INTEGER

ON ERROR GOTO errhandle
SCREEN 12

CLEAN

OPEN "eng1.fnt" FOR BINARY AS #4
 OPEN "4divi.fnt" FOR BINARY AS #5
cfgfileopen
DIM SHARED ww AS word
show
main

errhandle:
  suberrhandle
RESUME NEXT

SUB cfgfileopen
SHARED wfile AS STRING * 12
SHARED rand AS INTEGER

OPEN "wintword.cfg" FOR INPUT AS #1
'form : filename(wfile) ,number of word for one day(nwf1),number of word,rand(for randomize)

INPUT #1, wfile, nwf1, nword, rand
CLOSE #1

END SUB

SUB CLEAN
LINE (0, 17)-(640, 480), 0, BF

END SUB

SUB cprint (sentence AS STRING, row AS INTEGER, column AS INTEGER, CHRTC AS INTEGER)
DIM what2load(1 TO 64) AS INTEGER
DIM NUMBEROFW2L AS INTEGER
DIM numberofprint AS INTEGER
DIM chrtx AS INTEGER
DIM chrty AS INTEGER
DIM cursor AS INTEGER
DIM letter AS STRING * 1


FOR i = 1 TO LEN(sentence)

 letter$ = MID$(sentence, i, 1)
SEEK #4, ASC(letter) * 130 + 1


  GET #4, , NUMBEROFW2L

   FOR w = 1 TO NUMBEROFW2L
    GET #4, , what2load(w)
   NEXT

numberofprint = 0

DO
  numberofprint = numberofprint + 1

  cursor = what2load(numberofprint)
  chrty = FIX(cursor / 8)
  chrtx = cursor - chrty * 8

  COLOR CHRTC
  PSET (row + chrtx, column + chrty)
  IF numberofprint = NUMBEROFW2L THEN EXIT DO

LOOP
row = row + 8

NEXT
END SUB

SUB help
'LINE (160 + 20, 150)-(410 + 20, 320), 5, BF
'LINE (160 + 20, 150)-(410 + 20, 320), 15, B

 qhan "dhsmfdml eksdj", 161, 161 + 16 * 0, 15, 5
 qhan " enfWoqjwjs dnlsehwmdyd", 161, 161 + 16 * 1, 15, 5
 qhan "tjrldnjsdl aksemfa", 161, 161 + 16 * 2, 15, 5
 qhan "                      ", 161, 161 + 16 * 3, 15, 5
 qhan "duftlagl rhdqngktpdy", 161, 161 + 16 * 4, 15, 5
 qhan "                         ", 161, 161 + 16 * 5, 15, 5
 qhan "dkan rmfthlsk snfmtpdy          ", 161 + 20, 161 + 16 * 6, 15, 5

which$ = INPUT$(1)
LOCATE 1
CLEAN
LOCATE 1

END SUB

SUB main
LINE (640, 16)-(0, 0), 7, BF
cprint "    1)NEXT  2)MEAN  3)MAKE  4)RE-CONFIG  5)HELP  6)EXIT", 0, 0, 0

DO
LOCATE 1
 which$ = INPUT$(1)
SELECT CASE which$
       CASE "4": reconfig
       CASE "2": showmean
       CASE "1": show
       CASE "3": makewfile
       CASE "5": help
       CASE "6": quit
END SELECT
LOOP
END SUB

SUB makewfile

DIM wfile AS STRING * 12
CLS
COLOR 7
FILES
 INPUT "Edit File: ", wfile
IF wfile = SPACE$(12) THEN GOTO endmakewfile
OPEN wfile FOR RANDOM AS #3 LEN = LEN(ww)

numberofdata = LOF(3) / 60
SEEK #3, numberofdata + 1
DO
COLOR 7
    INPUT "word:", ww.content
      IF ww.content = SPACE$(30) THEN EXIT DO
    INPUT "mean:", ww.mean
    PUT #3, , ww
LOOP

endmakewfile:
CLOSE #3
CLEAN
CLOSE #1
reconfig

END SUB

SUB qhan (han$, row, column, CHRTC, backc)
 DIM pnt(1 TO 29) AS INTEGER
 DIM page AS INTEGER
 DIM page1 AS INTEGER
 DIM page2 AS INTEGER
 DIM page3 AS INTEGER
 DIM page4 AS INTEGER
 DIM front AS INTEGER
 DIM NoOfdata AS INTEGER
 DIM i AS INTEGER

  han00$ = han$ + ""
 i = 1
  LINE (row, column)-(row + LEN(han$) * 16, column + 16), backc, BF
  DO UNTIL i > LEN(han$)

        lt1$ = MID$(han00$, i, 1)
          letter$ = lt1$: GOSUB defpage
          page1 = page
        lt2$ = MID$(han00$, i + 1, 1)
          letter$ = lt2$: GOSUB defpage
          page2 = page
        lt3$ = MID$(han00$, i + 2, 1)
          letter$ = lt3$: GOSUB defpage
          page3 = page
jamoja:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 20 AND page2 <= 33 AND page3 >= 1 AND page3 <= 19 THEN
      page = page1: front = 0: GOSUB getandput
      page = page2: front = 0: GOSUB getandput
      i = i + 2: row = row + 16
END IF

jamomo:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 20 AND page2 <= 33 AND page3 >= 20 AND page3 <= 33 THEN
      page = page1: front = 0: GOSUB getandput
      page = page2: front = 0: GOSUB getandput
      page = page3: front = 0: GOSUB getandput
      i = i + 3: row = row + 16
END IF

jajaja:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 1 AND page2 <= 19 AND page3 >= 1 AND page3 <= 19 THEN
GOSUB japlusja
      page = page4: front = 1: GOSUB getandput
      i = i + 2
END IF

jajax:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 1 AND page2 <= 19 AND page3 = 0 THEN
GOSUB japlusja
      page = page4: front = 1: GOSUB getandput
      EXIT DO
END IF


jajamo:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 1 AND page2 <= 19 AND page3 >= 20 AND page3 <= 33 THEN
      page = page1: front = 1: GOSUB getandput
      i = i + 1
END IF

jaxx:
IF page1 >= 1 AND page1 <= 19 AND page2 = 0 AND page3 = 0 THEN
      page = page1: front = 1: GOSUB getandput
      EXIT DO
END IF

jamox:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 20 AND page2 <= 33 AND page3 = 0 THEN
      page = page1: front = 0: GOSUB getandput
      page = page2: front = 0: GOSUB getandput
      EXIT DO
END IF

casexxx:
IF page1 = 0 AND page2 = 0 AND page3 = 0 THEN
      EXIT DO
END IF

jaja0:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 1 AND page2 <= 19 AND page3 = 100 THEN
GOSUB japlusja
      page = page4: front = 1: GOSUB getandput
      i = i + 1
      END IF

jamo0:
IF page1 >= 1 AND page1 <= 19 AND page2 >= 20 AND page2 <= 33 AND page3 = 100 THEN
      page = page1: front = 0: GOSUB getandput
      page = page2: front = 0: GOSUB getandput
      i = i + 2
      row = row + 16

END IF

ja0:
IF page1 >= 1 AND page1 <= 19 AND page2 = 100 THEN
      page = page1: front = 1: GOSUB getandput
      i = i + 1
END IF

case0:
IF page1 = 100 THEN
     row = row + 24
     i = i + 1
END IF

LOOP
GOTO endsub

getandput:
    GET #5, (page + front * 33) * 60 + 1, NoOfdata
    FOR k = 1 TO NoOfdata
        GET #5, , pnt(k)
     NEXT k
    FOR j = 1 TO NoOfdata
          y = FIX(pnt(j) / 16)
          x = pnt(j) - y * 16
       PSET (row + x - front * 16, column + y), CHRTC
    NEXT j
RETURN
defpage:
            SELECT CASE letter$
               CASE "r": page = 1
               CASE "s": page = 2
               CASE "e": page = 3
               CASE "f": page = 4
               CASE "a": page = 5
               CASE "q": page = 6
               CASE "t": page = 7
               CASE "d": page = 8
               CASE "w": page = 9
               CASE "c": page = 10
               CASE "z": page = 11
               CASE "x": page = 12
               CASE "v": page = 13
               CASE "g": page = 14
               CASE "R": page = 15
               CASE "E": page = 16
               CASE "Q": page = 17
               CASE "T": page = 18
               CASE "W": page = 19

               CASE "k": page = 20
               CASE "i": page = 21
               CASE "j": page = 22
               CASE "u": page = 23
               CASE "h": page = 24
               CASE "y": page = 25
               CASE "n": page = 26
               CASE "b": page = 27
               CASE "m": page = 28
               CASE "l": page = 29
               CASE "o": page = 30
               CASE "p": page = 31
               CASE "O": page = 32
               CASE "P": page = 33
               CASE " ": page = 100
               CASE "": page = 0
            END SELECT
      RETURN
japlusja:
       IF page1 = 1 AND page2 = 7 THEN page4 = 20
       IF page1 = 2 AND page2 = 9 THEN page4 = 21
       IF page1 = 2 AND page2 = 14 THEN page4 = 22
       IF page1 = 4 AND page2 = 1 THEN page4 = 23
       IF page1 = 4 AND page2 = 5 THEN page4 = 24
       IF page1 = 4 AND page2 = 6 THEN page4 = 25
       IF page1 = 4 AND page2 = 7 THEN page4 = 26
       IF page1 = 4 AND page2 = 12 THEN page4 = 27
       IF page1 = 4 AND page2 = 13 THEN page4 = 28
       IF page1 = 4 AND page2 = 14 THEN page4 = 29
       IF page1 = 6 AND page2 = 7 THEN page4 = 30
RETURN
endsub:

END SUB

SUB quit

LINE (8, 16 * (nwf1 + 2))-(21 * 8, 16 * (nwf1 + 4)), 4, BF
LINE (8, 16 * (nwf1 + 2))-(21 * 8, 16 * (nwf1 + 4)), 15, B
LINE (8 + 2, 16 * (nwf1 + 2) + 2)-(21 * 8 - 2, 16 * (nwf1 + 4) - 2), 15, B

cprint " EXIT ?(Y:1 /N:2)  ", 8, 16 * (nwf1 + 2.5), 15


 exit$ = INPUT$(1)
  SELECT CASE exit$
         CASE "Y", "y", "1"
             '  saverand
              COLOR 7, 0, 0
              CLS
              SYSTEM
         CASE ELSE
LOCATE 1
CLEAN
LOCATE 1
  END SELECT
END SUB

SUB reconfig
SHARED rand AS INTEGER
SHARED wfile AS STRING * 12
LINE (8, 16 * (nwf1 + 2))-(36 * 8, 16 * (nwf1 + 4)), 4, BF
LINE (8, 16 * (nwf1 + 2))-(36 * 8, 16 * (nwf1 + 4)), 15, B
LINE (8 + 2, 16 * (nwf1 + 2) + 2)-(36 * 8 - 2, 16 * (nwf1 + 4) - 2), 15, B

cprint "  CHANGE CONFIGURATION ?(Y:1/N:2)", 10, 16 * (nwf1 + 2.5), 15
 newcon$ = INPUT$(1)
 LOCATE 2
 CLEAN

  SELECT CASE newcon$
         CASE "Y", "y", "1"
              CLS
              COLOR 7
              LOCATE 2
              PRINT "Old file path: "; wfile
              INPUT "New file path:", wfile
              PRINT "Old Number of Words for one day: "; nwf1
              INPUT "New Number of Words for one day:", nwf1
              OPEN wfile FOR INPUT AS #2
              nword = LOF(2) / 60
              CLOSE #2
              PRINT
              COLOR 15
              PRINT "Number of Words in "; wfile; ":"; nword
              PRINT
              COLOR 7
              PRINT "======| press any key |======"
              a$ = INPUT$(1)
              saverand
              

         CASE ELSE
  END SELECT

  CLEAN
CLOSE #1
cfgfileopen
LINE (640, 16)-(0, 0), 7, BF
cprint "    1)NEXT  2)MEAN  3)MAKE  4)RE-CONFIG  5)HELP  6)EXIT", 0, 0, 0

END SUB

SUB saverand
SHARED wfile AS STRING * 12
SHARED rand AS INTEGER

 FOR i = 1 TO nwf1
   IF rand > nword THEN rand = 1
   rand = rand + 1
 NEXT


 OPEN "wintword.cfg" FOR OUTPUT AS #1
' rand = LEN(RTRIM$(w.content(nwf1))) + VAL(MID$(DATE$, 4, 2)) + VAL(MID$(DATE$, 1, 2)) + VAL(MID$(DATE$, 7, 4))
 WRITE #1, wfile, nwf1, nword, rand
 CLOSE #1

END SUB

SUB show

SHARED rand AS INTEGER
SHARED wfile AS STRING * 12

LOCATE 2: CLEAN
saverand
LINE (0, 17)-(319, 16 * nwf1 + 33), 1, BF
LINE (0, 17)-(319, 16 * nwf1 + 33), 15, B
OPEN wfile FOR RANDOM AS #2 LEN = LEN(ww)

numofdata = LOF(2) / 60
SEEK #2, rand
j = rand
FOR i = 1 TO nwf1
            IF j > numofdata THEN
                j = 1
            END IF
    GET #2, j, ww

             cprint ww.content, 11, i * 16 + 8, 15
        j = j + 1
'LOCATE 20: PRINT "nwf1="; nwf1; "nword="; nword; "rand="; rand; "j="; j; "i="; i

NEXT

CLOSE #2



END SUB

SUB showmean
SHARED rand AS INTEGER
SHARED wfile AS STRING * 12
LINE (321, 17)-(640, 16 * nwf1 + 33), 3, BF
LINE (321, 17)-(640, 16 * nwf1 + 33), 15, B

OPEN wfile FOR RANDOM AS #2 LEN = LEN(ww)

SEEK #2, rand
j = rand
numofdata = LOF(2) / 60
FOR i = 1 TO nwf1

            IF j > numofdata THEN
                j = 1
            END IF

   
GET #2, j, ww
 qhan ww.mean, 3 + 8 * 41, i * 16 + 8, 15, 3
        j = j + 1

NEXT
CLOSE #2


END SUB

SUB suberrhandle
SHARED wfile AS STRING * 12

  SELECT CASE ERR
     CASE 53
      COLOR 15
      PRINT "========================"
      PRINT "| There is no file like "
      PRINT "| "; wfile; "|"
      PRINT "| Press Any Key        |"
      PRINT "========================"
      a$ = INPUT$(1)
      CLEAN
      reconfig
      main
  END SELECT

END SUB

