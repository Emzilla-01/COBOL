000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM9S2.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO READ FROM ONE FILE AND WRITE TO ANOTHER       
000321       *                BASED ON SOME CONDITION.                         
000322       * INFILE: JEBA02.EMY.COBOL.STUDIN                                
000323       * OUTFILE: JEBA02.EMY.COBOL.STUDOUT                              
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     8/03/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000380        ENVIRONMENT DIVISION.                                            
000390        INPUT-OUTPUT SECTION.                                            
000391        FILE-CONTROL.                                                    
000392            SELECT STUD-FILEIN                                           
000393                ASSIGN TO STUDIN                                         
000394                ORGANIZATION IS SEQUENTIAL                               
000395                ACCESS MODE IS SEQUENTIAL                                
000396                FILE STATUS IS WS-STUDIN-FILE-FS.                        
000397            SELECT STUD-FILEOUT                                          
000398                ASSIGN TO STUDOUT                                        
000399                ORGANIZATION IS SEQUENTIAL                               
000400                ACCESS MODE IS SEQUENTIAL                                
000401                FILE STATUS IS WS-STUDOUT-FILE-FS.                       
000402        DATA DIVISION.                                                   
000403        FILE SECTION.                                                    
000404        FD STUD-FILEIN.                                                  
000405        01  FS-STUD-RECIN.                                               
000406            05  FS-ENROLL-NO-I            PIC 9(06).                     
000407            05  FS-SNAME-I                PIC X(30).                     
000408            05  FS-MATHS-MARKS-I          PIC 9(03).                     
000409            05  FS-SCIENCE-MARKS-I        PIC 9(03).                     
000410            05  FS-COMPUTER-MARKS-I       PIC 9(03).                     
000411            05  FS-GRADES-AVG-I           PIC 9(03).                     
000412            05  FILLER                    PIC X(32).                     
000413        FD STUD-FILEOUT.                                                 
000414        01  FS-STUD-RECOUT.                                              
000415            05  FS-ENROLL-NO-O            PIC 9(06).                     
000416            05  FS-SNAME-O                PIC X(30).                     
000417            05  FS-MATHS-MARKS-O          PIC 9(03).                     
000418            05  FS-SCIENCE-MARKS-O        PIC 9(03).                     
000419            05  FS-COMPUTER-MARKS-O       PIC 9(03).                     
000420            05  FS-GRADES-AVG-O           PIC 9(03).                     
000421            05  FILLER                    PIC X(32).                     
000422        WORKING-STORAGE SECTION.                                         
000500        01 WS-STUDIN-FILE-FS              PIC 9(02).                     
000510        01 WS-STUDOUT-FILE-FS             PIC 9(02).                     
000600        01 WS-ERROR-FLAG                  PIC X(03) VALUE "NO".          
000700        01 WS-ENDOFFILE                   PIC X(03) VALUE "NO".          
000800        PROCEDURE DIVISION.                                              
000810       ******************************************************************
000820       * MAIN PGM FLOW.                                                  
000830       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INITIALIZE-PARA.                               
001100            PERFORM 20000-PROCESS-PARA                                   
001110              UNTIL WS-ERROR-FLAG = "YES"                                
001120              OR    WS-ENDOFFILE  = "YES".                               
001200            PERFORM 30000-CLOSE-PARA.                                    
001300            STOP RUN.                                                    
001400       ******************************************************************
001500       * OPEN BOTH FILES AND REPORT STATUS.                              
001600       ******************************************************************
001700        10000-INITIALIZE-PARA.                                           
001800            OPEN INPUT STUD-FILEIN.                                      
001900            IF WS-STUDIN-FILE-FS = 00                                    
002000                DISPLAY "INPUT FILE OPEN SUCCESSFUL."                    
002010                OPEN OUTPUT STUD-FILEOUT                                 
002020                IF WS-STUDOUT-FILE-FS = 00                               
002030                    DISPLAY "OUTPUT FILE OPEN SUCCESSFUL."               
002040                ELSE                                                     
002050                    DISPLAY "OUTPUT FILE OPEN ERROR."                    
002060                    MOVE "YES" TO WS-ERROR-FLAG                          
002100            ELSE                                                         
002200                DISPLAY "INPUT FILE OPEN ERROR."                         
002300                MOVE "YES" TO WS-ERROR-FLAG                              
002400            END-IF.                                                      
002500       ******************************************************************
002600       * READ FILE, CHECK STUDENT NUMBER, MOVE RECORDS TO OUTPUT BUFFER. 
002700       ******************************************************************
002800        20000-PROCESS-PARA.                                              
002900            READ STUD-FILEIN                                             
003000            AT END                                                       
003100                MOVE "YES" TO WS-ENDOFFILE                               
003200            NOT AT END                                                   
003300                IF FS-ENROLL-NO-I > 000003                               
003400                   MOVE FS-ENROLL-NO-I      TO FS-ENROLL-NO-O            
003500                   MOVE FS-SNAME-I          TO FS-SNAME-O                
003600                   MOVE FS-MATHS-MARKS-I    TO FS-MATHS-MARKS-O          
003700                   MOVE FS-SCIENCE-MARKS-I  TO FS-SCIENCE-MARKS-O        
003800                   MOVE FS-COMPUTER-MARKS-I TO FS-COMPUTER-MARKS-O       
003810                   MOVE FS-GRADES-AVG-I     TO FS-GRADES-AVG-O           
003811                   DISPLAY FS-STUD-RECOUT                                
003820                   WRITE FS-STUD-RECOUT                                  
004000               END-IF                                                    
004100            END-READ.                                                    
004200       ******************************************************************
004300       * CLOSE ALL FILES.                                                
004400       ******************************************************************
004500        30000-CLOSE-PARA.                                                
004600            DISPLAY WS-STUDIN-FILE-FS.                                   
004700            CLOSE STUD-FILEIN.                                           
004800            DISPLAY WS-STUDOUT-FILE-FS.                    
004900            CLOSE STUD-FILEOUT.                            