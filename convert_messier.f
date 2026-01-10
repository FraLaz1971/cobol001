      PROGRAM CONMES
          IMPLICIT NONE
          CHARACTER*80 IFNAM
          character*90 intest,TROW
          INTEGER MAXDIM,NCOLS,I,POSI,naxis,naxes(2),bitpix
          integer j,group,fpixel,nelements,array(300,200)          
          PARAMETER(MAXDIM=100,NCOLS=10)
          integer status,unit,readwrite,blocksize,hdutype,tfields,nrows
          integer varidat,ROW(MAXDIM),mclass(MAXDIM),colnum,frow,felem
          character filename*40,extname*16
          character*16 ttype(NCOLS),tform(NCOLS),tunit(NCOLS)
          character oname(MAXDIM)*5,alt_name(MAXDIM)*10,
     &    CONSTELL(MAXDIM)*3,vmag_uncert(MAXDIM)
          character mdim(MAXDIM)*6
          REAL RA(MAXDIM),DEC(MAXDIM),VMAG(MAXDIM)
          logical simple,extend,debug
          data ttype/'Row','Obj_Name','alt_name','Ra','Dec','Constell',
     &    'dimension','vmag','vmag_uncert','class'/
          data tform/'1J','5A','10A','1D','1D','3A','6A','1D','1A','1J'/
          data tunit/' ',' ',' ','Deg','Deg',' ',' ',' ',' ',' '/
          debug = .false.
C  The STATUS parameter must always be initialized.
      status=0

C  Name of the FITS file to append the ASCII table to:
      filename='messier_f.fits'
      call deletefile(filename,status)

C  Get an unused Logical Unit Number to use to open the FITS file.
      call ftgiou(unit,status)
      blocksize=1
      call ftinit(unit,filename,blocksize,status)

C  Initialize parameters about the FITS image.
C  BITPIX = 16 means that the image pixels will consist of 16-bit
C  integers.  The size of the image is given by the NAXES values. 
C  The EXTEND = TRUE parameter indicates that the FITS file
C  may contain extensions following the primary array.
      simple=.true.
      bitpix=16
      naxis=2
      naxes(1)=300
      naxes(2)=200
      extend=.true.

C  Write the required header keywords to the file
      call ftphpr(unit,simple,bitpix,naxis,naxes,0,1,extend,status)
c      goto 70
      group=1
      fpixel=1
      nelements=naxes(1)*naxes(2)
      call ftpprj(unit,group,fpixel,nelements,array,status)

70    continue
C  Open the FITS file, with write access.
      readwrite=1
c      call ftopen(unit,filename,readwrite,blocksize,status)
c      call ftcrhd(unit,status)

C  Move to the 1st HDU in the file .
      call ftmahd(unit,1,hdutype,status)

C  Append/create a new empty HDU onto the end of the file and move to it.
      call ftcrhd(unit,status)

C  Define parameters for the binary table (see the above data statements)
      tfields=ncols
      nrows=1
      extname='MESSIER_OBJECTS'
      varidat=0
C  FTPHBN writes all the required header keywords which define the
C  structure of the binary table. NROWS and TFIELDS gives the number of
C  rows and columns in the table, and the TTYPE, TFORM, and TUNIT arrays
C  give the column name, format, and units, respectively of each column.
      call ftphbn(unit,nrows,tfields,ttype,tform,tunit,
     &            extname,varidat,status)

C  Write names to the first column, diameters to 2nd col., and density to 3rd
C  FTPCLS writes the string values to the NAME column (column 1) of the
C  table.  The FTPCLJ and FTPCLE routines write the diameter (integer) and
C  density (real) value to the 2nd and 3rd columns.  The FITSIO routines
C  are column oriented, so it is usually easier to read or write data in a
C  table in a column by column order rather than row by row.  Note that
C  the identical subroutine calls are used to write to either ASCII or
C  binary FITS tables.
      frow=1
      felem=1
