      *Write an IF statement for the following:
      *A field IN-ACCOUNT must contain numeric data and have a value
      *greater than 110, if it does branch to PARA—VALID.
      	IDENTIFICATION DIVISION.
        PROGRAM-ID. CONTROL. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 04/01/2026. 
        DATE-COMPILED. 04/01/2026. 
        SECURITY. free.
      * THIS PROGRAM TESTS ALL KINDS OF BRANCHES.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 REC0.
          03 IN-ACCOUNT PIC S9(4).
        PROCEDURE DIVISION.
        PARA-BRANCH.
        DISPLAY "PLEASE ENTER A NUMBER (-1 TO END)".
        ACCEPT IN-ACCOUNT.
        DISPLAY "IN-ACCOUNT is " IN-ACCOUNT.
        IF IN-ACCOUNT = -1 GO TO PARA-END.
		IF IN-ACCOUNT IS NUMERIC AND IN-ACCOUNT > 110
			GO TO PARA-VALID
		ELSE
          DISPLAY "The field is NOT valid".
		  GO TO PARA-BRANCH.
        PARA-VALID.
          DISPLAY "The field is valid".
        GO TO PARA-BRANCH.
		PARA-END.
		STOP RUN.
