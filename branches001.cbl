      *Write an IF statement for the following:
      *If a field IN-CODE has the value 3 branch to A—PARA if it does not add 1
      *to IN-COUNT and branch to the next statement.
        IDENTIFICATION DIVISION.
        PROGRAM-ID. BRANCH1. 
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
          03 IN-CODE  PIC S9(4).
          03 IN-COUNT PIC S9(4).          
        PROCEDURE DIVISION.
        PARA-BRANCH.
        DISPLAY "PLEASE ENTER A NUMBER (-1 TO END)".
        ACCEPT IN-CODE.
        DISPLAY "IN-CODE is " IN-CODE.
        IF IN-CODE = -1 GO TO PARA-END.
		IF IN-CODE = 3
			GO TO A-PARA
		ELSE
          ADD 1 TO IN-CODE.
		  GO TO PARA-REST.
        A-PARA.
        DISPLAY "EXECUTING A-PARA".
        DISPLAY "IN-CODE: " IN-CODE
        GO TO PARA-BRANCH.
        PARA-REST.
        DISPLAY "PARA-REST: COMPLETING THE PROGRAM".        
        DISPLAY "IN-CODE: " IN-CODE
        GO TO PARA-BRANCH.
		PARA-END.
		STOP RUN.