c      call ftpcls(unit,colnum,frow,felem,nrows,name,status)
C      ROW(I),ONAME(I),ALT_NAME(I),
C     &RA(I),DEC(I),CONSTELL(I),MDIM(I),VMAG(I),VMAG_UNCERT(I),MCLASS(I)

C READ ALL RECORDS
          IFNAM="messier.csv"
          OPEN(11,FILE=IFNAM,ERR=9000) 
          read(11,'(A)') INTEST
          DO 5,I=1,90
           IF (INTEST(I:I).EQ.',' ) INTEST(I:I)=' '
5         CONTINUE
          PRINT *,INTEST
          DO 10,I=1,MAXDIM
             READ(11,'(A)',ERR=9100,END=80) TROW
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(I3)',ERR=9100,END=80) ROW(I)
             if (debug) PRINT *,I,'READ ROW'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(A5)',ERR=9100,END=80) ONAME(I)
             if (debug) PRINT *,I,'READ NAME'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(A10)',ERR=9100,END=80) ALT_NAME(I)
             if (debug) PRINT *,I,'READ ALT_NAME'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(F8.4)',ERR=9100,END=80) RA(I)
             if (debug) PRINT *,I,'READ RA'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(F8.4)',ERR=9100,END=80) DEC(I)
             if (debug) PRINT *,I,'READ DEC'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(A3)',ERR=9100,END=80) CONSTELL(I)
             if (debug) PRINT *,I,'READ CONSTELLATION'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(A6)',ERR=9100,END=80) MDIM(I)
             if (debug) PRINT *,I,'READ DIMENSION'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(F8.4)',ERR=9100,END=80) VMAG(I)
             if (debug) PRINT *,I,'READ MAGNITUDE'
             TROW=TROW(POSI+1:)
             POSI=INDEX(TROW,',')
             if (TROW(1:POSI-1) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:POSI-1),'(A1)',ERR=9100,END=80) VMAG_UNCERT(I)
             if (debug) PRINT *,I,'READ MAGNITUDE UNCERTAINTY'
             TROW=TROW(POSI+1:)
             if (TROW(1:) .eq. 'null') TROW(1:POSI-1)='0'
             READ(TROW(1:),'(I4)',ERR=9100,END=80) MCLASS(I)
            frow=I
            colnum=1
            call ftpclj(unit,colnum,frow,felem,nrows,ROW(I),status)
            colnum=2
            call ftpcls(unit,colnum,frow,felem,nrows,ONAME(I),status)  
            colnum=3
            call ftpcls(unit,colnum,frow,felem,nrows,ALT_NAME(I),status)  
            colnum=4
            call ftpcle(unit,colnum,frow,felem,nrows,RA(I),status)  
            colnum=5
            call ftpcle(unit,colnum,frow,felem,nrows,DEC(I),status)  
            colnum=6
            call ftpcls(unit,colnum,frow,felem,nrows,CONSTELL(I),status)  
            colnum=7
            call ftpcls(unit,colnum,frow,felem,nrows,MDIM(I),status)  
            colnum=8
            call ftpcle(unit,colnum,frow,felem,nrows,VMAG(I),status)  
            colnum=9
            call ftpcls(unit,colnum,frow,felem,nrows,VMAG_UNCERT(I)
     &,status)  
            colnum=10
            call ftpclj(unit,colnum,frow,felem,nrows,MCLASS(I),status)  
c            READ(11,FMT=100,ERR=9100,END=80) ROW(I),ONAME(I),ALT_NAME(I)
c     &,RA(I),DEC(I),CONSTELL(I),MDIM(I),VMAG(I),VMAG_UNCERT(I),MCLASS(I)    
            PRINT 100,ROW(I),ONAME(I),ALT_NAME(I),
     &RA(I),DEC(I),CONSTELL(I),MDIM(I),VMAG(I),VMAG_UNCERT(I),MCLASS(I)
10        CONTINUE
          CLOSE(11)
C  The FITS file must always be closed before exiting the program. 
C  Any unit numbers allocated with FTGIOU must be freed with FTFIOU.
      call ftclos(unit, status)
      call ftfiou(unit, status)

