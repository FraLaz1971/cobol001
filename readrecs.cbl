        IDENTIFICATION DIVISION.
        PROGRAM-ID. READRECS.
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 05/01/2026. 
        DATE-COMPILED. 05/01/2026. 
        SECURITY. free.
      * THIS PROGRAM CREATES MASTER AND AMENDMENT FILE TO USE AS INPUT.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL.
          SELECT MAT-FILE ASSIGN "matfile.dat".
        DATA DIVISION.
        FILE SECTION.
		FD MAT-FILE.
		01 IN-REC1.
		  03 TYPE1   PIC X.
		  03 AREA1   PIC X(20).
		  03 IN-NUMBER  PIC 9(3).
		  03 LF1         PIC X.
		01 IN-REC2.  
		  03 TYPE2   PIC X.
		  03 AREA2   PIC X(20).
		  03 IN-CODE    PIC 9(6).
		  03 LF2         PIC X.
		01 IN-REC3.  
		  03 TYPE3    PIC 9.
		  03 STREET   PIC X(20).
		  03 CIVN     PIC 9(4).
		  03 CITY     PIC X(10).
		  03 PROVINCE PIC XX.
		  03 COUNTRY  PIC X(10).
		  03 LF3      PIC X.
      *(a) Record type 1 character alphanumeric.
      *		Area 20 characters alphanumeric.
      *		Number 3 packed decimal digits.
      *(b) Record type 1 character alphanumeric.
      *		Area 20 characters alphanumeric.
      *		Account code 6 digits numeric display.
      *(c) Record type 1 character alphanumeric.
      *	Address 60 characters alphanumeric.
        WORKING-STORAGE SECTION. 
        PROCEDURE DIVISION.
		AA-START.
		  OPEN INPUT MAT-FILE.
		BB-READ.
      *    MOVE SPACES TO IN-REC1.
      *    MOVE SPACES TO IN-REC2.
      *    MOVE SPACES TO IN-REC3.
		  READ MAT-FILE AT END GO TO ZZ-END.
        CC-CHOICE.
          IF TYPE1 = "1"  
			PERFORM DD-READ1
			GO TO BB-READ.
          IF TYPE1 = "2"  
			PERFORM DD-READ2
			GO TO BB-READ.
          IF TYPE1 = "3" 
            PERFORM DD-READ3
			GO TO BB-READ
          ELSE
			DISPLAY "UNHANDLED RECORD"
			GO TO BB-READ.
      *Area 1 — SOUTHERN
      *Area 2 — EASTERN
      *Area 3 — NORTHERN
      *Area 4 — WESTERN
		  GO TO ZZ-END.
        DD-READ1.
		  DISPLAY "TYPE " TYPE1 " AREA1 " AREA1 
		  " IN-NUMBER " IN-NUMBER.		  
        DD-READ2.
          DISPLAY "TYPE " TYPE2 " AREA2 " AREA2
          " IN-CODE " IN-CODE.
        DD-READ3.
          DISPLAY "TYPE " TYPE3 " ADDRESS " STREET CIVN CITY
          PROVINCE COUNTRY.
        ZZ-END.
		  CLOSE MAT-FILE.
		  DISPLAY "PROGRAM ENDED: EXITING"
		  STOP RUN.
