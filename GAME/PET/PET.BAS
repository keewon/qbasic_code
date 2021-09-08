DECLARE SUB DOTFILE (FILENAME AS STRING, order AS INTEGER)
DECLARE SUB help ()
DECLARE SUB FILEMENU ()
DECLARE SUB GAMEMENU ()
DECLARE SUB MENUWINDOW ()
DECLARE SUB LOGO ()
DECLARE SUB paintdot (lm AS INTEGER, lc AS STRING, backc AS INTEGER)
DECLARE SUB MENU ()
DECLARE SUB QUITQUIT ()
DECLARE SUB cprint (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
DECLARE SUB drawgrid ()
DECLARE SUB DRAWWINDOW ()

CONST WINDOWSIZE = 160
CONST TITLESIZE = 21
CONST STARTX = 20
CONST STARTy = 20 + TITLESIZE

TYPE picture
  p AS STRING * 12
END TYPE

CLS
SCREEN 12
OPEN "eng1.fnt" FOR BINARY AS #2

DO
startlable:
DRAWWINDOW
drawgrid

DOTFILE "rat.Qdp", 1
a$ = INPUT$(1)
LOGO
LOOP


END

 paintdot 1, "            ", 0
 paintdot 2, "            ", 0
 paintdot 3, "            ", 0
 paintdot 4, "            ", 0
 paintdot 5, "            ", 0
 paintdot 6, "            ", 0
 paintdot 7, "            ", 0
 paintdot 8, "            ", 0
 paintdot 9, "            ", 0
paintdot 10, "            ", 0
paintdot 11, "            ", 0
paintdot 12, "            ", 0

SUB cprint (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
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

SUB DOTFILE (FILENAME AS STRING, order AS INTEGER)

DIM pic AS picture

OPEN FILENAME FOR RANDOM AS #3 LEN = LEN(pic)

'numberofrecord = LOF(3) / 12

FOR i = 1 TO 12       'sero
FOR k = 1 TO 12
GET #3, i + (order - 1) * 144, pic.p

PD$ = MID$(pic.p, k, 1)

SELECT CASE PD$
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
CASE "A", "a": PDCOLOR = 10
CASE "B", "b": PDCOLOR = 11
CASE "C", "c": PDCOLOR = 12
CASE "D", "d": PDCOLOR = 13
CASE "E", "e": PDCOLOR = 14
CASE "F", "f": PDCOLOR = 15
CASE ELSE: PDCOLOR = 7
END SELECT

PAINT ((k * 10 - 5 + STARTX), (i * 10 - 5 + STARTy)), PDCOLOR, 15

NEXT
NEXT
CLOSE #3
END SUB

SUB drawgrid

'grid
LINE (2, TITLESIZE + 2)-(WINDOWSIZE - 2, TITLESIZE + WINDOWSIZE - 2), 7, BF

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
LINE (0, 0)-(WINDOWSIZE, TITLESIZE + WINDOWSIZE), 7, BF
LINE (0, 0)-(WINDOWSIZE, TITLESIZE + WINDOWSIZE), 15, B
LINE (1, 1)-(WINDOWSIZE - 1, TITLESIZE + WINDOWSIZE - 1), 15, B
LINE (0, TITLESIZE - 1)-(160, TITLESIZE), 15, B

PAINT (2, 2), 1, 15

cprint "CYBER PET V 1.0", 18, 3, 15

END SUB

 SUB FILEMENU
 MENUWINDOW
cprint " -FILE MENU-", 30, TITLESIZE + 30 + 0, 14
cprint "1:NEW ", 30, TITLESIZE + 30 + 16, 15
cprint "2:LOAD", 30, TITLESIZE + 30 + 32, 15
cprint "3:SAVE", 30, TITLESIZE + 30 + 48, 15
cprint "0:QUIT", 30, TITLESIZE + 30 + 64, 15

LOCATE 8, 3: a$ = INPUT$(1)
  SELECT CASE a$
    CASE "1": GOTO NEWGAME
    CASE "2": GOTO LOADGAME
    CASE "3": GOTO SAVEGAME
    CASE "0": QUITQUIT
    CASE ELSE: GOTO FMENUEND
  END SELECT
NEWGAME:
MENUWINDOW
cprint "-SELECT    ", 30, TITLESIZE + 30 + 0, 14
cprint "    ANIMAL-", 30, TITLESIZE + 30 + 16, 15
cprint "1:MOUSE", 30, TITLESIZE + 30 + 32, 15
cprint "2:DOG", 30, TITLESIZE + 30 + 48, 15
cprint "0:QUIT", 30, TITLESIZE + 30 + 64, 15

LOADGAME:
SAVEGAME:

FMENUEND:
END SUB

SUB GAMEMENU

GMENU:
 MENUWINDOW
cprint " -GAME MENU-", 30, TITLESIZE + 30 + 0, 14
cprint "1:FOOD  2:SLEEP", 30 - 8, TITLESIZE + 30 + 16, 15
cprint "3:HEAL  4:PLAY", 30 - 8, TITLESIZE + 30 + 32, 15
cprint "5:STUDY 6:TRIP", 30 - 8, TITLESIZE + 30 + 48, 15
cprint "7:WORK  8:FIGHT", 30 - 8, TITLESIZE + 30 + 64, 15
cprint "9:BACK", 30 - 8, TITLESIZE + 30 + 80, 15
 a$ = INPUT$(1)
 GOSUB SELECTGAMEMENU

SELECTGAMEMENU:
  SELECT CASE a$
    CASE "1": PRINT "1"
    CASE "2": PRINT "2"
    CASE "3": PRINT "3"
    CASE "4": PRINT "4"
    CASE "5": PRINT "5"
    CASE "6": PRINT "6"
    CASE "7": PRINT "7"
    CASE "8": PRINT "8"
    CASE "9": PRINT "9"
    CASE ELSE: GOTO GMENUEND
  END SELECT

GMENUEND:
END SUB

SUB help

END SUB

SUB LOGO
DO

drawgrid
 paintdot 1, "4   4 444 4 ", 0
 paintdot 2, "4 4 4 4   4 ", 0
 paintdot 3, "44444 44  4 ", 0
 paintdot 4, "      4   4 ", 0
 paintdot 5, "      444 44", 0
 paintdot 6, "            ", 0
 paintdot 7, "44 444 44444", 0
 paintdot 8, "4  4 4 4 4 4", 0
 paintdot 9, "4  4 4 4 4 4", 0
paintdot 10, "4  4 4      ", 0
paintdot 11, "44 444      ", 0
paintdot 12, "            ", 0

cprint "PRESS ANY KEY", 50, TITLESIZE + WINDOWSIZE - 18, 4
a$ = INPUT$(1)

DRAWWINDOW
MENUWINDOW
cprint "1:MENU", 30, TITLESIZE + 30 + 0, 15
cprint "2:HELP", 30, TITLESIZE + 30 + 16, 15
cprint "3:BACK", 30, TITLESIZE + 30 + 32, 15
cprint "0:QUIT", 30, TITLESIZE + 30 + 48, 15


a$ = INPUT$(1)
 SELECT CASE a$
   CASE "1": MENU
   CASE "2": help
   CASE "3": EXIT DO
   CASE "0": QUITQUIT
   
 END SELECT
LOOP
END SUB

SUB MENU

DO
 MENUWINDOW
cprint "   -MENU-", 30, TITLESIZE + 30 + 0, 14
cprint "1:FILE", 30, TITLESIZE + 30 + 16, 15
cprint "2:GAME", 30, TITLESIZE + 30 + 32, 15
cprint "3:BACK", 30, TITLESIZE + 30 + 48, 15
cprint "0:QUIT", 30, TITLESIZE + 30 + 64, 15

LOCATE 8, 3: a$ = INPUT$(1)
  SELECT CASE a$
    CASE "1":  FILEMENU
    CASE "2":  GAMEMENU
    CASE "0": QUITQUIT
    CASE ELSE: EXIT DO
  END SELECT
LOOP
END SUB

SUB MENUWINDOW
LINE (21 - 4, TITLESIZE + 21 - 4)-(WINDOWSIZE - 21 + 4, TITLESIZE + WINDOWSIZE - 21 + 4), 3, BF
LINE (20 - 4, TITLESIZE + 20 - 4)-(WINDOWSIZE - 20 + 4, TITLESIZE + WINDOWSIZE - 20 + 4), 15, B

END SUB

SUB paintdot (lm AS INTEGER, lc AS STRING, backc AS INTEGER)

       FOR i = 1 TO 12  'row
          PD$ = MID$(lc, i, 1)

SELECT CASE PD$
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
CASE "A", "a": PDCOLOR = 10
CASE "B", "b": PDCOLOR = 11
CASE "C", "c": PDCOLOR = 12
CASE "D", "d": PDCOLOR = 13
CASE "E", "e": PDCOLOR = 14
CASE "F", "f": PDCOLOR = 15
CASE ELSE: PDCOLOR = backc
END SELECT
              

            PAINT ((i * 10 - 5 + STARTX), (lm * 10 - 5 + STARTy)), PDCOLOR, 15
        NEXT

END SUB

SUB QUITQUIT
PRINT "QUIT"
END
END SUB

