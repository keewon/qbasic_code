DECLARE SUB cPRINT (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
DECLARE SUB menu (startx AS INTEGER, starty AS INTEGER)
DECLARE SUB drawbox (windownumber AS INTEGER)
KEY 15, CHR$(0) + CHR$(1)

ON KEY(1) GOSUB lablef1
ON KEY(2) GOSUB lablef2
ON KEY(3) GOSUB lablef3
ON KEY(4) GOSUB lablef4
ON KEY(5) GOSUB lablef5
ON KEY(6) GOSUB lablef6
ON KEY(7) GOSUB lablef7
ON KEY(8) GOSUB lablef8
ON KEY(9) GOSUB lablef9
ON KEY(10) GOSUB lablef10
ON KEY(15) GOSUB quit

CLS
SCREEN 12
OPEN "eng1.fnt" FOR BINARY AS #2
drawbox 1
menu 0, 0
FOR I = 1 TO 100000: NEXT
END
lablef1:
'menu
lablef2:
'f2
lablef3:
'f3
lablef4:
'f4
lablef5:
'f5
lablef6:
'f6
lablef7:
'f7
lablef8:
'f8
lablef9:
'f9
lablef10:
'f10
quit:
RETURN

SUB cPRINT (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
DIM what2load(1 TO 64) AS INTEGER
DIM NUMBEROFW2L AS INTEGER
DIM numberofprint AS INTEGER
DIM chrtx AS INTEGER
DIM chrty AS INTEGER
DIM cursor AS INTEGER
DIM letter AS STRING * 1

FOR I = 1 TO LEN(sentence)
letter$ = MID$(sentence, I, 1)
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

SUB drawbox (windownumber AS INTEGER)
'window
PAINT (0, 0), 7
COLOR 1
LINE (0, 0)-(639, 65), , BF
LINE (5, 85)-(315, 275), , BF
LINE (5, 285)-(315, 475), , BF
LINE (325, 85)-(635, 275), , BF
LINE (325, 285)-(635, 475), , BF

'menu small box
COLOR 3
bsx = 5   ' box's start x
FOR I = 1 TO 10
bex = bsx + 50    ' box's end x
LINE (bsx, 5)-(bex, 55), , BF
bsx = bsx + 64.2
NEXT

'grid
SELECT CASE windownumber
CASE 1: startx = 10: starty = 90
CASE 2: startx = 330: starty = 290
CASE 3: startx = 10: starty = 90
CASE 4: startx = 330: starty = 290
END SELECT
FOR I = 0 TO 120 STEP 10
 LINE (startx + I, starty + 0)-(startx + I, starty + 120)
 LINE (startx + 0, starty + I)-(startx + 120, starty + I)
NEXT

END SUB

SUB menu (startx AS INTEGER, starty AS INTEGER)
'2,4,6,8,10,12,.....

DIM FC AS INTEGER
DIM MENUC AS INTEGER
 FC = 15
 MENUC = 14
   cPRINT "F1", 10, 10, FC
   cPRINT "MENU", 10, 30, MENUC
   cPRINT "F2", 72, 10, FC
   cPRINT "EAT", 72, 30, MENUC
   cPRINT "F3", 135, 10, FC
   cPRINT "PLAY", 135, 30, MENUC
   cPRINT "F4", 200, 10, FC
   cPRINT "STUDY", 200, 30, MENUC
   cPRINT "F5", 265, 10, FC
   cPRINT "SLEEP", 265, 30, MENUC
   cPRINT "F6", 330, 10, FC
   cPRINT "TRIP", 330, 30, MENUC
   cPRINT "F7", 395, 10, FC
   cPRINT "HEAL", 395, 30, MENUC
   cPRINT "F8", 460, 10, FC
   cPRINT "FIGHT", 460, 30, MENUC
   cPRINT "F9", 525, 10, FC
   cPRINT "WASH", 525, 30, MENUC
   cPRINT "F10", 590, 10, FC
   cPRINT "QUIT", 590, 30, MENUC


END SUB

