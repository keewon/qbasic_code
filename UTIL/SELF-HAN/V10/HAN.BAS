





DECLARE SUB qhan (han$)
 CLS
 SCREEN 12
 OPEN "taro.fnt" FOR BINARY AS #1
 qhan "TJRLDUD"

SUB qhan (han$)
 DIM pnt(1 TO 49) AS INTEGER
 DIM page AS INTEGER
 DIM lastpage AS INTEGER
 DIM l1upage AS INTEGER
 DIM l2upage AS INTEGER
 DIM getNo AS INTEGER
 DIM NoOfdata AS INTEGER
    
 FOR i = 1 TO LEN(han$)
        letter$ = MID$(han$, i, 1)
            SELECT CASE letter$
               CASE "R": page = 1
               CASE "S": page = 2
               CASE "E": page = 3
               CASE "F": page = 4
               CASE "A": page = 5
               CASE "Q": page = 6
               CASE "T": page = 7
               CASE "D": page = 8
               CASE "W": page = 9
               CASE "C": page = 10
               CASE "Z": page = 11
               CASE "X": page = 12
               CASE "V": page = 13
               CASE "G": page = 14
               CASE "q": page = 15
               CASE "w": page = 16
               CASE "e": page = 17
               CASE "r": page = 18
               CASE "t": page = 19

               CASE "K": page = 20
               CASE "I": page = 21
               CASE "J": page = 22
               CASE "U": page = 23
               CASE "H": page = 24
               CASE "Y": page = 25
               CASE "N": page = 26
               CASE "B": page = 27
               CASE "M": page = 28
               CASE "L": page = 29
               CASE "O": page = 30
               CASE "P": page = 31
               CASE "o": page = 32
               CASE "p": page = 33
            END SELECT
     umun = umun + 1
     IF umun = 4 THEN umun = 1
     IF umun = 3 AND page >= 20 AND page <= 33 AND lastpage >= 20 AND lastpage <= 33 THEN umun = 2        'bokmoum
    
     IF umun = 1 THEN row = row + 16


     IF umun = 1 AND page >= 20 AND page <= 33 THEN               ' batchimMoo
            GET #1, lastpage * 100 + 1, NoOfdata
                FOR k = 1 TO NoOfdata
                    GET #1, , pnt(k)
                NEXT k

              FOR j = 1 TO NoOfdata
                    y = FIX(pnt(j) / 16)
                    x = pnt(j) - y * 16
                   PRESET (row + x - 16, column + y)
              NEXT j

            GET #1, (lastpage - 32) * 100 + 1, NoOfdata
                FOR k = 1 TO NoOfdata
                    GET #1, , pnt(k)
                NEXT k

              FOR j = 1 TO NoOfdata
                    y = FIX(pnt(j) / 16)
                    x = pnt(j) - y * 16
                   PSET (row + x, column + y)
              NEXT j

              GET #1, page * 100 + 1, NoOfdata
                FOR k = 1 TO NoOfdata
                    GET #1, , pnt(k)
                NEXT k
     
             FOR j = 1 TO NoOfdata
                   y = FIX(pnt(j) / 16)
                   x = pnt(j) - y * 16
               PSET (row + x, column + y)
             NEXT j
        umun = 2
  END IF
       
     IF umun = 3 AND page >= 1 AND page <= 19 THEN page = page + 32   'batchim

'    IF umun = 2 AND page >= 1 AND page <= 19 THEN 'bokJAeum
'       IF l2upage = 1 AND l1upage = 7 THEN lastpage = 53
'       IF l2upage = 2 AND l1upage = 9 THEN lastpage = 54
'       IF l2upage = 2 AND l1upage = 14 THEN lastpage = 55
'      IF l2upage = 4 AND l1upage = 1 THEN lastpage = 56
'      IF l2upage = 4 AND l1upage = 5 THEN lastpage = 57
'      IF l2upage = 4 AND l1upage = 6 THEN lastpage = 58
'      IF l2upage = 4 AND l1upage = 7 THEN lastpage = 59
'     IF l2upage = 4 AND l1upage = 12 THEN lastpage = 60
'      IF l2upage = 4 AND l1upage = 13 THEN lastpage = 61
'      IF l2upage = 4 AND l1upage = 14 THEN lastpage = 62
'      IF l2upage = 6 AND l1upage = 7 THEN lastpage = 63
'   END IF


    GET #1, page * 100 + 1, NoOfdata

    FOR k = 1 TO NoOfdata
        GET #1, , getNo
        pnt(k) = getNo
     NEXT k

      FOR j = 1 TO NoOfdata
          y = FIX(pnt(j) / 16)
          x = pnt(j) - y * 16
       PSET (row + x, column + y)
      NEXT j

     
   lastpage = page
 NEXT i
END SUB

