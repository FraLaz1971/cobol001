      * #ID NAME   AGE GRADE SALARY
      * 001 Deepak 35  B     25000
      * 002 Shetal 30  B     20000
      * 003 Ranbir 28  C     15000
      * 004 Soumya 45  A     50000
      * 005 Shreva 40  A     45000
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EMPLOYEE-DATA.                 
       AUTHOR. Francesco Lazzarotto.
       INSTALLATION. OK. 
       DATE-WRITTEN. 02/01/2026. 
       DATE-COMPILED. 02/01/2026. 
       SECURITY. free.
      * THIS READS EMPLOYEE DATA.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION. 
       SOURCE-COMPUTER. Lenovo-Linux. 
       OBJECT-COMPUTER. Lenovo-Linux.
       INPUT-OUTPUT SECTION.
	     FILE-CONTROL.
	     SELECT EMPLOYEE 
	     ASSIGN TO "employee.dat".
      *     ORGANISATION IS LINE SEQUENTIAL. 
	     DATA DIVISION. 
			FILE SECTION. 
			FD EMPLOYEE.
			01 EMPLOYEE-RECORD.
				03 EID                 PIC 9(3).
				03 FILLER              PIC X.
				03 NAME                PIC X(6).
				03 FILLER              PIC X.
				03 AGE                 PIC 9(2).
				03 FILLER              PIC X(2).
				03 GRADE               PIC X.
				03 FILLER              PIC X(5).
                03 SALARY              PIC 9(5).
      			03 FILLER              PIC X.
        WORKING-STORAGE SECTION. 
			01 WS-EMPLOYEE-RECORD.
				03 WS-ID                  PIC 9(3).
				03 WS-FILLER              PIC X.
				03 WS-NAME                PIC X(6).
				03 WS-FILLER              PIC X.
				03 WS-AGE                 PIC 9(2).
				03 WS-FILLER              PIC X(2).
				03 WS-GRADE               PIC X.
				03 WS-FILLER              PIC X(5).
                03 WS-SALARY              PIC 9(5).
      			03 WS-FILLER              PIC X.
        PROCEDURE DIVISION. 
        AA-START. 
            OPEN INPUT EMPLOYEE.
        BB-READ. 
			READ EMPLOYEE AT END GO TO CC-END.
			DISPLAY "ID: " EID " NAME: " NAME " AGE: " AGE.  
			DISPLAY " GRADE: " GRADE " SALARY: " SALARY.
			DISPLAY "--------------------------------------"
  		GO TO BB-READ.
		CC-END.  
            CLOSE EMPLOYEE. 
			STOP RUN.



