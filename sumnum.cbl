       IDENTIFICATION DIVISION.
	   PROGRAM-ID. SumOfIntegers.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 n BINARY-LONG.
       01 i BINARY-LONG.
       01 msum BINARY-LONG VALUE 0.
       PROCEDURE DIVISION.
       DISPLAY "Enter a positive integer"
       ACCEPT n
       PERFORM VARYING i FROM 1 BY 1 UNTIL i > n
       ADD i TO msum
       END-PERFORM
       DISPLAY "The sum is " msum.
		
