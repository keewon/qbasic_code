' data recorder
SCREEN 12
COLOR 7
DIM what2save(1 TO 49) AS INTEGER
DIM Numberofw2s AS INTEGER
DIM cursor AS INTEGER
DIM row AS INTEGER
DIM column AS INTEGER

CLS
INPUT "File nAme"; filename$
OPEN filename$ FOR BINARY AS #1
INPUT "Start record Number"; rn

GOSUB back2
Numberofw2s = 2
PUT #1, 1, Numberofw2s
Numberofw2s = 0

SEEK #1, rn * 100 + 1

DO
a$ = INPUT$(1)
SELECT CASE a$
  CASE "4": cursor = cursor - 1
  CASE "6": cursor = cursor + 1
  CASE "2": cursor = cursor + 16
  CASE "8": cursor = cursor - 16
  CASE "0": GOSUB pick
  CASE ".": GOSUB saving
  CASE "s": GOSUB saving
  CASE "q": CLOSE : END
END SELECT
  IF cursor = 257 THEN cursor = 0
  IF cursor > 257 THEN cursor = 256
  IF cursor < 0 THEN cursor = 0
  oldcolumn = column: oldrow = row
  column = FIX(cursor / 16)
  row = cursor - column * 16
cursor:
  COLOR 4
  LINE (10 * row + 5, 10 * column + 5)-(10 * row + 6, 10 * column + 6), , BF
  COLOR 0
  LINE (10 * oldrow + 5, 10 * oldcolumn + 5)-(10 * oldrow + 6, 10 * oldcolumn + 6), , BF
  COLOR 7
  LOOP

pick:
  Numberofw2s = Numberofw2s + 1: what2save(Numberofw2s) = cursor
  PAINT (10 * row + 5, 10 * column + 5)
RETURN

saving:
      PUT #1, , Numberofw2s
   FOR forsave = 1 TO 49
      PUT #1, , what2save(forsave)
   NEXT

  FOR forclear = 1 TO 49
     what2save(forclear) = 0
  NEXT
 ' cursor = 0
  row = 0
  column = 0
  Numberofw2s = 0
  oldrow = 0
  oldcolumn = 0
  GOSUB back2
RETURN

back1:
CLS
  FOR backrow = 0 TO 150 STEP 10
     FOR backcolumn = 0 TO 150 STEP 10
      LINE (backrow, backcolumn)-(backrow + 10, backcolumn + 10), , B
     NEXT backcolumn
  NEXT backrow
  LINE (11, 11)-(151, 151), , B
  LINE (41, 11)-(91, 61), , B
  LINE (31, 61)-(101, 101), , B
  LINE (41, 101)-(91, 151), , B
  LINE (111, 11)-(151, 101), , B
  LINE (121, 101)-(121, 151)
RETURN

back2:
CLS
  FOR backrow = 0 TO 150 STEP 10
     FOR backcolumn = 0 TO 150 STEP 10
      LINE (backrow, backcolumn)-(backrow + 10, backcolumn + 10), , B
     NEXT backcolumn
  NEXT backrow
  LINE (11, 11)-(161, 161), , B
  LINE (81, 11)-(81, 151)
  LINE (91, 11)-(91, 151)
  LINE (11, 81)-(151, 81)
  LINE (11, 91)-(151, 91)
 RETURN

