      *(i) Program name EX01.
      *(ii) 
      *(a) Input File, name MT01.dat, sequential magnetic tape file.
      *Input record.
      *Personnel number 6 numeric display:
      *Name 20 alphanumeric characters.
      *Department 2 numeric display.
      *Unit 2 numeric display.
      *Years’ Service 2 numeric display.
      *Date joined 6 numeric display (YYMMDD).
      *Grade code ,3 alphanumeric characters.
      *(b) Output File (1), name DA02.dat, sequential disc file.
      *Output record.
      *Personnel number 6 numeric display.
      *Name 20 alphanumeric characters.
      *Grade code 3 alphanumeric characters.
      *Year joined 2 numeric digits (YY).
      *(c) Output File (2) named DA03.dat, sequential disc file.
      *Output record.
      *Personnel number 6 numeric display.
      *Department 2 numeric display.
      *Unit 2 numeric display.
      *Years’ service 2 numeric display.
      *(iii) Processing
      *(a) Read every record on the input file MT01.dat, create records to
      *be output to the two output files.
      *To create a record for DA02.dat, move the personnel number,
      *name, grade code and the first two digits of the date joined field.
      *To create a record for DA03.dat, move personnel number,
      *department, unit and years’ service. Write both records
      *and return to read the input file.
      *(b) Maintain two counts, one for every record read and one for
      *every record written to the output DA03.dat file.
      *(c) At the end of the input file, close the files and stop the run.
        IDENTIFICATION DIVISION.
        PROGRAM-ID. WR01.
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 05/01/2026. 
        DATE-COMPILED. 05/01/2026. 
        SECURITY. free.
      * THIS CREATE AN INPUT FILE FOR PROGRAM EX01 .
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        INPUT-OUTPUT SECTION. 
        FILE-CONTROL.
          SELECT IN-FILE ASSIGN "MT01.dat".
          SELECT OUT-FILE2 ASSIGN "DA02.dat".
          SELECT OUT-FILE3 ASSIGN "DA03.dat".
        DATA DIVISION.
        FILE SECTION.
		FD IN-FILE.
		01 IN-REC1.
		  03 PERS-NUM   PIC 9(6).
		  03 NAME       PIC X(20).
		  03 DEPART     PIC 9(2).
		  03 YEAR-SERV  PIC 9(2).
		  03 DATE-JOIN  PIC 9(6).
		  03 LF         PIC X.
		FD OUT-FILE2.
		01 OUT-REC2.
		  03 PERS-NUM2  PIC 9(6).
		  03 NAME2      PIC X(20).
		  03 GRADE      PIC X(3).
		  03 YEAR-JOIN  PIC 9(2).
		  03 LF2         PIC X.
		FD OUT-FILE3.
		01 OUT-REC3.
		  03 PERS-NUM3   PIC 9(6).
		  03 DEPART3     PIC 9(2).
		  03 UNIT3        PIC 9(2).
		  03 YEAR-SERV3  PIC 9(2).
		  03 LF3         PIC X.
		WORKING-STORAGE SECTION.
		01 RE-REC   PIC 9(3) VALUE 0.
		01 WR-REC2  PIC 9(3) VALUE 0.
		01 WR-REC3  PIC 9(3) VALUE 0.
        PROCEDURE DIVISION.
		AA-START.
		  OPEN INPUT IN-FILE.
		  OPEN OUTPUT OUT-FILE2 OUT-FILE3.
		BB-READ.
		  READ IN-FILE AT END GO TO ZZ-END.
          ADD 1 TO RE-REC.
        BA-CREATE2.
          MOVE PERS-NUM TO PERS-NUM2.
          MOVE NAME TO NAME2.
          MOVE "LOW" TO GRADE.
          MOVE DATE-JOIN TO YEAR-JOIN.
		  MOVE FUNCTION CHAR(11) TO LF2.
        BC-CREATE3.
          MOVE PERS-NUM TO PERS-NUM3.
		  MOVE DEPART TO DEPART3.
		  MOVE 6 TO UNIT3.
		  MOVE YEAR-SERV TO YEAR-SERV3.
		  MOVE FUNCTION CHAR(11) TO LF3.
		CC-WRITE2.
		  WRITE OUT-REC2.
          ADD 1 TO WR-REC2.
		CC-WRITE3.
		  WRITE OUT-REC3.
          ADD 1 TO WR-REC3.
        DD-GOBACK.
          GO TO BB-READ.
	    ZZ-END.
	      DISPLAY RE-REC " RECORDS READ "
	      DISPLAY WR-REC2 " RECORDS WRITTEN ON OUTFILE1"
	      DISPLAY WR-REC3 " RECORDS WRITTEN ON OUTFILE2"
		  DISPLAY "PROGRAM ENDED: EXITING".
          CLOSE IN-FILE OUT-FILE2 OUT-FILE3. 
		STOP RUN.
