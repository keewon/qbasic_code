CLS
DIM wfile AS STRING * 12
DIM nwf1 AS INTEGER
DIM content AS STRING * 30
ON ERROR GOTO errhandle
OPEN "todiword.cfg" FOR INPUT AS #1
'form : filename(wfile) ,number of word for one day(nwf1),number of word,rand(for randomize)

INPUT #1, wfile, nwf1, nword, rand
CLOSE #1


show:

LOCATE 1: GOSUB clean
LOCATE 1
COLOR 15, 1, 7
PRINT "浜様様様様様様様様様様様様様様様�"
RANDOMIZE TIMER + rand

FOR i = 1 TO nwf1
OPEN wfile FOR INPUT AS #2

j = INT(RND(1) * (nword - 1) + 1)
          FOR k = 1 TO j
            LINE INPUT #2, content
          NEXT
content = RTRIM$(content)
content = LTRIM$(content)
 PRINT "� "; content; "�"
CLOSE #2
NEXT
PRINT "藩[0: Menu]様様様様様様様様様様夕"

main:
DO
          which$ = INPUT$(1)
SELECT CASE which$
       CASE "0": GOSUB menu
       CASE "1": GOSUB f1: GOTO show
       CASE "2": GOTO show
       CASE "3": GOSUB f3: GOTO show
       CASE "4": GOSUB f4: GOTO show
END SELECT
LOOP
END

menu:
COLOR 15, 3, 7
LOCATE nwf1 + 2
PRINT "浜[   Menu]様様様�"
PRINT "�  1: Re-Config  �"
PRINT "�  2: Next       �"
PRINT "�  3: Help       �"
PRINT "�  4: Exit       �"
PRINT "�                �"
PRINT "藩様様様様様様様夕"
LOCATE nwf1 + 7, 3: PRINT "Select:"

RETURN

errhandle:
  SELECT CASE ERR
     CASE 53
      COLOR 15, 4, 7
      PRINT "浜様様様様様様様様様様融"
      PRINT "� There is no file like "
      PRINT "� "; wfile; "�"
      PRINT "� Press Any Key        �"
      PRINT "藩様様様様様様様様様様夕"

      SLEEP
      GOSUB clean
      GOSUB f1
      GOTO main
  END SELECT

f1:
COLOR 15, 4, 7
LOCATE nwf1 + 3
PRINT "浜様様様様様様様様様様様様様融"
PRINT "� Change configuration ?(y/N)�"
PRINT "藩様様様様様様様様様様様様様夕"
 newcon$ = INPUT$(1)
 LOCATE 1
 GOSUB clean

  SELECT CASE newcon$
         CASE "Y", "y"
              COLOR 15, 0, 7
              LOCATE 1
              PRINT "Old file path: "; wfile
              INPUT "New file path:", wfile
              PRINT "Old Number of Words for one day: "; nwf1
              INPUT "New Number of Words for one day:", nwf1
              PRINT "Old Number of words: "; nword
              INPUT "New Number of words:", nword
              GOSUB saverand
         CASE ELSE
  END SELECT

  GOSUB clean
RETURN

f3:
LOCATE 1: GOSUB clean
COLOR 0, 14, 7
LOCATE 1
PRINT "浜様様様様様様様様様様様様様様様�"
PRINT "� Word of Today V1.0            �"
PRINT "�                               �"
PRINT "�   Made By Seo K.W             �"
PRINT "�                               �"
PRINT "�     Make Fun and Study Hard ! �"
PRINT "�                               �"
PRINT "藩様様様様様様様様様様様様様様様�"
SLEEP
LOCATE 1
GOSUB clean
LOCATE 1
RETURN

f4:
COLOR 15, 4, 7
LOCATE nwf1 + 2
PRINT "浜様様様様様様融"
PRINT "� Exit ?(y:0/N)�"
PRINT "藩様様様様様様夕"

 exit$ = INPUT$(1)
  SELECT CASE exit$
         CASE "Y", "y", "0"
              GOSUB saverand
              SYSTEM
         CASE ELSE
LOCATE 1
GOSUB clean
         RETURN
  END SELECT

saverand:
 OPEN "todiword.cfg" FOR OUTPUT AS #1
 rand = LEN(content) + VAL(MID$(DATE$, 4, 2)) + VAL(MID$(DATE$, 1, 2)) + VAL(MID$(DATE$, 7, 4))
 WRITE #1, wfile, nwf1, nword, rand
 CLOSE #1
RETURN

clean:
COLOR 0, 0, 0
FOR i = 1 TO 20
PRINT "                                   "
NEXT
RETURN





