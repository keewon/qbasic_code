'If you like this program then email me.
'Who know's, I might send another program or two
'for free to you.
'The computer shows my email address when you exit
'the program.
KEY 1, "bye" + CHR$(13)
KEY 3, "begin" + CHR$(13)
SCREEN 12
begin:
a = 1
CLS
me$ = "Jeremy" 'That's my name. Change it to your name
COLOR 4
LOCATE a, 1
com$ = "Hi, " + me$ + "! Let's chat."
PRINT com$
DO
com$ = "I don't understand."
LOCATE 27, 1
PRINT "[F1] Quit                                                       [F3] Restart"
LOCATE a + 1, 1
COLOR 1
INPUT "", jss$
IF INSTR(jss$, "begin") THEN GOTO begin: a = 1
IF INSTR(jss$, "what") THEN com$ = "What do you have in mind?"
IF INSTR(jss$, "are you going to be") THEN com$ = "A programmer."
IF INSTR(jss$, "i will") THEN
        IF INSTR(jss$, "die soon") THEN com$ = "Sorry to hear that."
        IF INSTR(jss$, "programmer") THEN com$ = "That's nice."
        IF INSTR(jss$, "have a baby") THEN com$ = "That's good."
        IF INSTR(jss$, "talk to Eliza") THEN com$ = "The theorpist? Cool."
        IF INSTR(jss$, "use chat.bas") THEN com$ = "Cool. He's my friend."
        IF INSTR(jss$, "make friends") THEN com$ = "That's nice. I have a few."
        IF INSTR(jss$, "get a job") THEN com$ = "Good!"
END IF
computer:
IF INSTR(jss$, "computer") THEN com$ = "What's your favorite computer type?"
IF INSTR(jss$, "computer") THEN
     IF INSTR(jss$, "bell") THEN com$ = "Packard bells are cool."
     IF INSTR(jss$, "gate") THEN com$ = "I've never been on a gateway before"
END IF
doyou:
IF INSTR(jss$, "do you") THEN
    IF INSTR(jss$, "music") THEN com$ = "Alternative"
    IF INSTR(jss$, "like") THEN com$ = "Girls"
    IF INSTR(jss$, "hate") THEN com$ = "Hardly anything."
    IF INSTR(jss$, "hate me") THEN com$ = "No, " + me$ + "."
END IF
animal:
IF INSTR(jss$, "animal") THEN com$ = "What's your favorite animal?"
IF INSTR(jss$, "animal") THEN
   IF INSTR(jss$, "reptile") THEN com$ = "I had a turtle once. He was as fast as me. It was fast!"
   IF INSTR(jss$, "dog") THEN com$ = "I had a small dog once. He had a big fight with the biggest dog around and won"
   IF INSTR(jss$, "cat") THEN com$ = "They are ok."
   IF INSTR(jss$, "cow") THEN com$ = "They have a stinky smell to'm."
   IF INSTR(jss$, "ginn") THEN com$ = "I like ginney pigs."
END IF
IF INSTR(jss$, "you jerk") THEN com$ = "I'm not a jerk, " + me$ + "."
IF INSTR(jss$, "die") THEN com$ = "Don't tell me to die, " + me$ + "."
like:
IF INSTR(jss$, "like") THEN com$ = "What do you like?"
IF INSTR(jss$, "like") THEN
    IF INSTR(jss$, "school") THEN com$ = "I HATE IT."
    IF INSTR(jss$, "games") THEN com$ = "Me too."
    IF INSTR(jss$, "evil") THEN com$ = "I'm not."
    IF INSTR(jss$, "crap") THEN com$ = "You like crap? Your disgusting, " + me$ + "!"
    IF INSTR(jss$, "megaman") THEN com$ = "MegaMan is ok."
    IF INSTR(jss$, "doom") THEN com$ = "DOOM ROCKS!"
    IF INSTR(jss$, "puzzle") THEN com$ = "Puzzles are ok."
    IF INSTR(jss$, "pop") THEN com$ = "Both pop music and soda are ok."
    IF INSTR(jss$, "music") THEN com$ = "I like alternative."
    IF INSTR(jss$, "wolfen") THEN com$ = "Wolfenstein rocks."
    IF INSTR(jss$, "gremlin") THEN com$ = "Gremlins is good."
    IF INSTR(jss$, "doom2") THEN com$ = "Cool."
    IF INSTR(jss$, "kubik") THEN com$ = "That's a good game."
    IF INSTR(jss$, "kubik2") THEN com$ = "That's a good game."
    IF INSTR(jss$, "girl") THEN com$ = "Ok."
    IF INSTR(jss$, "boy") THEN com$ = "Ok."
    IF INSTR(jss$, "computer") THEN com$ = "Cool"
