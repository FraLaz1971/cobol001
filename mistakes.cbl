      *There are four mistakes in the following code. What are they?
      *MAIN-LOGIC SECTION.
      *READ A-FILE AT END GO TO THE-END SECTION.
      *.
      *.
      *.
      *OUTPUT.
      *.
      *.
      *.
      *THE-END SECTION.
      *END PARA.
        IDENTIFICATION DIVISION.
        PROGRAM-ID. ReadExpenses. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 04/01/2026. 
        DATE-COMPILED. 04/01/2026. 
        SECURITY. free.
      * THIS PROGRAM SOLVES THE MISTAKES IN THE EXERCISE.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL.
			SELECT A-FILE ASSIGN TO "expenses.dat"
            ORGANIZATION LINE SEQUENTIAL
            ACCESS IS SEQUENTIAL.
        DATA DIVISION. 
			FILE SECTION. 
			FD A-FILE.
			01 EXPENSE-RECORD.
				03 VENDOR	           PIC X(20).
				03 FILLER              PIC X.
				03 BUYER	           PIC X(20).
				03 FILLER              PIC X.
				03 AMOUNT              PIC S9(4)V999.
				03 FILLER              PIC X.
				03 MDATE               PIC X(10).
				03 LF                  PIC X.
        WORKING-STORAGE SECTION. 
			01 AMOUNT-TOTAL   COMP        PIC S9(6)V99.
        PROCEDURE DIVISION.
        MAIN-LOGIC SECTION.
        AA-START. 
            OPEN INPUT A-FILE. 
			MOVE ZEROS TO AMOUNT-TOTAL.
		BB-READ. 
			READ A-FILE AT END GO TO THE-END.
			ADD AMOUNT TO AMOUNT-TOTAL.
		XX-OUTPUT.
      		DISPLAY AMOUNT.
      	YY-CONTROL.
			GO TO BB-READ.
		THE-END SECTION.
		CC-END.  
			DISPLAY "total amount: " AMOUNT-TOTAL.
            CLOSE A-FILE. 
			STOP RUN.
