DECLARE SUB cprint (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
SCREEN 12
OPEN "eng1.fnt" FOR BINARY AS #2
cprint "A BCDEFGHIJKLMNOPQRSTUVWXYZ", 10, 10, 7
'LOCATE 3: PRINT ""
END

SUB cprint (sentence AS STRING, row AS INTEGER, column AS INTEGER, chrtc AS INTEGER)
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

