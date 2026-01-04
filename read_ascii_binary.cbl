        IDENTIFICATION DIVISION.
        PROGRAM-ID. ReadExpenses. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 03/01/2026. 
        DATE-COMPILED. 03/01/2026. 
        SECURITY. free.
      * THIS PROGRAM READ ASCBIN AND COMPUTES TOTAL.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL.
			SELECT ASCBIN-FILE ASSIGN TO "ascii_binary.dat"
            ORGANIZATION LINE SEQUENTIAL
            ACCESS IS SEQUENTIAL.
        DATA DIVISION. 
			FILE SECTION. 
			FD ASCBIN-FILE.
			01 ASCBIN-RECORD.
				03 X	               PIC 1(5).
				03 FILLER              PIC X.
				03 Y	               PIC 1(9).
				03 LF                  PIC X.
        WORKING-STORAGE SECTION. 
			01 WS-ASCBIN-RECORD.
				03 WS-X	               PIC 1(5).
				03 WS-FILLER              PIC X.
				03 WS-Y	               PIC 1(9).
				03 WS-LF                  PIC X.
        PROCEDURE DIVISION. 
        AA-START. 
            OPEN INPUT ASCBIN-FILE. 
		BB-READ. 
			READ ASCBIN-FILE AT END GO TO CC-END.
			MOVE ASCBIN-RECORD TO WS-ASCBIN-RECORD
			DISPLAY WS-X " " WS-Y
			GO TO BB-READ.
		CC-END.  
			DISPLAY "file read" .
            CLOSE ASCBIN-FILE. 
			STOP RUN.
