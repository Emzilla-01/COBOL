000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM9S1.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST READ FUNCTIONALITY.                      
000330       * INFILE: JEBA02.***REMOVED***.COBOL.STUDIN                                
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     8/03/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000380        ENVIRONMENT DIVISION.                                            
000390        INPUT-OUTPUT SECTION.                                            
000391        FILE-CONTROL.                                                    
000392            SELECT STUD-FILEIN                                           
000393                ASSIGN TO STUDIN                                         
000394                ORGANIZATION IS SEQUENTIAL                               
000395                ACCESS MODE IS SEQUENTIAL                                
000396                FILE STATUS IS WS-STUD-FILE-FS.                          
000400        DATA DIVISION.                                                   
000401        FILE SECTION.                                                    
000402        FD STUD-FILEIN.                                                  
000403        01  FS-STUD-RECIN.                                               
000404            05  FS-ENROLL-NO-I            PIC 9(06).                     
000405            05  FS-SNAME-I                PIC X(30).                     
000406            05  FS-MATHS-MARKS-I          PIC 9(03).                     
000407            05  FS-SCIENCE-MARKS-I        PIC 9(03).                     
000408            05  FS-COMPUTER-MARKS-I       PIC 9(03).                     
000409            05  FS-GRADES-AVG-I           PIC 9(03).                     
000410            05  FILLER                    PIC X(32).                     
000420        WORKING-STORAGE SECTION.                                         
000430        01  WS-STUD-RECOUT.                                              
000440            05  WS-ENROLL-NO              PIC 9(06).                     
000450            05  WS-SNAME                  PIC X(30).                     
000460            05  WS-MATHS-MARKS            PIC 9(03).                     
000470            05  WS-SCIENCE-MARKS          PIC 9(03).                     
000480            05  WS-COMPUTER-MARKS         PIC 9(03).                     
000490            05  WS-GRADES-AVG             PIC 9(03).                     
000500        01  WS-STUD-FILE-FS               PIC 9(02).                     
000600        01  WS-ERROR-FLAG                 PIC X(03) VALUE "NO".          
000700        01  WS-ENDOFFILE                  PIC X(03) VALUE "NO".          
000800        PROCEDURE DIVISION.                                              
000810       ******************************************************************
000820       * MAIN PGM FLOW.                                                  
000830       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INITIALIZE-PARA.                               
001100            PERFORM 20000-PROCESS-PARA                                   
001110              UNTIL WS-ERROR-FLAG = "YES"                                
001120              OR    WS-ENDOFFILE  = "YES"                                
001200            PERFORM 30000-CLOSE-PARA.                                    
001300            STOP RUN.                                                    
001400       ******************************************************************
001500       * OPEN FILE AND REPORT STATUS.                                    
001600       ******************************************************************
001700        10000-INITIALIZE-PARA.                                           
001800            OPEN INPUT STUD-FILEIN.                                      
001900            IF WS-STUD-FILE-FS = 00                                      
002000                DISPLAY "FILE OPEN SUCCESSFUL."                          
002100            ELSE                                                         
002200                DISPLAY "ERROR IN FILE OPEN."                            
002300                MOVE "YES" TO WS-ERROR-FLAG.                             
002400                                                                         
002500       ******************************************************************
002600       * READ FILE, CHECK STUDENT NUMBER, DISPLAY RECORDS.               
002700       ******************************************************************
002800        20000-PROCESS-PARA.                                              
002900            READ STUD-FILEIN                                             
003000            AT END                                                       
003100                MOVE "YES" TO WS-ENDOFFILE                               
003200            NOT AT END                                                   
003300                IF FS-ENROLL-NO-I > 000003                               
003400                   MOVE FS-ENROLL-NO-I      TO WS-ENROLL-NO              
003500                   MOVE FS-SNAME-I          TO WS-SNAME                  
003600                   MOVE FS-MATHS-MARKS-I    TO WS-MATHS-MARKS            
003700                   MOVE FS-SCIENCE-MARKS-I  TO WS-SCIENCE-MARKS          
003800                   MOVE FS-COMPUTER-MARKS-I TO WS-COMPUTER-MARKS         
003810                   MOVE FS-GRADES-AVG-I TO WS-GRADES-AVG                 
003900                   DISPLAY WS-STUD-RECOUT                                
004000               END-IF                                                    
004100            END-READ.                                                    
004200       ******************************************************************
004300       * CLOSE THE INPUT FILE.                                           
004400       ******************************************************************
004500        30000-CLOSE-PARA.                                                
004600            DISPLAY WS-STUD-FILE-FS.                                     
004700            CLOSE STUD-FILEIN.            