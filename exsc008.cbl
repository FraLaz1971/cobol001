      * IF (A-COLOR = "green") AND (A-SIZE > 3)
      *   MOVE A-TYPE TO B-TYPE
      *   ADD A-NUM TO WS-TOTAL.
      *   GO TO PARA-M.
      * ELSE
      *   MOVE A-NUM TO C-NUM
      *   IF A-PAPER IS ALPHABETIC
      *     PERFORM PAPER-PARA
      *     GO TO PARA-M.
      *     IF A-QTY > 0
      *       PERFORM PAPER-PARA
      *       GO TO PARA-M.
      * PARA-M.
        IDENTIFICATION DIVISION.
        PROGRAM-ID. SC8. 
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 04/01/2026. 
        DATE-COMPILED. 04/01/2026. 
        SECURITY. free.
      * THIS PROGRAM IMPLEMENTS THE FLOWCHART OF EX. N. 8 CHAP. SC. CONTROL.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
        DATA DIVISION.
        WORKING-STORAGE SECTION.
        01 REC0.
          03 A-COLOR PIC X(15) VALUE "black".
          03 A-SIZE  PIC 9(3) VALUE 0.
          03 A-TYPE  PIC X(5) VALUE "small".
          03 B-TYPE  PIC X(5) VALUE "large".
          03 A-NUM  PIC 9(3) VALUE 0.
          03 C-NUM  PIC 9(3) VALUE 0.
          03 WS-TOTAL  PIC 9(6) VALUE 0.
          03 A-PAPER   PIC X(6) VALUE "A4".
          03 A-QTY     PIC S9(6) VALUE 0.
       	PROCEDURE DIVISION.
        PARA-BRANCH.
		  DISPLAY "PLEASE ENTER THE COLOR (none TO END)".
          ACCEPT A-COLOR.
          IF A-COLOR = "none" GO TO PARA-END.
		  DISPLAY "PLEASE ENTER THE SIZE (1-999)".
          ACCEPT A-SIZE.
		  DISPLAY "PLEASE ENTER A NUMBER (1-999)".
          ACCEPT A-NUM.
		  DISPLAY "PLEASE ENTER PAPER TYPE".
		  ACCEPT A-PAPER.
		  DISPLAY "PLEASE ENTER A-QUANTITY".
		  ACCEPT A-QTY.
       	DISPLAY "A-COLOR = " A-COLOR
       	DISPLAY "A-SIZE = " A-SIZE
       	DISPLAY "B-TYPE = " B-TYPE
       	IF A-COLOR = "green" AND 
			 A-SIZE > 3
				MOVE A-TYPE TO B-TYPE
				ADD A-NUM TO WS-TOTAL
				GO TO PARA-M
        ELSE
          MOVE A-NUM TO C-NUM.
        IF A-PAPER IS ALPHABETIC
            PERFORM PAPER-PARA
        ELSE
            IF A-QTY > 0
				PERFORM PAPER-PARA.
      *        GO TO PARA-M.
        GO TO PARA-M.
        PAPER-PARA.
		  DISPLAY "EXECUTING PAPER-PARA".
		  DISPLAY "A-PAPER IS " A-PAPER.
		  DISPLAY "A-QTY IS " A-QTY.
        PARA-M.
		  DISPLAY "EXECUTING PARA-M".
		  DISPLAY "C-NUM = " C-NUM.
		  DISPLAY "B-TYPE = " B-TYPE.
          DISPLAY "WS-TOTAL = " WS-TOTAL.
          GO TO PARA-BRANCH.
        PARA-END.
          DISPLAY "PROGRAM IS ENDED: EXITING".
		STOP RUN.

