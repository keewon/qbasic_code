' Hello! thanks for using this program.
' My Name is Seo,Kee-won. I'm from Seoul,Korea. I'm poor at English.
' ShinMok High school Student & teenager
' Are you interested in MagicEye ? if you want to know the magiceye
' algorithm send me mail
' or goto http://www.cs.waikato.ac.nz/~singlis/sirds.html
' my mail address: oedalpha@netian.com
' Do You Konw Korea? Please Send me mail, questions and thikings about Korea.
'
' Before using this program, you should make source program Like this
' ( ' should be removed )  0 =< number =<2
'0000000000000000000000000000000
'0001111110001111110000000001100
'0011000011001100011000000011000
'0011000011001111110000000110000
'0011001011001100011000000000000
'0001111110001111110000011000000
'0000000111100000000000011000000
'0000000000000000000000000000000

'ASCII Magic Eye (sirts) Maker v1.0 , 1998 written by Seo
        CLS : RANDOMIZE TIMER
        CONST true = -1: CONST false = 0
        DIM garo, sero, sai, targetfile, x, y AS INTEGER
 'garo means width ,sero means column ,sai means gap. All are Korean words
 'with alphabet. But We use Hangul instead of Alphabet in common life.
 PRINT "This is ascii Magic Eye Maker v1.0 written by Seo"
        FILES
        INPUT "Source File Name      :", sfile$
                IF sfile$ = "" THEN END
        INPUT "Target File Name      :", tfile$
                IF LTRIM$(RTRIM$(tfile$)) <> "" THEN targetfile = true
        INPUT "Distance of Both eyes :", sai
        INPUT "Width of source(1-80) :", garo
        INPUT "Length of source(1-25):", sero

        DIM s1 AS STRING * 80
        DIM s2(1 TO garo, 1 TO sero) AS INTEGER
        DIM t1(1 TO garo + sai, 1 TO sero) AS STRING * 1
        DIM t2 AS STRING

   DO
        CLS : OPEN sfile$ FOR INPUT AS #1
        IF targetfile = true THEN OPEN tfile$ FOR OUTPUT AS #2

        PRINT "           *" + SPACE$(sai - 1) + "*"
        IF targetfile = true THEN PRINT #2, "   *" + SPACE$(sai - 1) + "*"

      FOR y = 1 TO sero
           LINE INPUT #1, s1
                FOR x = 1 TO garo
                        s2(x, y) = VAL(MID$(s1, x, 1))
                NEXT x

                FOR x = 1 TO sai
                     randnumber = CINT(RND(2) * (126 - 32) + 32)
                       t1(x, y) = CHR$(randnumber)
                       t2 = t2 + t1(x, y)

                NEXT x

                FOR x = sai + 1 TO sai + garo
                   t1(x, y) = t1(x - sai + s2(x - sai, y), y)
                   t2 = t2 + t1(x, y)
                NEXT
           PRINT t2
           IF targetfile = true THEN PRINT #2, t2
        t2 = ""
      NEXT y

        PRINT : PRINT "Again (Y/n)"
        temp$ = INPUT$(1)
        IF LCASE$(temp$) <> "y" THEN EXIT DO
        CLOSE
   LOOP
        END

