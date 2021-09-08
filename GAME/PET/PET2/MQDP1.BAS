TYPE picture
  p AS STRING * 12
END TYPE
CLS
DIM pic AS picture
FILES
INPUT "Filename:", filename$
INPUT "Order="; order
OPEN filename$ FOR RANDOM AS #3 LEN = LEN(pic)

CLS
PRINT order; ; "order"
LOCATE 3, 1: PRINT "   123456789012"

FOR i = 1 TO 12
LOCATE i + 3, 1: PRINT i
LOCATE i + 3, 3: INPUT "~", pic.p
    PUT #3, i + (order - 1) * 144, pic.p

NEXT
DO
LOCATE 16
INPUT "DO You want to fix these (1. ok 2. no)"; fixing
IF fixing = 1 THEN
INPUT "what line"; fixing
LOCATE fixing + 3, 1: PRINT fixing
LOCATE fixing + 3, 3: INPUT "~", pic.p
PUT #3, fixing + (order - 1) * 144, pic.p
ELSE EXIT DO
END IF

LOOP
CLOSE

