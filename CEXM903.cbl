000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM903.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM WHICH WILL TAKE EMPLOYEE FILES   
000330       *              AS INPUT AND OUTPUT RECORDS OF EMPNO > 70.         
000331       *  EMP NO PIC 9(4)                                                
000332       *  EMP NAME PIC X(20)                                             
000333       *  EMP SALARY PIC 9(5)                                            
000334       *  DEPT NO: PIC 9(2)                                              
000335       *  DATE OF JOINING: PIC X(08)                                     
000336       *                                                                 
000337       *                                                                 
000338       * INFILE : JEBA02.***REMOVED***.COBOL.EMPIN                                
000339       * OUTFILE: JEBA02.***REMOVED***.COBOL.EMPOUT                               
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     8/02/2016   PROGRAM CREATED                  
000380       ******************************************************************
000390        ENVIRONMENT DIVISION.                                            
000391        INPUT-OUTPUT SECTION.                                            
000392        FILE-CONTROL.                                                    
000393            SELECT EMP-FILE-IN                                           
000394                ASSIGN TO EMPIN                                          
000395                ORGANIZATION IS SEQUENTIAL                               
000396                ACCESS MODE IS SEQUENTIAL                                
000397                FILE STATUS IS WS-EMP-IN-FS.                             
000398            SELECT EMP-FILE-OUT                                          
000399                ASSIGN TO EMPOUT                                         
000400                ORGANIZATION IS SEQUENTIAL                               
000401                ACCESS MODE IS SEQUENTIAL                                
000402                FILE STATUS IS WS-EMP-OUT-FS.                            
000403        DATA DIVISION.                                                   
000404        FILE SECTION.                                                    
000405        FD EMP-FILE-IN.                                                  
000406        01  FS-EMP-REC.                                                  
000407            05  FS-EMP-NO                 PIC 9(04).                     
000408            05  FS-EMP-NAME               PIC X(20).                     
000409            05  FS-EMP-SALARY             PIC 9(05).                     
000410            05  FS-DEPT-NO                PIC 9(02).                     
000411            05  FS-DATE-JOINED            PIC X(08).                     
000412            05  FILLER                    PIC X(41).                     
000413        FD EMP-FILE-OUT.                                                 
000414        01  FS-EMP-REC-OUT                PIC X(80).                     
000421        WORKING-STORAGE SECTION.                                         
000422        01 WS-EMP-IN-FS                   PIC X(02).                     
000423        01 WS-EMP-OUT-FS                  PIC X(02).                     
000430        01 WS-ERROR-FLAG                  PIC X(03).                     
000440        01 WS-ENDOFFILE                   PIC X(03).                     
000800        PROCEDURE DIVISION.                                              
000810       ******************************************************************
000820       * MAIN PROGRAM FLOW.                                              
000830       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INITIALIZE-PARA.                               
001100            PERFORM 20000-PROCESS-PARA                                   
001110              UNTIL WS-ERROR-FLAG = "YES"                                
001120                 OR WS-ENDOFFILE  = "YES".                               
001200            PERFORM 30000-CLOSE-PARA.                                    
002000            STOP RUN.                                                    
002010       ******************************************************************
002020       * OPEN FILES FOR READ & WRITE.                                    
002030       ******************************************************************
002100        10000-INITIALIZE-PARA.                                           
002200            OPEN INPUT  EMP-FILE-IN                                      
002210            IF WS-EMP-IN-FS                = 00                          
002220                DISPLAY 'INPUT FILE ACCESSED SUCCESSFULLY'               
002221                OPEN OUTPUT EMP-FILE-OUT                                 
002222                IF WS-EMP-OUT-FS           = 00                          
002223                    DISPLAY "OUTPUT FILE ACCESSED SUCCESSFULLY"          
002224                ELSE                                                     
002225                    DISPLAY "OUTPUT FILE ACCESS ERROR"                   
002226                    MOVE "YES"             TO WS-ERROR-FLAG              
002227                END-IF                                                   
002230            ELSE                                                         
002231                DISPLAY "INPUT FILE ACCESS ERROR."                       
002240                MOVE 'YES'                 TO WS-ERROR-FLAG              
002250            END-IF.                                                      
002500       ******************************************************************
002510       * MOVE VALUES, CALCULATE AVERAGE, WRITE TO FILE.                  
002520       ******************************************************************
002600        20000-PROCESS-PARA.                                              
002601            READ EMP-FILE-IN                                             
002602            AT END                                                       
002603                MOVE "YES" TO WS-ENDOFFILE                               
002604            NOT AT END                                                   
002605                IF FS-EMP-NO > 0070                                      
002610                    MOVE FS-EMP-REC        TO FS-EMP-REC-OUT             
002620                    DISPLAY FS-EMP-REC-OUT                               
002700                    WRITE FS-EMP-REC-OUT                                 
002800                END-IF                                                   
002900            END-READ.                                                    
006610       ******************************************************************
006620       * DISPLAY FILE STATUS AND CLOSE THE FILE.                         
006630       ******************************************************************
006700        30000-CLOSE-PARA.                                                
006800            DISPLAY WS-EMP-IN-FS.                                        
006900            CLOSE EMP-FILE-IN.                                           
007000            DISPLAY WS-EMP-OUT-FS.                                       
007100            CLOSE EMP-FILE-OUT.                                          
****** **************************** Bottom of Data ****************************