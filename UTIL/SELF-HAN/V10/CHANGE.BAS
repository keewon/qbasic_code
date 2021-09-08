DIM pnt(1 TO 49)  AS INTEGER
DIM Noofdata AS INTEGER
 CLS
' INPUT "Source filename:", filename1$
' INPUT "Target filename:", filename2$
 filename1$ = "4divi.fnt"
filename2$ = "4divi2.fnt"



 OPEN filename1$ FOR BINARY AS #1
 OPEN filename2$ FOR BINARY AS #2
ON ERROR GOTO erre
DO

READ page1
READ page2
PRINT page1, page2
SLEEP
    GET #1, page1 * 100 + 1, Noofdata
    FOR k = 1 TO Noofdata
        GET #1, , pnt(k)
     NEXT k

    PUT #2, page2 * 100 + 1, Noofdata
    FOR k = 1 TO Noofdata
        PUT #2, , pnt(k)
     NEXT k

LOOP

DATA 0,0
DATA 1,2,2,4,3,5,4,7,5,8,6,9,7,11,8,13,9,14,10,16,11,17,12,18,13,19,14,20,15,3,16,6,17,10,18,12,19,15
DATA 20,35,21,37,22,39,23,43,24,45,25,51,26,52,27,58,28,59,29,61,30,36,31,42,32,38,33,44
DATA 34,66,35,69,36,72,37,73,38,81,39,83,40,85,41,87,42,88,43,89,44,90,45,91,46,92,47,93,48,67,51,86
DATA 53,68,54,70,55,71,56,74,57,75,58,76,59,77,60,78,61,79,62,80,63,84

erre:
CLOSE
END

