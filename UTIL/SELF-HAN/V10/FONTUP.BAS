'This Program makes Old qhan font( < 97.12.23)  to New Font
SCREEN 12
COLOR 7

DIM what2load(1 TO 29) AS INTEGER
DIM what2save(1 TO 49) AS INTEGER
DIM rn AS INTEGER
DIM Numberofw2s AS INTEGER
DIM numberofprint AS INTEGER
DIM row AS INTEGER
DIM column AS INTEGER
DIM cursor AS INTEGER

CLS
FILES

INPUT "source File nAme"; sfile$
INPUT "target File Name"; tfile$
OPEN sfile$ FOR BINARY AS #1
OPEN tfile$ FOR BINARY AS #2
SEEK #1, 1
CLS
FOR i = 1 TO 73
CLS
  GET #1, (i) * 60 + 1, Numberofw2s
'  PRINT "Number Of save:"; Numberofw2s
'SLEEP

  PUT #2, (i) * 100 + 1, Numberofw2s
   FOR w = 1 TO Numberofw2s
    PRINT "w:"; w
    GET #1, , what2load(w)
'    PRINT "load:"; what2load(w)
    what2save(w) = what2load(w)
    PUT #2, , what2save(w)
'    PRINT "save:"; what2save(w)
    NEXT
NEXT

CLOSE
END

