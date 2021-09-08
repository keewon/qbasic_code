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
PRINT "ษอออออออออออออออออออออออออออออออป"
RANDOMIZE TIMER + rand

FOR i = 1 TO nwf1
OPEN wfile FOR INPUT AS #2

j = INT(RND(1) * (nword - 1) + 1)
          FOR k = 1 TO j
            LINE INPUT #2, content
          NEXT
content = RTRIM$(content)
content = LTRIM$(content)
 PRINT "บ "; content; "บ"
CLOSE #2
NEXT
PRINT "ศอ[0: Menu]อออออออออออออออออออออผ"

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
PRINT "ษอ[   Menu]ออออออป"
PRINT "บ  1: Re-Config  บ"
PRINT "บ  2: Next       บ"
PRINT "บ  3: Help       บ"
PRINT "บ  4: Exit       บ"
PRINT "บ                บ"
PRINT "ศออออออออออออออออผ"
LOCATE nwf1 + 7, 3: PRINT "Select:"

RETURN

errhandle:
  SELECT CASE ERR
     CASE 53
      COLOR 15, 4, 7
      PRINT "ษออออออออออออออออออออออป"
      PRINT "บ There is no file like "
      PRINT "บ "; wfile; "บ"
      PRINT "บ Press Any Key        บ"
      PRINT "ศออออออออออออออออออออออผ"

      SLEEP
      GOSUB clean
      GOSUB f1
      GOTO main
  END SELECT

f1:
COLOR 15, 4, 7
LOCATE nwf1 + 3
PRINT "ษออออออออออออออออออออออออออออป"
PRINT "บ Change configuration ?(y/N)บ"
PRINT "ศออออออออออออออออออออออออออออผ"
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
PRINT "ษอออออออออออออออออออออออออออออออป"
PRINT "บ Word of Today V1.0            บ"
PRINT "บ                               บ"
PRINT "บ   Made By Seo K.W             บ"
PRINT "บ                               บ"
PRINT "บ     Make Fun and Study Hard ! บ"
PRINT "บ                               บ"
PRINT "ศอออออออออออออออออออออออออออออออผ"
SLEEP
LOCATE 1
GOSUB clean
LOCATE 1
RETURN

f4:
COLOR 15, 4, 7
LOCATE nwf1 + 2
PRINT "ษออออออออออออออป"
PRINT "บ Exit ?(y:0/N)บ"
PRINT "ศออออออออออออออผ"

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





