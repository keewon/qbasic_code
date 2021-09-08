CLS
DIM wfile AS STRING * 12
DIM nwf1 AS INTEGER
DIM content AS STRING * 30
DIM mean AS STRING * 30
ON ERROR GOTO errhandle
OPEN "wintword.cfg" FOR INPUT AS #1
'form : filename(wfile) ,number of word for one day(nwf1),number of word,rand(for randomize)

INPUT #1, wfile, nwf1, nword, rand
CLOSE #1


show:

LOCATE 1: GOSUB clean
LOCATE 1
COLOR 15, 1, 7
PRINT "================================="
RANDOMIZE TIMER + rand

FOR i = 1 TO nwf1
OPEN wfile FOR INPUT AS #2

j = INT(RND(1) * (nword - 1) + 1)
          FOR k = 1 TO j
               INPUT #2, content, mean
          NEXT
content = RTRIM$(content)
content = LTRIM$(content)
 PRINT "| "; content; "|"
CLOSE #2
NEXT
PRINT "==[1: Menu][2: Exit]============="


DO
which$ = INPUT$(1)
 IF which$ = "1" THEN EXIT DO
 IF which$ = "2" THEN
    GOSUB f4
    EXIT DO
 END IF
LOOP

main:
DO
COLOR 15, 3, 7

LOCATE nwf1 + 2, 1
PRINT "==[   Menu]======="
PRINT "|  1: Re-Config  |"
PRINT "|  2: Mean       |"
PRINT "|  3: Next       |"
PRINT "|  4: Help       |"
PRINT "|  5: Exit       |"
PRINT "|  Select:       |"
PRINT "=================="

LOCATE nwf1 + 7, 3: which$ = INPUT$(1)
SELECT CASE which$
       CASE "1": GOSUB f1
       CASE "2": GOSUB f2
       CASE "3": GOTO show
       CASE "4": GOSUB f4
       CASE "5": GOSUB f5
END SELECT
errhandle:
  SELECT CASE ERR
     CASE 53
      COLOR 15, 4, 7
      PRINT "========================"
      PRINT "| There is no file like "
      PRINT "| "; wfile; "|"
      PRINT "| Press Any Key        |"
      PRINT "========================"

      SLEEP
      GOSUB clean
      GOSUB f1
      GOTO main
  END SELECT
LOOP

f1:
COLOR 15, 4, 7
LOCATE nwf1 + 3, 1
PRINT "=============================="
PRINT "| Change configuration ?(y/N)|"
PRINT "=============================="
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

f2:

LOCATE 1, 31
COLOR 15, 3, 7
PRINT "================================="
FOR i = 1 TO nwf1

mean = RTRIM$(mean)
mean = LTRIM$(mean)
LOCATE 1 + i, 31
 PRINT "| "; content; "|"
NEXT
LOCATE 1 + nwf1 + 31
PRINT "==[1: Menu][2: Exit]============="

RETURN
f4:
LOCATE 1: GOSUB clean
COLOR 15, 2, 7
LOCATE 1
PRINT "================================="
PRINT "| Word of Today V1.01(For Win)  |"
PRINT "|                               |"
PRINT "|   Made By Seo K.W             |"
PRINT "|                               |"
PRINT "|     Make Fun and Study Hard ! |"
PRINT "|                               |"
PRINT "==========[press any key]========"

which$ = INPUT$(1)
LOCATE 1
GOSUB clean
LOCATE 1
RETURN

f5:
COLOR 15, 4, 7
LOCATE nwf1 + 2, 1

PRINT "====================="
PRINT "| Exit ?(y:1 /N:2)  |"
PRINT "====================="

 exit$ = INPUT$(1)
  SELECT CASE exit$
         CASE "Y", "y", "1"
              GOSUB saverand
              COLOR 7, 0, 0
              CLS
              SYSTEM
         CASE ELSE
LOCATE 1
GOSUB clean
LOCATE 1
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





