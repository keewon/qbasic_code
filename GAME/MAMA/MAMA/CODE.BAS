
FOR i = 1 TO 4 STEP 1
readheader$ = MID$(header, i, 1)
PRINT ASC(a$)
 co(2 * i - 2) = INT(ASC(readheader$) / 16)
 co(2 * i - 1) = ASC(readheadera$) MOD 16
NEXT