END IF
cd:
IF INSTR(jss$, "cd") THEN com$ = "What's your favorite cd?"

IF INSTR(jss$, "cd") THEN
     IF INSTR(jss$, "janet") THEN com$ = "I like her music."
     IF INSTR(jss$, "god") THEN com$ = "Most god music sucks. I got some good cd's of it though."
     IF INSTR(jss$, "metallica") THEN com$ = "I LOVE metallica!"
     IF INSTR(jss$, "rap") THEN com$ = "I don't like rap that much."
     IF INSTR(jss$, "doom") THEN com$ = "DOOM rocks!"
     IF INSTR(jss$, "sport") THEN com$ = "Sports music is ok."
END IF
IF INSTR(jss$, "game") THEN
   IF INSTR(jss$, "snoopy") THEN com$ = "If your talking about YEARN2LEARN it's ok."
   IF INSTR(jss$, "doom") THEN com$ = "DOOM ROCKS, " + me$ + "..."
   IF INSTR(jss$, "wing c") THEN com$ = "Wing Commander is hard."
   IF INSTR(jss$, "kubik") THEN com$ = "KUBIK rocks."
   IF INSTR(jss$, "simcity") THEN com$ = "I got $100,000,000.00 dollars once."
   IF INSTR(jss$, "rocket f") THEN com$ = "I like rocket fuel."
END IF
IF INSTR(jss$, "i need") THEN com$ = "You need what?"
IF INSTR(jss$, "i need") THEN
   IF INSTR(jss$, "girlfriend") THEN com$ = "Use Eliza from qbasic.com for that stuff."
   IF INSTR(jss$, "boyfriend") THEN com$ = "Use Eliza from qbasic.com"
   IF INSTR(jss$, "money") THEN com$ = "Invest something."
   IF INSTR(jss$, "calc") THEN com$ = "I'm sorry, " + me$ + ", I don't have a calculator."
   IF INSTR(jss$, "cd") THEN com$ = "You should be able to get a cdplayer, cdrom, and some cds at wal-mart."
   IF INSTR(jss$, "gun") THEN com$ = "Go get one."
   IF INSTR(jss$, "games") THEN com$ = "There are a bunch of low priced games at wal-mart."
END IF
IF INSTR(jss$, "music") THEN com$ = "What is your favorite type of music?"
IF INSTR(jss$, "music") THEN
   IF INSTR(jss$, "pop") THEN com$ = "Pop is ok."
   IF INSTR(jss$, "rap") THEN com$ = "Rap is ok."
   IF INSTR(jss$, "rock") THEN com$ = "Rock is ok."
   IF INSTR(jss$, "altern") THEN com$ = "Alternative is good."
   IF INSTR(jss$, "jazz") THEN com$ = "I don't like jazz."
END IF
IF INSTR(jss$, "hobby") THEN com$ = "Sorry, I don't talk about hobbies."
IF INSTR(jss$, "who are you") THEN com$ = "Keith."
IF INSTR(jss$, "who is your friend") THEN com$ = "Eliza."
IF INSTR(jss$, "bye") THEN CLS
IF INSTR(jss$, "chat") THEN
        IF INSTR(jss$, "chat.bas") THEN com$ = "Cool."
        IF INSTR(jss$, "eliza") THEN com$ = "Eliza is ok."
        IF INSTR(jss$, "you") THEN com$ = "You already are, " + me$ + "."
        IF INSTR(jss$, "my friend") THEN com$ = "Bring'm over here."
END IF
IF INSTR(jss$, "pop") THEN com$ = "What's your favorite type of pop?"
IF INSTR(jss$, "pop") THEN
        IF INSTR(jss$, "coke") THEN com$ = "So do I."
        IF INSTR(jss$, "minu") THEN com$ = "So do I."
        IF INSTR(jss$, "diet coke") THEN com$ = "That's ok."
        IF INSTR(jss$, "surge") THEN com$ = "Surge is good."
        IF INSTR(jss$, "dew") THEN com$ = "Mountain Dew is good."
        IF INSTR(jss$, "coke2") THEN com$ = "I like coke 2."
END IF
a = a + 2
COLOR 4
PRINT com$
IF a = 21 THEN CLS : a = 1
IF INSTR(jss$, "bye") THEN GOTO ender
LOOP
ender:
CLS
com$ = "Email: jerzy1234@aol.com"
PRINT com$

