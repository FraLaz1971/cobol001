        IDENTIFICATION DIVISION.
        PROGRAM-ID. DIFFRECS.
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
		01 OUT-REC1.
		  03 TYPE1   PIC X.
		  03 AREA1   PIC X(20).
		  03 OUT-NUMBER  PIC 9(3).
		  03 LF1         PIC X.
		01 OUT-REC2.  
		  03 TYPE2   PIC X.
		  03 AREA2   PIC X(20).
		  03 OUT-CODE    PIC 9(6).
		  03 LF2         PIC X.
		01 OUT-REC3.  
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
		  OPEN OUTPUT MAT-FILE.
		BB-FILL.
      *Area 1 — SOUTHERN
      *Area 2 — EASTERN
      *Area 3 — NORTHERN
      *Area 4 — WESTERN
          MOVE SPACES TO OUT-REC1.
		  MOVE "1" TO TYPE1.
		  MOVE "NORTHERN" TO AREA1.
		  MOVE 15 TO OUT-NUMBER.
		  MOVE FUNCTION CHAR(11) TO LF1.
		  PERFORM CC-WRITE1.
          MOVE SPACES TO OUT-REC2.
		  MOVE "2" TO TYPE2.
		  MOVE "NORTHERN" TO AREA2.
		  MOVE 35138 TO OUT-CODE.
		  MOVE FUNCTION CHAR(11) TO LF2.
		  PERFORM CC-WRITE2.
          MOVE SPACES TO OUT-REC3.
		  MOVE "3" TO TYPE3.
		  MOVE "via Agordat" TO STREET.
		  MOVE 15 TO CIVN.
		  MOVE "Padova" TO CITY.
		  MOVE "PD" TO PROVINCE.
		  MOVE "Italy" TO COUNTRY.
		  MOVE FUNCTION CHAR(11) TO LF3.
		  PERFORM CC-WRITE3.
          MOVE SPACES TO OUT-REC2.
		  MOVE "2" TO TYPE2.
		  MOVE "SOUTHERN" TO AREA2.
		  MOVE 23 TO OUT-CODE.
		  MOVE FUNCTION CHAR(11) TO LF2.
		  PERFORM CC-WRITE2.
          MOVE SPACES TO OUT-REC1.
		  MOVE "1" TO TYPE1.
		  MOVE "WESTERN" TO AREA1.
		  MOVE 11 TO OUT-NUMBER.
		  MOVE FUNCTION CHAR(11) TO LF1.
		  PERFORM CC-WRITE1.
          MOVE SPACES TO OUT-REC2.
		  MOVE "2" TO TYPE2.
		  MOVE "WESTERN" TO AREA2.
		  MOVE 04100 TO OUT-CODE.
		  MOVE FUNCTION CHAR(11) TO LF2.
		  PERFORM CC-WRITE2.
          MOVE SPACES TO OUT-REC3.
		  MOVE "3" TO TYPE3.
		  MOVE "via G. B. Vico" TO STREET.
		  MOVE 11 TO CIVN.
		  MOVE "Latina" TO CITY.
		  MOVE "LT" TO PROVINCE.
		  MOVE "Italy" TO COUNTRY.
		  MOVE FUNCTION CHAR(11) TO LF3.
		  PERFORM CC-WRITE3.
		  GO TO ZZ-END.
        CC-WRITE1.
          WRITE OUT-REC1. 
        CC-WRITE2.
          WRITE OUT-REC2.
        CC-WRITE3.
          WRITE OUT-REC3.
        ZZ-END.
		  CLOSE MAT-FILE.
		  DISPLAY "PROGRAM ENDED: EXITING"
		  STOP RUN.
