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
          SELECT OUT-FILE ASSIGN "MT01.dat".
        DATA DIVISION.
        FILE SECTION.
		FD OUT-FILE.
		01 OUT-REC1.
		  03 PERS-NUM   PIC 9(6).
		  03 NAME       PIC X(20).
		  03 DEPART     PIC 9(2).
		  03 YEAR-SERV  PIC 9(2).
		  03 DATE-JOIN  PIC 9(6).
		  03 LF         PIC X.
		WORKING-STORAGE SECTION.
		01 WR-REC  PIC 9(3) VALUE 0.
        PROCEDURE DIVISION.
		AA-START.
		  OPEN OUTPUT OUT-FILE.
		BB-FILL.
		  MOVE 000001 TO PERS-NUM
		  MOVE "Giovanni Caccamo" TO NAME
		  MOVE 12 TO DEPART
		  MOVE  3 TO YEAR-SERV
		  MOVE 231212 TO DATE-JOIN
		  MOVE FUNCTION CHAR(11) TO LF.
		  PERFORM CC-WRITE
		  MOVE 000002 TO PERS-NUM
		  MOVE "Teresa Malgioglio" TO NAME
		  MOVE 5 TO DEPART
		  MOVE  10 TO YEAR-SERV
		  MOVE 160427 TO DATE-JOIN
		  PERFORM CC-WRITE
		  MOVE 000003 TO PERS-NUM
		  MOVE "Vanessa Sallusti" TO NAME
		  MOVE 12 TO DEPART
		  MOVE  7 TO YEAR-SERV
		  MOVE 190906 TO DATE-JOIN
		  PERFORM CC-WRITE
		  MOVE 000004 TO PERS-NUM
		  MOVE "Romolo Brighenzi" TO NAME
		  MOVE 5 TO DEPART
		  MOVE  5 TO YEAR-SERV
		  MOVE 211120 TO DATE-JOIN
		  PERFORM CC-WRITE
		  GO TO ZZ-END.
		CC-WRITE.
		  WRITE OUT-REC1.
		  ADD 1 TO WR-REC.
		ZZ-END.
		  DISPLAY "WRITTEN " WR-REC " RECORDS"
		  DISPLAY "PROGRAM ENDED: EXITING"
		  CLOSE OUT-FILE.
		  STOP RUN.
