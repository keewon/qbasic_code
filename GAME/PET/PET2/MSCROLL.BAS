
TYPE picture
  p AS STRING * 12
END TYPE
 
DIM pic AS picture

INPUT "FILENAME:", FILENAME$
OPEN FILENAME$ FOR RANDOM AS #3 LEN = LEN(pic)
PRINT "  123456789012"

DO

INPUT pic.p
    PUT #3, , pic.p
IF pic.p = "q           " THEN EXIT DO

LOOP
CLOSE

