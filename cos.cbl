       IDENTIFICATION DIVISION.
       PROGRAM-ID. COS.
        AUTHOR. Francesco Lazzarotto.
        INSTALLATION. OK. 
        DATE-WRITTEN. 07/01/2026. 
        DATE-COMPILED. 07/01/2026. 
        SECURITY. free.
        ENVIRONMENT DIVISION. 
        CONFIGURATION SECTION. 
        SOURCE-COMPUTER. Lenovo Linux. 
        OBJECT-COMPUTER. Lenovo Linux.
         INPUT-OUTPUT SECTION. 
       FILE-CONTROL.
          SELECT OUT-FILE ASSIGN "cos-plot.gp".
          SELECT DATA-FILE ASSIGN "points.dat".
       DATA DIVISION.
       FILE SECTION.
	   FD OUT-FILE.
       01 gnuplot.
          05 value1 PIC X(65).
          05 value2 PIC X(68).
	   FD DATA-FILE.
       01 output-data-line.
          05 x-out     pic -9.99.
          05 SPCS      pic x(2).
          05 ans-out   pic -9.9(5).
          05 LF          pic x.
       WORKING-STORAGE SECTION.
       01 x            pic s9v99.
       01 domain       pic s9v99.
       01 degrees      pic s999v9.
       01 answer       pic s9v9(5).
       01 pi           pic s9v9(6) value 3.145927.
       PROCEDURE DIVISION.
       OPEN OUTPUT OUT-FILE. 
       OPEN OUTPUT DATA-FILE.
       move "set terminal qt persist;set grid;set tics scale 0; " 
       to value1.
       move
    "set title 'FUNCTION COS';plot 'points.dat' using 1:2 with lines"
       to value2.
       write gnuplot.
       move function char(11) to LF.
       move "  " to SPCS.
       write output-data-line.
       compute domain = pi * 3
       perform varying x from 0.0 by 0.25 until x > domain
           compute degrees rounded = x * 180 / pi
           move function cos(x) to answer
           display "cos(" x ") ~= cos(" degrees "°) ~= " answer
           move x to x-out
           move answer to ans-out
           write output-data-line
       end-perform.
       CLOSE OUT-FILE.
       CLOSE DATA-FILE.
       call "SYSTEM" using "gnuplot cos-plot.gp".
       perform delete-output.
       delete-output.
