
' THIS PROGRAM HELP YOU TO MAKE "SPACE CHARACTER ( ASCII CODE 32)"
SCREEN 12
COLOR 7
DIM what2save(1 TO 64) AS STRING * 2
DIM Numberofw2s AS INTEGER
DIM cursor AS INTEGER
DIM row AS INTEGER
DIM column AS INTEGER

CLS
INPUT "File nAme"; filename$
OPEN filename$ FOR BINARY AS #1
INPUT "SPACE record Number"; rn

Numberofw2s = 2
PUT #1, 1, Numberofw2s

SEEK #1, rn * 130 + 1

saving:

      PUT #1, , Numberofw2s

  FOR forclear = 1 TO 64
     what2save(forclear) = ""
  NEXT

   FOR forsave = 1 TO 64
      PUT #1, , what2save(forsave)
   NEXT

CLOSE

