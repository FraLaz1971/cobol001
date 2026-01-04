      *Write condition-name entries for the following:
      *IN-AGE is a 2-digit numeric display field, on an 03 level.
      *If its value is 0 to 17 then it is data for a minor, if its value is 18 it is
      *data for a new adult, if its value is 65 it is data for a new pensioner.
      *Three condition names will be required.
        IDENTIFICATION DIVISION.
        PROGRAM-ID. BRANCH3. 
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
          03 IN-AGE   PIC S9(3).
            88 MINOR  VALUE 0 THRU 17.          
            88 ADULT  VALUE 18 THRU 64.          
            88 PENSIONER VALUE 65 THRU 999.          
        PROCEDURE DIVISION.
        PARA-BRANCH.
        DISPLAY "PLEASE ENTER THE AGE OF THE CUSTOMER(-1 TO END)".
        ACCEPT IN-AGE.
        DISPLAY "IN-AGE is " IN-AGE.
        IF MINOR DISPLAY "The customer is minor and "
        "is not versating contributions".
        IF ADULT DISPLAY "The customer is an adult "
        "and is  versating contributions".
        IF PENSIONER DISPLAY "The customer is a pensioner "
        "and is receiving pension".
        IF IN-AGE = -1 GO TO PARA-END.
        GO TO PARA-BRANCH.
		PARA-END.
		STOP RUN.
