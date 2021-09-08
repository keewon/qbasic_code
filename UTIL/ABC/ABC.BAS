  CLS

 DIM inputfilename AS STRING * 12
 DIM outputfilename AS STRING * 12
 wn = 1000
 DIM ii$(1 TO wn)

 'openfile
 INPUT "Input Filename : "; inputfilename
 INPUT "output Filename : "; outputfilename
 OPEN inputfilename FOR INPUT AS #1
 OPEN outputfilename FOR OUTPUT AS #2
ON ERROR GOTO ooutput
 'input data
 n = 0
 DO
   n = n + 1
   LINE INPUT #1, ii$(n)
    ii$(n) = ii$(n) + " "
 LOOP UNTIL (EOF(1))


   i = 1: j = 1
again:
   IF RTRIM$(ii$(i + 1)) = "" THEN GOTO ooutput

     IF RTRIM$(ii$(i)) = RTRIM$(ii$(i + 1)) THEN
      i = i + 1
           presenti = i
      j = 1
      GOTO again
    END IF

    'IF j > LEN(ii$(i)) THEN
    '     i = i + 1
    '       presenti = i
    '     j = 1
    '     GOTO again
    '     END IF


    PRINT i
    'SLEEP
    ' PRINT ii$(i), ii$(i + 1)
    ' PRINT "i="; i, "j="; j
    'PRINT "k="; k, "l="; l
    k = ASC(MID$(ii$(i), j, 1))
    l = ASC(MID$(ii$(i + 1), j, 1))
   ' PRINT "new k="; k, "new l="; l
  


   IF k > l THEN
             presenti = i
              SWAP ii$(i), ii$(i + 1)
              j = 1
              i = i - 1
              IF i < 1 THEN i = 1
             GOTO again

   ELSEIF k = l THEN
              j = j + 1
              

              GOTO again

   ELSE
        i = presenti
           i = i + 1
      presenti = i
           j = 1
           GOTO again

   END IF
  

ooutput:
  FOR i = 1 TO wn
    PRINT #2, ii$(i)
 NEXT
e:
 CLOSE
 END

