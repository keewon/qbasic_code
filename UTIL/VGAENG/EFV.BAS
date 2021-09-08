SCREEN 12
COLOR 7

DIM what2save(1 TO 64) AS INTEGER
DIM rn AS INTEGER
DIM numberofw2s AS INTEGER
DIM numberofprint AS INTEGER
DIM row AS INTEGER
DIM column AS INTEGER
DIM cursor AS INTEGER

CLS
INPUT "File nAme"; filename$
OPEN filename$ FOR BINARY AS #1
INPUT "record number"; rn
SEEK #1, rn * 130 + 1
back:
CLS
  FOR backrow = 0 TO 150 STEP 10
     FOR backcolumn = 0 TO 150 STEP 10
      LINE (backrow, backcolumn)-(backrow + 10, backcolumn + 10), , B
     NEXT backcolumn
  NEXT backrow
  LINE (11, 11)-(151, 151), , B

  GET #1, , numberofw2s
   FOR w = 1 TO numberofw2s
    GET #1, , what2save(w)
   NEXT
  numberofprint = 1

DO
 

  cursor = what2save(numberofprint)
  column = FIX(cursor / 8)
  row = cursor - column * 8

  COLOR 7
  PAINT (10 * row + 5, 10 * column + 5)
  IF numberofprint = numberofw2s THEN
   CLOSE
   END
  END IF
  numberofprint = numberofprint + 1


  LOOP


