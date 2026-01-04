      *Write an IF statement for the following:
      *If a field IN-NUM is negative add 10 to IN—TOTAL and move zero to IN—PART.
        IDENTIFICATION DIVISION.
        PROGRAM-ID. BRANCH2. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 04/01/2026. 
        DATE-COMPILED. 04/01/2026. 
        SECURITY. free.
      * THIS PROGRAM TESTS SOME KINDS OF BRANCHES.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 REC0.
          03 IN-NUM   PIC S9(4).
          03 IN-PART  PIC S9(4) VALUE 100.          
          03 IN-TOTAL PIC S9(6) VALUE 0.          
        PROCEDURE DIVISION.
        PARA-BRANCH.
        DISPLAY "PLEASE ENTER A NUMBER (-1000 TO END)".
        ACCEPT IN-NUM.
        DISPLAY "IN-NUM is " IN-NUM.
        DISPLAY "IN-PART: " IN-PART
        DISPLAY "IN-TOTAL: " IN-TOTAL
        IF IN-NUM = -100 GO TO PARA-END.
		IF IN-NUM < 0
			ADD 10 TO IN-TOTAL
			MOVE 0 TO IN-PART.
        DISPLAY "IN-NUM: " IN-NUM
        DISPLAY "IN-PART: " IN-PART
        DISPLAY "IN-TOTAL: " IN-TOTAL
        GO TO PARA-BRANCH.
		PARA-END.
		STOP RUN.
