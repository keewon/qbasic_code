DECLARE SUB LOGO ()
DECLARE SUB paintdot (whichcase AS INTEGER, lc AS STRING, backc AS INTEGER)
DECLARE SUB MENU ()
DECLARE SUB QUITQUIT ()
DECLARE SUB CPRINT (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
DECLARE SUB drawgrid ()
DECLARE SUB DRAWWINDOW ()
CONST WINDOWSIZE = 160
CONST titlesize = 40
CONST STARTX = 20
CONST STARTy = 20 + titlesize
ON KEY(1) GOSUB PRESSF1
KEY(1) ON
ON KEY(2) GOSUB PRESSF2
KEY(2) ON

CLS
SCREEN 12
OPEN "eng1.fnt" FOR BINARY AS #2

DO
startlable:
DRAWWINDOW
drawgrid
LOGO
LOOP

PRESSF1:
MENU
'GOTO startlable
RETURN

PRESSF2:
QUITQUIT
RETURN

END
' paintdot 1, "            "
' paintdot 2, "            "
' paintdot 3, "            "
' paintdot 4, "            "
' paintdot 5, "            "
' paintdot 6, "            "
' paintdot 7, "            "
' paintdot 8, "            "
' paintdot 9, "            "
'paintdot 10, "            "
'paintdot 11, "            "
'paintdot 12, "            "

SUB CPRINT (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
DIM what2load(1 TO 64) AS INTEGER
DIM NUMBEROFW2L AS INTEGER
DIM numberofprint AS INTEGER
DIM chrtx AS INTEGER
DIM chrty AS INTEGER
DIM cursor AS INTEGER
DIM letter AS STRING * 1

FOR i = 1 TO LEN(sentence)
letter$ = MID$(sentence, i, 1)
SEEK #2, ASC(letter) * 130 + 1

  GET #2, , NUMBEROFW2L

   FOR w = 1 TO NUMBEROFW2L
    GET #2, , what2load(w)
   NEXT

numberofprint = 0

DO
  numberofprint = numberofprint + 1

  cursor = what2load(numberofprint)
  chrty = FIX(cursor / 8)
  chrtx = cursor - chrty * 8

  COLOR chrtc
  PSET (row + chrtx, column + chrty)
  IF numberofprint = NUMBEROFW2L THEN EXIT DO

LOOP
row = row + 8

NEXT

END SUB

SUB drawgrid

'grid
LINE (2, titlesize + 2)-(WINDOWSIZE - 2, titlesize + WINDOWSIZE - 2), 7, BF

FOR i = 0 TO 120 STEP 10
 LINE (STARTX + i, STARTy + 0)-(STARTX + i, STARTy + 120)
 LINE (STARTX + 0, STARTy + i)-(STARTX + 120, STARTy + i)
NEXT

END SUB

SUB DRAWWINDOW

DIM FC AS INTEGER
DIM MENUC AS INTEGER
 FC = 15
 MENUC = 14

'window
LINE (0, 0)-(WINDOWSIZE, titlesize + WINDOWSIZE), 7, BF
LINE (0, 0)-(WINDOWSIZE, titlesize + WINDOWSIZE), 15, B
LINE (1, 1)-(WINDOWSIZE - 1, titlesize + WINDOWSIZE - 1), 15, B
LINE (0, titlesize - 1)-(160, titlesize), 15, B
LINE (0, titlesize - 19)-(160, titlesize - 20), 15, B

PAINT (2, 2), 1, 15
PAINT (2, 24), 3, 15

CPRINT "CYBER PET V 1.0", 18, 3, 15
CPRINT "F1:MENU F2:QUIT", 18, 22, 15

END SUB

SUB LOGO
SLEEP 1
 paintdot 12, "444444444444400000000004400000000004000000000000444444000000000004444444444444000000000000000000444444444444400004000004044440444440444444444444", 8

SLEEP
END SUB

SUB MENU
LINE (21, titlesize + 21)-(WINDOWSIZE - 21, titlesize + WINDOWSIZE - 21), 3, BF
LINE (20, titlesize + 20)-(WINDOWSIZE - 20, titlesize + WINDOWSIZE - 20), 15, B

CPRINT "1:FILE", 30, titlesize + 30 + 0, 15
CPRINT "2:GAME", 30, titlesize + 30 + 16, 15
CPRINT "3:BACK", 30, titlesize + 30 + 32, 15
CPRINT "4:QUIT", 30, titlesize + 30 + 48, 15
LOCATE 8, 3: A$ = INPUT$(1)
  SELECT CASE A$
    CASE "1": PRINT "1"
    CASE "2": PRINT "2"
    CASE "3": GOTO ENDMENUSUB
    CASE "4": QUITQUIT
    CASE ELSE
  END SELECT
 
ENDMENUSUB:
END SUB

SUB paintdot (whichcase AS INTEGER, lc AS STRING, backc AS INTEGER)
drawgrid
SELECT CASE whichcase
  CASE IS = 12
       FOR i = 1 TO 12  'row
        FOR j = 1 TO 12 'column
          pd$ = MID$(lc, (i - 1) * 12 + j, 1)
              
            GOSUB selectcasepd
            PAINT ((i * 10 - 5 + STARTX), (j * 10 - 5 + STARTy)), PDCOLOR, 15
        NEXT
       NEXT

  CASE IS > 12
  lc = SPACE$(11 * 12) + lc + SPACE$(11 * 12)
      FOR i = 1 TO whichcase + 22    'i=soonseo
       FOR j = i TO i + 11          'j=row
        FOR k = 1 TO 12            'k=column
         pd$ = MID$(lc, (k - 1) * 12 + j, 1)
          GOSUB selectcasepd
          PAINT (((j - i + 1) * 10 - 5 + STARTX), (k * 10 - 5 + STARTy)), PDCOLOR, 15

NEXT

NEXT

NEXT
END SELECT
GOTO endpaintdotsub

selectcasepd:
SELECT CASE pd$
CASE "0": PDCOLOR = 0
CASE "1": PDCOLOR = 1
CASE "2": PDCOLOR = 2
CASE "3": PDCOLOR = 3
CASE "4": PDCOLOR = 4
CASE "5": PDCOLOR = 5
CASE "6": PDCOLOR = 6
CASE "7": PDCOLOR = 7
CASE "8": PDCOLOR = 8
CASE "9": PDCOLOR = 9
CASE "A": PDCOLOR = 10
CASE "B": PDCOLOR = 11
CASE "C": PDCOLOR = 12
CASE "D": PDCOLOR = 13
CASE "E": PDCOLOR = 14
CASE "F": PDCOLOR = 15
CASE ELSE: PDCOLOR = backc
END SELECT
RETURN


endpaintdotsub:
END SUB

SUB QUITQUIT
PRINT "QUIT"
END
END SUB

