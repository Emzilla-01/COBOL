000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM904.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO CREATE A REPORT WITH THE OUTPUT OF CEXM902    
000330       *               THE DATA STRUCTURE IS SHOWN BELOW.                
000331       *  STUDENT ENROLMENT NUMBER 6 BYTES, NUMERIC                      
000332       *  STUDENT NAME 10 BYTES, ALPHTOUMERIC                            
000333       *  ADDRESS 10 BYTES, ALPHANUMERIC                                 
000334       *  COUNTY 10 BYTES, ALPHANUMERIC                                  
000335       *  STATE 10 BYTES, ALPHANUMERIC                                   
000336       *  ZIP CODE 8 BYTES, NUMERIC                                      
000337       *                                                                 
000338       * INFILE : JEBA02.***REMOVED***.COBOL.STUDFILE                             
000339       * OUTFILE: JEBA02.***REMOVED***.COBOL.STUDOUT                              
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     8/02/2016   CEXM902 CREATED                  
000370       * JEBA02    ***REMOVED***     8/04/2016   CEXM904 CREATED                  
000380       ******************************************************************
000390        ENVIRONMENT DIVISION.                                            
000391        INPUT-OUTPUT SECTION.                                            
000392        FILE-CONTROL.                                                    
000393            SELECT INPUT-FILE                                            
000394                ASSIGN TO INFILE                                         
000395                ORGANIZATION IS SEQUENTIAL                               
000396                ACCESS MODE IS SEQUENTIAL                                
000397                FILE STATUS IS WS-INPUT-FS.                              
000398            SELECT OUTPUT-FILE                                           
000399                ASSIGN TO OUTFILE                                        
000400                ORGANIZATION IS SEQUENTIAL                               
000401                ACCESS MODE IS SEQUENTIAL                                
000402                FILE STATUS IS WS-OUTPUT-FS.                             
000403        DATA DIVISION.                                                   
000404        FILE SECTION.                                                    
000405        FD INPUT-FILE.                                                   
000406        01  FS-STUD-REC.                                                 
000407            05  FS-ENROLL-NO              PIC 9(06).                     
000408            05  FS-SNAME                  PIC X(10).                     
000409            05  FS-ADDRESS                PIC X(10).                     
000410            05  FS-COUNTRY                PIC X(10).                     
000411            05  FS-STATE                  PIC X(10).                     
000412            05  FS-ZIPCODE                PIC 9(08).                     
000413            05  FILLER                    PIC X(26).                     
000414        FD  OUTPUT-FILE.                                                 
000415        01  FS-OUTPUT-REC                 PIC X(80).                     
000416        WORKING-STORAGE SECTION.                                         
000420        01  WS-INPUT-FS                   PIC X(02).                     
000421        01  WS-OUTPUT-FS                  PIC X(02).                     
000430        01  WS-ERROR-FLAG                 PIC X(03).                     
000440        01  WS-ENDOFFILE                  PIC X(03).                     
000450        01  WS-HEADER1                    PIC X(54)  VALUE ALL "-".      
000451        01  WS-HEADER2.                                                  
000452            02 FILLER                     PIC X(20)  VALUE ALL "*".      
000453            02 FILLER                     PIC X(14)                      
000454                                            VALUE "STUDENT REPORT".      
000455            02 FILLER                     PIC X(20)  VALUE ALL "*".      
000460        01  WS-HEADER3.                                                  
000470            02 FILLER                     PIC X(01)  VALUE "|".          
000480            02 FILLER                     PIC X(05)  VALUE "ROLL".       
000490            02 FILLER                     PIC X(01)  VALUE "|".          
000500            02 FILLER                     PIC X(09)  VALUE "NAME".       
000600            02 FILLER                     PIC X(01)  VALUE "|".          
000700            02 FILLER                     PIC X(09)  VALUE "ADDRESS".    
000710            02 FILLER                     PIC X(01)  VALUE "|".          
000720            02 FILLER                     PIC X(09)  VALUE "COUNTRY".    
000730            02 FILLER                     PIC X(01)  VALUE "|".          
000740            02 FILLER                     PIC X(09)  VALUE "STATE".      
000750            02 FILLER                     PIC X(01)  VALUE "|".          
000760            02 FILLER                     PIC X(07)  VALUE "ZIPCODE".    
000770       *    02 FILLER                     PIC X(00)  VALUE ALL SPACES.   
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INIT-PARA.                                     
001100            PERFORM 20000-PROCESS-PARA UNTIL                             
001110                WS-ERROR-FLAG = "YES"                                    
001120            OR  WS-ENDOFFILE  = "YES".                                   
001200            PERFORM 30000-CLOSE-PARA.                                    
001300            STOP RUN.                                                    
001400        10000-INIT-PARA.                                                 
001410       * OPEN INPUT & OUTPUT FILES                                       
001500            OPEN INPUT INPUT-FILE.                                       
001600            IF WS-INPUT-FS = "00"                                        
001700               DISPLAY "INPUT FILE OPENED SUCCESSFULLY."                 
001800               OPEN OUTPUT OUTPUT-FILE                                   
001900               IF   WS-OUTPUT-FS = "00"                                  
002000                    DISPLAY "OUTPUT FILE OPENED SUCCESSFULLY."           
002100               ELSE MOVE "YES" TO WS-ERROR-FLAG                          
002200                    DISPLAY "OUTPUT FILE ACCESS ERROR."                  
002300            ELSE                                                         
002400               MOVE "YES" TO WS-ERROR-FLAG                               
002500               DISPLAY "INPUT FILE ACCESS ERROR."                        
002600            END-IF.                                                      
002610       * MOVE AND WRITE HEADERS.                                         
002700            MOVE WS-HEADER1               TO FS-OUTPUT-REC.              
002800                                       WRITE FS-OUTPUT-REC.              
002900            MOVE WS-HEADER2               TO FS-OUTPUT-REC.              
003000                                       WRITE FS-OUTPUT-REC.              
003100            MOVE WS-HEADER1               TO FS-OUTPUT-REC.              
003200                                       WRITE FS-OUTPUT-REC.              
003300            MOVE WS-HEADER3               TO FS-OUTPUT-REC.              
003400                                       WRITE FS-OUTPUT-REC.              
003500        20000-PROCESS-PARA.                                              
003600            READ INPUT-FILE                                              
003610            AT END                                                       
003620                 MOVE "YES"               TO WS-ENDOFFILE                
003630            NOT AT END                                                   
003700            MOVE FS-STUD-REC             TO FS-OUTPUT-REC                
003800            DISPLAY FS-OUTPUT-REC     WRITE FS-OUTPUT-REC.               
003900        30000-CLOSE-PARA.                                                
004200            MOVE WS-HEADER1              TO FS-OUTPUT-REC.               
004300            WRITE FS-OUTPUT-REC.                                         
004400            CLOSE INPUT-FILE.                                            
004500            CLOSE OUTPUT-FILE.                                           
****** **************************** Bottom of Data ****************************
                                                                               