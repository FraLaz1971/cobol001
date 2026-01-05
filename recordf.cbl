        IDENTIFICATION DIVISION.
        PROGRAM-ID. RECORDF. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 04/01/2026. 
        DATE-COMPILED. 04/01/2026. 
        SECURITY. free.
      * THIS PROGRAM READS SOME RECORDS FROM A FILE AND VALIDATE THEM.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL.
			SELECT IN-FILE ASSIGN TO "records.dat"
              ORGANIZATION IS SEQUENTIAL 
              ACCESS IS SEQUENTIAL.
        DATA DIVISION. 
			FILE SECTION. 
			FD IN-FILE.
			01 RIN-REC.
				03 RIN-TYPE   PIC XX.
				03 RIN-AMOUNT PIC S9(6).
				03 RIN-QTY    PIC 99.
				03 RIN-CODE   PIC X.
				03 FILLER     PIC X.
        WORKING-STORAGE SECTION.
        01 IN-REC.
			03 IN-TYPE PIC XX.
			03 IN-AMOUNT PIC S9(6).
			03 IN-QTY PIC 99.
			03 IN-CODE PIC X.
			03 FILLER PIC X.
		01 FLAG1 PIC 9 VALUE 0.
		01 FLAG2 PIC 9 VALUE 0.
		01 FLAG3 PIC 9 VALUE 0.
		01 FLAG4 PIC 9 VALUE 0.
		01 CONT1 PIC 9 VALUE 0.
		01 CONT2 PIC 9 VALUE 0.
		PROCEDURE DIVISION.
        AA-START. 
            OPEN INPUT IN-FILE. 
		BB-READ.
			READ IN-FILE AT END GO TO PARA-END.
			MOVE RIN-TYPE TO IN-TYPE.
			MOVE RIN-AMOUNT TO IN-AMOUNT.
			MOVE RIN-QTY TO IN-QTY.
			MOVE RIN-CODE TO IN-CODE.
		PARA-IN.
		  DISPLAY "-------------------------".
          DISPLAY IN-REC.
          DISPLAY "IN-TYPE is " IN-TYPE.
          DISPLAY "IN-AMOUNT is " IN-AMOUNT.
          DISPLAY "IN-QTY is " IN-QTY.
          DISPLAY "IN-CODE is " IN-CODE.
		CC-VALIDATE.
			MOVE 0 TO CONT1.
			MOVE 0 TO CONT2.
			MOVE 0 TO FLAG1.
			MOVE 0 TO FLAG2.
			MOVE 0 TO FLAG3.
			MOVE 0 TO FLAG4.
			INSPECT IN-TYPE 
            TALLYING CONT1 for ALL
                             "EF".
			INSPECT IN-TYPE 
            TALLYING CONT2 for ALL
                             "XY".
			DISPLAY "CONT1 = " CONT1.
			DISPLAY "CONT2 = " CONT2.
            IF CONT1 = 1 OR
               CONT2 = 1
               MOVE 1 TO FLAG1.
			DISPLAY "FLAG1 = " FLAG1.
            IF IN-AMOUNT IS NUMERIC AND
               IN-AMOUNT > 0
               MOVE 1 TO FLAG2.
			DISPLAY "FLAG2 = " FLAG2.
			IF IN-QTY IS NUMERIC AND
			   IN-QTY > 10
               MOVE 1 TO FLAG3.
			DISPLAY "FLAG3 = " FLAG3.
            IF IN-CODE = "1"  OR
               IN-CODE = "2"  OR            
               IN-CODE = "3"  OR            
               IN-CODE = "4"            
               MOVE 1 TO FLAG4.
			DISPLAY "FLAG4 = " FLAG4.
			IF FLAG1 = 1 AND
			   FLAG2 = 1 AND
			   FLAG3 = 1 AND
			   FLAG4 = 1
			   GO TO AA-VALID
			ELSE
			   GO TO ZZ-INVALID
      *   DISPLAY "IN-TYPE is " IN-TYPE.
      *   DISPLAY "IN-AMOUNT is " IN-AMOUNT.
      *   DISPLAY "IN-QTY is " IN-QTY.
      *   DISPLAY "IN-CODE is " IN-CODE.
		  DISPLAY "-------------------------".
		  ZZ-INVALID.
			   DISPLAY "RECORD IS NOT VALID".
			   GO TO BB-READ.
		  AA-VALID.
			   DISPLAY "RECORD IS VALID"
			   GO TO BB-READ.
		PARA-END.
		  DISPLAY "PROGRAM ENDED: EXITING".
            CLOSE IN-FILE. 
		STOP RUN.
      * IN-TYPE must contain EF or XY.
      * IN-AMOUNT must be numeric and positive.
      * IN-QTY must be numeric and greater than 10.
      * IN-CODE must be 1, 2, 3 or 4.
