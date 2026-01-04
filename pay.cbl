      * A man’s weekly pay is calculated by multiplying the hourly-rate by hours
      * worked deducting insurance and 30% tax, and adding a bonus.
      * man’s pay
      * hourly-rate
      * hours worked
      * insurance
      * bonus
      	IDENTIFICATION DIVISION.
        PROGRAM-ID. PAY. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 03/01/2026. 
        DATE-COMPILED. 03/01/2026. 
        SECURITY. free.
      * THIS PROGRAM CALCULATES THE WEEKLY PAY OF AN EMPLOYEE.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 REC0.
			03 NET-PAY   PIC 9(6)V99   VALUE 0.00.
			03 HOUR-RATE PIC 99V99     VALUE 12.00.
			03 HOURS     PIC 999V99    VALUE 39.00.
			03 INSURE    PIC 99V99     VALUE 10.70.  
			03 BONUS     PIC 99V99     VALUE 90.00. 
		01 GROSS-PAY     PIC 9(6)V99   VALUE 0.00.
		01 TAX           PIC 9(6)V99   VALUE 0.00.
		PROCEDURE DIVISION.
		DISPLAY "NET-PAY = " NET-PAY
		DISPLAY "HOUR-RATE = " HOUR-RATE
		DISPLAY "HOURS = " HOURS
		DISPLAY "INSURE = " INSURE
		DISPLAY "BONUS = " BONUS
		MULTIPLY HOUR-RATE BY HOURS GIVING GROSS-PAY
		DISPLAY "GROSS-PAY = " GROSS-PAY
		MULTIPLY 0.3 BY GROSS-PAY GIVING TAX
		SUBTRACT INSURE TAX FROM GROSS-PAY GIVING NET-PAY
        ADD BONUS TO NET-PAY
		DISPLAY "NET-PAY = " NET-PAY
        STOP RUN.
