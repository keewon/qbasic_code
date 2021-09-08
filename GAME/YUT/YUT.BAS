DECLARE FUNCTION MOUSEINIT% ()
DECLARE SUB GIFLOAD (a$)
DECLARE SUB main ()
DECLARE SUB Yutpan ()
DECLARE SUB MOUSEDRIVER (AX%, bx%, cx%, dx%, lb%, rb%, EX%)

DIM SHARED mouse$
SCREEN 13
MOUSEDRIVER 1, bx%, cx%, dx%, lb%, rb%, 1
IF NOT MOUSEINIT% THEN PRINT "Mouse Not Exist": END
MOUSEDRIVER 1, bx%, cx%, dx%, lb%, rb%, 1

main

DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B
DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53
DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F
DATA 8B,5E,06,89,17,5D,CA,08,00

SUB main
DO

MOUSEDRIVER 3, bx%, cx%, dx%, lb%, rb%, 0
LOCATE 1: PRINT lb%, rb%, cx%, dx%

LOOP

END SUB

SUB MOUSEDRIVER (AX%, bx%, cx%, dx%, lb%, rb%, EX%)
IF EX% = 1 THEN
  mouse$ = SPACE$(57)
  RESTORE
   FOR I% = 1 TO 57
        READ a$
        H$ = CHR$(VAL("&H" + a$))
        MID$(mouse$, I%, 1) = H$
   NEXT I%
   CLS
END IF

DEF SEG = VARSEG(mouse$)
CALL Absolute(AX%, bx%, cx%, dx%, SADD(mouse$))
lb% = ((bx% AND 1) <> 0)
rb% = ((bx% AND 2) <> 0)

END SUB

FUNCTION MOUSEINIT%
  AX% = 0
  MOUSEDRIVER AX%, 0, 0, 0, 0, 0, 0
  MOUSEINIT% = AX%
END FUNCTION

