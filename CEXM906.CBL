000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM906.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO JOIN TWO RECORD FILES         
000330       *                INCLUDING STUDENT GRADES, NAME, ADDRESS,         
000331       *                COUNTRY, STATE, ZIP, AND A PROMPT.               
000332       *               + FORMAT INTO REPORT                              
000338       *        ADDFILE: JEBA02.***REMOVED***.COBOL.STADDRSS                      
000339       *        GPAFILE: JEBA02.***REMOVED***.COBOL.STUDFILE                      
000341       *        OUTFILE: JEBA02.***REMOVED***.COBOL.STFINAL                       
000342       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     8/02/2016   PROGRAM CREATED                  
000370       * JEBA02    ***REMOVED***     8/04/2016   PROGRAM ADAPTED FROM CHM903      
000371       * JEBA02    ***REMOVED***     8/04/2016   PROGRAM ADAPTED FROM CEXM905     
000372       * JEBA02    ***REMOVED***     8/08/2016   DEBUGGING DISPLAY PROBLEM        
000380       ******************************************************************
000390        ENVIRONMENT DIVISION.                                            
000391        INPUT-OUTPUT SECTION.                                            
000392        FILE-CONTROL.                                                    
000393            SELECT ADD-INPUT-FILE                                        
000394                ASSIGN TO ADDFILE                                        
000395                ORGANIZATION IS SEQUENTIAL                               
000396                ACCESS MODE IS SEQUENTIAL                                
000397                FILE STATUS IS WS-ADD-INPUT-FS.                          
000398            SELECT GPA-INPUT-FILE                                        
000399                ASSIGN TO GPAFILE                                        
000400                ORGANIZATION IS SEQUENTIAL                               
000401                ACCESS MODE IS SEQUENTIAL                                
000402                FILE STATUS IS WS-GPA-INPUT-FS.                          
000403            SELECT OUTPUT-FILE                                           
000404                ASSIGN TO OUTFILE                                        
000405                ORGANIZATION IS SEQUENTIAL                               
000406                ACCESS MODE IS SEQUENTIAL                                
000407                FILE STATUS IS WS-OUTPUT-FS.                             
000408        DATA DIVISION.                                                   
000409        FILE SECTION.                                                    
000410        FD  ADD-INPUT-FILE.                                              
000411        01  FS-ADD-INPUT-REC.                                            
000412            05  FS-ENROLL-NO-A            PIC 9(06).                     
000413            05  FS-SNAME-A                PIC X(10).                     
000414            05  FS-ADDRESS                PIC X(10).                     
000415            05  FS-COUNTRY                PIC X(10).                     
000416            05  FS-STATE                  PIC X(10).                     
000417            05  FS-ZIPCODE                PIC 9(08).                     
000418            05  FILLER                    PIC X(26).                     
000419        FD  GPA-INPUT-FILE.                                              
000420        01  FS-GPA-INPUT-REC.                                            
000421            05  FS-ENROLL-NO              PIC 9(06).                     
000422            05  FS-SNAME                  PIC X(30).                     
000423            05  FS-MATHS-MARKS            PIC 9(03).                     
000424            05  FS-SCIENCE-MARKS          PIC 9(03).                     
000425            05  FS-COMPUTER-MARKS         PIC 9(03).                     
000426            05  FS-AVG-MARKS              PIC 9(03).                     
000427            05  FILLER                    PIC X(32).                     
000428        FD  OUTPUT-FILE.                                                 
000429        01  FS-OUTPUT-REC                 PIC X(80).                     
000430       *    02 FS-OUT-A                   PIC X(10).                     
000431       *    02 FS-OUT-B                   PIC X(20).                     
000432       *    02 FS-OUT-C                   PIC X(10).                     
000433       *    02 FS-OUT-D                   PIC X(40).                     
000435        WORKING-STORAGE SECTION.                                         
000436                                                                         
000437        01  WS-COUNT                      PIC 9(02) VALUE 0.             
000438       * HERE ARE THE THREE FILE STORAGE VARIABLES                       
000439        01  WS-ADD-INPUT-FS               PIC X(02).                     
000440        01  WS-GPA-INPUT-FS               PIC X(02).                     
000441        01  WS-OUTPUT-FS                  PIC X(02).                     
000442       * HERE ARE ERROR FLAG & END OF FILE                               
000443        01  WS-ERROR-FLAG                 PIC X(03).                     
000444        01  WS-ENDOFFILE                  PIC X(03).                     
000445        01  WS-BORDER                     PIC X(80) VALUE ALL "*".       
000446        01  WS-OUT.                                                      
000447            02 WS-OUT-A                   PIC X(10).                     
000448            02 WS-OUT-B                   PIC X(20).                     
000449            02 WS-OUT-C                   PIC X(10).                     
000450            02 WS-OUT-D                   PIC X(40).                     
000460        01  WS-CURRENT-DATE-DATA          PIC X(20).                     
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INITIALIZE-PARA.                               
001100            PERFORM 20000-PROCESS-PARA                                   
001110              UNTIL WS-ERROR-FLAG         = "YES"                        
001120              OR    WS-ENDOFFILE          = "YES".                       
001200            PERFORM 30000-CLOSE-PARA.                                    
002000            STOP RUN.                                                    
002100        10000-INITIALIZE-PARA.                                           
002110            MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE-DATA.          
002200            OPEN INPUT ADD-INPUT-FILE.                                   
002210                 IF WS-ADD-INPUT-FS              IS = "00"               
002220                   DISPLAY      "ADDRESS IN-FILE OPENED SUCCESSFULLY."   
002221                   OPEN INPUT GPA-INPUT-FILE                             
002222                   IF WS-GPA-INPUT-FS            IS = "00"               
002223                       DISPLAY "GPA IN-FILE OPENED SUCCESSFULLY."        
002225                       OPEN OUTPUT OUTPUT-FILE                           
002226                       IF WS-OUTPUT-FS           IS = "00"               
002227                           DISPLAY "OUTPUT FILE OPENED SUCCESSFULLY."    
002228                       ELSE                                              
002229                           DISPLAY "OUTPUT FILE ACCESS ERROR."           
002230                           MOVE "YES"            TO WS-ERROR-FLAG        
002231                   ELSE                                                  
002232                       DISPLAY "GPA IN-FILE ACCESS ERROR."               
002233                       MOVE "YES"                TO WS-ERROR-FLAG        
002234                ELSE                                                     
002235                    DISPLAY    "ADDRESS INPUT FILE ACCESS ERROR."        
002240                    MOVE 'YES'                   TO WS-ERROR-FLAG.       
002250       * WRITE HEADERS HERE                                              
002600        20000-PROCESS-PARA.                                              
002610            READ ADD-INPUT-FILE                                          
002620            AT END                                                       
002630                   MOVE "YES"                     TO WS-ENDOFFILE        
002640            NOT AT END                                                   
002650               READ GPA-INPUT-FILE                                       
002660               AT END                                                    
002670                   MOVE "YES"                     TO WS-ENDOFFILE        
002680               NOT AT END                                                
002690               IF FS-ENROLL-NO-A = FS-ENROLL-NO                          
002691               MOVE WS-BORDER                TO FS-OUTPUT-REC            
002692               WRITE FS-OUTPUT-REC           INITIALIZE FS-OUTPUT-REC    
002694               MOVE "STUDENT GRADE REPORT"   TO FS-OUTPUT-REC            
002695               WRITE FS-OUTPUT-REC           INITIALIZE FS-OUTPUT-REC    
002696               MOVE "ROLL # :"               TO WS-OUT-A                 
002697               MOVE FS-ENROLL-NO-A           TO WS-OUT-B                 
002698               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002699               WRITE FS-OUTPUT-REC           INITIALIZE WS-OUT           
002711               MOVE "STUDENT:" TO WS-OUT-A   MOVE FS-SNAME TO WS-OUT-B   
002712               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002713               WRITE FS-OUTPUT-REC           INITIALIZE WS-OUT           
002714               MOVE "ADDRESS:" TO WS-OUT-A   MOVE FS-ADDRESS TO WS-OUT-B 
002715               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002716               WRITE FS-OUTPUT-REC           INITIALIZE WS-OUT           
002717               MOVE "STATE  :" TO WS-OUT-A   MOVE FS-STATE TO WS-OUT-B   
002718               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002719               WRITE FS-OUTPUT-REC           INITIALIZE WS-OUT           
002720               MOVE "COUNTRY:" TO WS-OUT-A   MOVE FS-COUNTRY TO WS-OUT-B 
002721               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002722               WRITE FS-OUTPUT-REC           INITIALIZE WS-OUT           
002723               MOVE "ZIPCODE:" TO WS-OUT-A   MOVE FS-ZIPCODE TO WS-OUT-B 
002724               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002725               WRITE FS-OUTPUT-REC           INITIALIZE WS-OUT           
002726               MOVE "    DEAR," TO WS-OUT-A  MOVE FS-SNAME-A TO WS-OUT-B 
002727               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002728               WRITE FS-OUTPUT-REC           INITIALIZE FS-OUTPUT-REC    
002729               MOVE "YOUR AVERAGE FOR THE EXAM IS" TO WS-OUT             
002730               MOVE FS-AVG-MARKS             TO WS-OUT-C                 
002731               MOVE WS-OUT                   TO FS-OUTPUT-REC            
002732               WRITE FS-OUTPUT-REC           INITIALIZE FS-OUTPUT-REC    
002733               INITIALIZE WS-OUT                                         
002734               MOVE "HAVE A GREAT SUMMER!"   TO WS-OUT                   
002735               WRITE FS-OUTPUT-REC           INITIALIZE FS-OUTPUT-REC    
002736               ADD 1 TO WS-COUNT                                         
002738               MOVE "REPORT #:" TO WS-OUT-A                              
002739               MOVE WS-COUNT TO WS-OUT-B                                 
002740               MOVE WS-OUT TO FS-OUTPUT-REC                              
002741               WRITE FS-OUTPUT-REC INITIALIZE WS-OUT                     
002742               END-IF                                                    
002750               END-READ END-READ.                                        
002800        30000-CLOSE-PARA.                                                
002810               MOVE WS-BORDER TO FS-OUTPUT-REC.                          
002820               WRITE FS-OUTPUT-REC.                                      
002830               INITIALIZE FS-OUTPUT-REC.                                 
002900               CLOSE ADD-INPUT-FILE.                                     
003000               CLOSE GPA-INPUT-FILE.                                     
****** **************************** Bottom of Data ****************************
                                                                               