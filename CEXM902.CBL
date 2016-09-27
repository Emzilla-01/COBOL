000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM902.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM WHICH WILL STORE THE ADDRESS     
000330       *               OF EACH STUDENT. THE STRUCTURE IS SHOWN BELOW.    
000331       *  STUDENT ENROLMENT NUMBER 6 BYTES, NUMERIC                      
000332       *  STUDENT NAME 10 BYTES, ALPHANUMERIC                            
000333       *  ADDRESS 10 BYTES, ALPHANUMERIC                                 
000334       *  COUNTY 10 BYTES, ALPHANUMERIC                                  
000335       *  STATE 10 BYTES, ALPHANUMERIC                                   
000336       *  ZIP CODE 8 BYTES, NUMERIC                                      
000337       *                                                                 
000338       * INFILE : N/A                                                    
000339       * OUTFILE: JEBA02.***REMOVED***.COBOL.STUDOUT                              
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     8/02/2016   PROGRAM CREATED                  
000380       ******************************************************************
000390        ENVIRONMENT DIVISION.                                            
000391        INPUT-OUTPUT SECTION.                                            
000392        FILE-CONTROL.                                                    
000393            SELECT STUD-FILE                                             
000394                ASSIGN TO STUDOUT                                        
000395                ORGANIZATION IS SEQUENTIAL                               
000396                ACCESS MODE IS SEQUENTIAL                                
000397                FILE STATUS IS WS-STUD-FILE-FS.                          
000400        DATA DIVISION.                                                   
000401        FILE SECTION.                                                    
000402        FD STUD-FILE.                                                    
000403        01  FS-STUD-REC.                                                 
000404            05  FS-ENROLL-NO              PIC 9(06).                     
000405            05  FS-SNAME                  PIC X(10).                     
000406            05  FS-ADDRESS                PIC X(10).                     
000407            05  FS-COUNTRY                PIC X(10).                     
000408            05  FS-STATE                  PIC X(10).                     
000409            05  FS-ZIPCODE                PIC 9(08).                     
000410            05  FILLER                    PIC X(26).                     
000411        WORKING-STORAGE SECTION.                                         
000420        01 WS-STUD-FILE-FS                PIC X(02).                     
000430        01 WS-ERROR-FLAG                  PIC X(03).                     
000800        PROCEDURE DIVISION.                                              
000810       ******************************************************************
000820       * MAIN PROGRAM FLOW.                                              
000830       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INITIALIZE-PARA.                               
001100            PERFORM 20000-PROCESS-PARA                                   
001110              UNTIL WS-ERROR-FLAG = "YES".                               
001200            PERFORM 30000-CLOSE-PARA.                                    
002000            STOP RUN.                                                    
002010       ******************************************************************
002020       * OPEN FILE FOR WRITING.                                          
002030       ******************************************************************
002100        10000-INITIALIZE-PARA.                                           
002200            OPEN OUTPUT STUD-FILE.                                       
002210            IF WS-STUD-FILE-FS            IS = "00"                      
002220               MOVE 'NO' TO WS-ERROR-FLAG                                
002230            ELSE                                                         
002240               MOVE 'YES' TO WS-ERROR-FLAG.                              
002500       ******************************************************************
002510       * MOVE VALUES, CALCULATE AVERAGE, WRITE TO FILE.                  
002520       ******************************************************************
002600        20000-PROCESS-PARA.                                              
002700            MOVE 000001                   TO FS-ENROLL-NO.               
002900            MOVE 'ELIZABETH BATHORY'      TO FS-SNAME.                   
003000            MOVE 'CSEJTE'                 TO FS-ADDRESS.                 
003100            MOVE 'SLOVAKIA'               TO FS-COUNTRY.                 
003200            MOVE 'TRENCIN'                TO FS-STATE.                   
003300            MOVE 00091621                 TO FS-ZIPCODE.                 
003400            WRITE FS-STUD-REC.                                           
003500            MOVE 000002                   TO FS-ENROLL-NO.               
003600            MOVE 'VLAD TEPES'             TO FS-SNAME.                   
003700            MOVE 'COMANA'                 TO FS-ADDRESS.                 
003800            MOVE 'ROMANIA'                TO FS-COUNTRY.                 
003900            MOVE 'GIURGIU'                TO FS-STATE.                   
004000            MOVE 00000603                 TO FS-ZIPCODE.                 
004100            WRITE FS-STUD-REC.                                           
004200            MOVE 000004                   TO FS-ENROLL-NO.               
004300            MOVE 'LUPA CAPITOLINA'        TO FS-SNAME.                   
004400            MOVE 'ROMA'                   TO FS-ADDRESS.                 
004500            MOVE 'ITALIA'                 TO FS-COUNTRY.                 
004600            MOVE 'ROMA CAPITALE'          TO FS-STATE.                   
004700            MOVE 00000100                 TO FS-ZIPCODE.                 
004800            WRITE FS-STUD-REC.                                           
004900            MOVE 000005                   TO FS-ENROLL-NO.               
005000            MOVE 'HERNANDO CORTEZ'        TO FS-SNAME.                   
005100            MOVE 'HOSPITAL DE JESúS NAZARENO' TO FS-ADDRESS.             
005200            MOVE 'MEXICO'                 TO FS-COUNTRY.                 
005300            MOVE 'CDMX'                   TO FS-STATE.                   
005400            MOVE 00000016                 TO FS-ZIPCODE.                 
005500            WRITE FS-STUD-REC.                                           
006601       ******************************************************************
006602       * MOVE 'YES' TO ERROR CODE TO END PERFORM LOOP.                   
006603       ******************************************************************
006605            MOVE "YES" TO WS-ERROR-FLAG.                                 
006610       ******************************************************************
006620       * DISPLAY FILE STATUS AND CLOSE THE FILE.                         
006630       ******************************************************************
006700        30000-CLOSE-PARA.                                                
006800            DISPLAY WS-STUD-FILE-FS.                                     
006900            CLOSE STUD-FILE.                                             