C  Check for any error, and if so print out error messages.
C  The PRINTERROR subroutine is listed near the end of this file.
      if (status .gt. 0)call printerror(status)
          GOTO 9999
80        PRINT *,'END OF FILE ENCOUNTERED'
          GOTO 9999
100       format(I3,1X,A5,1X,A10,1X,2(F8.4,1X),A3,1X,A6,1X,F4.1,1X,A1
     &,1X,I4)
9000      PRINT *,'ERROR IN OPENING INPUT FILE'
9100      PRINT *,'ERROR IN READING DATA', ROW(I),ONAME(I),ALT_NAME(I),
     &RA(I),DEC(I),CONSTELL(I),MDIM(I),VMAG(I),VMAG_UNCERT(I),MCLASS(I)
          GOTO 9999
9999      STOP
      END PROGRAM
C *************************************************************************
      subroutine printerror(status)

C  This subroutine prints out the descriptive text corresponding to the
C  error status value and prints out the contents of the internal
C  error message stack generated by FITSIO whenever an error occurs.

      integer status
      character errtext*30,errmessage*80

C  Check if status is OK (no error); if so, simply return
      if (status .le. 0)return

C  The FTGERR subroutine returns a descriptive 30-character text string that
C  corresponds to the integer error status number.  A complete list of all
C  the error numbers can be found in the back of the FITSIO User's Guide.
      call ftgerr(status,errtext)
      print *,'FITSIO Error Status =',status,': ',errtext

C  FITSIO usually generates an internal stack of error messages whenever
C  an error occurs.  These messages provide much more information on the
C  cause of the problem than can be provided by the single integer error
C  status value.  The FTGMSG subroutine retrieves the oldest message from
C  the stack and shifts any remaining messages on the stack down one
C  position.  FTGMSG is called repeatedly until a blank message is
C  returned, which indicates that the stack is empty.  Each error message
C  may be up to 80 characters in length.  Another subroutine, called
C  FTCMSG, is available to simply clear the whole error message stack in
C  cases where one is not interested in the contents.
      call ftgmsg(errmessage)
      do while (errmessage .ne. ' ')
          print *,errmessage
          call ftgmsg(errmessage)
      end do
      end
C *************************************************************************
      subroutine deletefile(filename,status)

C  A simple little routine to delete a FITS file

      integer status,unit,blocksize
      character*(*) filename

C  Simply return if status is greater than zero
      if (status .gt. 0)return

C  Get an unused Logical Unit Number to use to open the FITS file
      call ftgiou(unit,status)

C  Try to open the file, to see if it exists
      call ftopen(unit,filename,1,blocksize,status)

      if (status .eq. 0)then
C         file was opened;  so now delete it 
          call ftdelt(unit,status)
      else if (status .eq. 103)then
C         file doesn't exist, so just reset status to zero and clear errors
          status=0
          call ftcmsg
      else
C         there was some other error opening the file; delete the file anyway
          status=0
          call ftcmsg
          call ftdelt(unit,status)
      end if

C  Free the unit number for later reuse
      call ftfiou(unit, status)
      end
C Row	oname	alt_name	ra	dec	constell	dimension	vmag	vmag_uncert	class
CTTYPE1 = 'Row '          
CTFORM1 = 'K '          
CTNULL1 = 999999           
CTTYPE2 = 'name '          
CTFORM2 = '5A '          
CTTYPE3 = 'alt_name'           
CTFORM3 = '10A '          
CTTYPE4 = 'ra '          
CTFORM4 = 'D '          
CTTYPE5 = 'dec '          
CTFORM5 = 'D '          
CTTYPE6 = 'constell'           
CTFORM6 = '3A '          
CTTYPE7 = 'dimension'           
CTFORM7 = '6A '          
CTTYPE8 = 'vmag '          
CTFORM8 = 'D '          
CTTYPE9 = 'vmag_uncert'           
CTFORM9 = '1A '          
CTTYPE10 = 'class '          
CTFORM10 = 'K '          
CTNULL10 = 999999           
CEND             
