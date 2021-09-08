CLS
SCREEN 13
OPEN "scr13clr.pal" FOR APPEND AS #1

FOR c = 0 TO 255
COLOR c
LINE (0, 0)-(320, 200), , BF
k$ = INPUT$(1)
IF k$ = "s" THEN
  COLOR 7
  PRINT c
  INPUT "contents"; con$
  PRINT #1, con$, c
  
  CLS
END IF

NEXT
COLOR 15
CLOSE
END

