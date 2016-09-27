000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM901.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO WRITE TO A SEQUENTIAL DATASET.
000330       * HARDCODE 5 RECORDS USING MOVE STATEMENT.                        
000331       *       STUDENT ENROLLMENT NUMBER 6 BYTES, NUMERIC                
000332       *       STUDENTNAME 30 BYTES, ALPHANUMERIC                        
000333       *       MATHS MARKS 3 BYTES, NUMERIC                              
000334       *       SCIENCE MARKS 3 BYTES, NUMERIC                            
000335       *       COMPUTER MARKS 3 BYTES, NUMERIC                           
000336       *       AVERAGE OF MARKS 3 BYTES, NUMERIC                         
000338       * INFILE : N/A                                                    
000339       * OUTFILE: JEBA02.***REMOVED***.COBOL.STUDFILE                             
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
000405            05  FS-SNAME                  PIC X(30).                     
000406            05  FS-MATHS-MARKS            PIC 9(03).                     
000407            05  FS-SCIENCE-MARKS          PIC 9(03).                     
000408            05  FS-COMPUTER-MARKS         PIC 9(03).                     
000409            05  FS-AVG-MARKS              PIC 9(03).                     
000410            05  FILLER                    PIC X(32).                     
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
002700            MOVE  000001                  TO FS-ENROLL-NO.               
002800            MOVE "ELIZABETH BATHORY"      TO FS-SNAME.                   
002900            MOVE 085                      TO FS-MATHS-MARKS.             
003000            MOVE 095                      TO FS-SCIENCE-MARKS.           
003100            MOVE 070                      TO FS-COMPUTER-MARKS.          
003200            COMPUTE FS-AVG-MARKS = (FS-MATHS-MARKS + FS-SCIENCE-MARKS    
003300                    + FS-COMPUTER-MARKS)/ 3.                             
003400            WRITE FS-STUD-REC.                                           
003500            MOVE  000002                  TO FS-ENROLL-NO.               
003600            MOVE "VLAD TEPES"             TO FS-SNAME.                   
003700            MOVE 065                      TO FS-MATHS-MARKS.             
003800            MOVE 068                      TO FS-SCIENCE-MARKS.           
003900            MOVE 052                      TO FS-COMPUTER-MARKS.          
004000            COMPUTE FS-AVG-MARKS = (FS-MATHS-MARKS + FS-SCIENCE-MARKS    
004100                    + FS-COMPUTER-MARKS)/ 3.                             
004200            WRITE FS-STUD-REC.                                           
004300            MOVE  000003                  TO FS-ENROLL-NO.               
004400            MOVE "GENGHIS KHAN"           TO FS-SNAME.                   
004500            MOVE 085                      TO FS-MATHS-MARKS.             
004600            MOVE 080                      TO FS-SCIENCE-MARKS.           
004700            MOVE 055                      TO FS-COMPUTER-MARKS.          
004800            COMPUTE FS-AVG-MARKS = (FS-MATHS-MARKS + FS-SCIENCE-MARKS    
004900                    + FS-COMPUTER-MARKS)/ 3.                             
005000            WRITE FS-STUD-REC.                                           
005100            MOVE  000004                  TO FS-ENROLL-NO.               
005200            MOVE "LUPA CAPITOLINA"        TO FS-SNAME.                   
005300            MOVE 099                      TO FS-MATHS-MARKS.             
005400            MOVE 099                      TO FS-SCIENCE-MARKS.           
005500            MOVE 099                      TO FS-COMPUTER-MARKS.          
005600            COMPUTE FS-AVG-MARKS = (FS-MATHS-MARKS + FS-SCIENCE-MARKS    
005700                    + FS-COMPUTER-MARKS)/ 3.                             
005800            WRITE FS-STUD-REC.                                           
005900            MOVE  000005                  TO FS-ENROLL-NO.               
006000            MOVE "HERNANDO CORTEZ"        TO FS-SNAME.                   
006100            MOVE 092                      TO FS-MATHS-MARKS.             
006200            MOVE 094                      TO FS-SCIENCE-MARKS.           
006300            MOVE 070                      TO FS-COMPUTER-MARKS.          
006400            COMPUTE FS-AVG-MARKS = (FS-MATHS-MARKS + FS-SCIENCE-MARKS    
006500                    + FS-COMPUTER-MARKS)/ 3.                             
006600            WRITE FS-STUD-REC.                                           
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
