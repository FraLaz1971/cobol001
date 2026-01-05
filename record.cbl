        IDENTIFICATION DIVISION.
        PROGRAM-ID. RECORD. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 04/01/2026. 
        DATE-COMPILED. 04/01/2026. 
        SECURITY. free.
      * THIS PROGRAM READS RECORDS FROM STANDARD INPUT AND VALIDATE THEM.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 IN-REC.
			03 IN-TYPE PIC XX.
			03 IN-AMOUNT PIC S9(6) COMP.
			03 IN-QTY PIC 99.
			03 IN-CODE PIC X.
		01 FLAG1 PIC 9 VALUE 0.
		01 FLAG2 PIC 9 VALUE 0.
		01 FLAG3 PIC 9 VALUE 0.
		01 FLAG4 PIC 9 VALUE 0.
		01 CONT1 PIC 9 VALUE 0.
		01 CONT2 PIC 9 VALUE 0.
		PROCEDURE DIVISION.
		PARA-IN.
		  DISPLAY "PLEASE ENTER IN-TYPE (ST TO END)".
          ACCEPT IN-TYPE.
          DISPLAY "IN-TYPE is " IN-TYPE.
          IF IN-TYPE = "ST" GO TO PARA-END.
		  DISPLAY "PLEASE ENTER IN-AMOUNT".
          ACCEPT IN-AMOUNT.
          DISPLAY "IN-AMOUNT is " IN-AMOUNT.
		  DISPLAY "PLEASE ENTER IN-QTY".
          ACCEPT IN-QTY.
          DISPLAY "IN-QTY is " IN-QTY.
		  DISPLAY "PLEASE ENTER IN-CODE".
          ACCEPT IN-CODE.
          DISPLAY "IN-CODE is " IN-CODE.
		PARA-VALID.
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
			   DISPLAY "RECORD IS VALID"
			ELSE
			   DISPLAY "RECORD IS NOT VALID".
          DISPLAY "IN-TYPE is " IN-TYPE.
          DISPLAY "IN-AMOUNT is " IN-AMOUNT.
          DISPLAY "IN-QTY is " IN-QTY.
          DISPLAY "IN-CODE is " IN-CODE.
        GO TO PARA-IN.
		PARA-END.
		  DISPLAY "PROGRAM ENDED: EXITING".
		STOP RUN.
      * IN-TYPE must contain EF or XY.
      * IN-AMOUNT must be numeric and positive.
      * IN-QTY must be numeric and greater than 10.
      * IN-CODE must be 1, 2, 3 or 4.
