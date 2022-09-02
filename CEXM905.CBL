000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM905.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO SELECT ALL STUDENTS WITH      
000330       *                GPA GREATER THAN 70%, WRITE THESE RECORDS        
000331       *                TO ANOTHER PS.                                   
000332       *     +++++++++++ FORMAT INTO REPORT                              
000338       * INFILE : JEBA02.EMY.COBOL.STUDFILE                             
000339       * OUTFILE: JEBA02.EMY.COBOL.STUD70                               
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     8/02/2016   PROGRAM CREATED                  
000370       * JEBA02    EMY     8/04/2016   PROGRAM ADAPTED FROM CHM903      
000380       ******************************************************************
000390        ENVIRONMENT DIVISION.                                            
000391        INPUT-OUTPUT SECTION.                                            
000392        FILE-CONTROL.                                                    
000393            SELECT INPUT-FILE                                            
000394                ASSIGN TO INFILE                                         
000395                ORGANIZATION IS SEQUENTIAL                               
000396                ACCESS MODE IS SEQUENTIAL                                
000397                FILE STATUS IS WS-INPUT-FILE-FS.                         
000398            SELECT OUTPUT-FILE                                           
000399                ASSIGN TO OUTFILE                                        
000400                ORGANIZATION IS SEQUENTIAL                               
000401                ACCESS MODE IS SEQUENTIAL                                
000402                FILE STATUS IS WS-OUTPUT-FILE-FS.                        
000403        DATA DIVISION.                                                   
000404        FILE SECTION.                                                    
000405        FD INPUT-FILE.                                                   
000406        01  FS-STUD-REC.                                                 
000407            05  FS-ENROLL-NO              PIC 9(06).                     
000408            05  FS-SNAME                  PIC X(30).                     
000409            05  FS-MATHS-MARKS            PIC 9(03).                     
000410            05  FS-SCIENCE-MARKS          PIC 9(03).                     
000411            05  FS-COMPUTER-MARKS         PIC 9(03).                     
000412            05  FS-AVG-MARKS              PIC 9(03).                     
000413            05  FILLER                    PIC X(32).                     
000414        FD  OUTPUT-FILE.                                                 
000415        01  FS-OUTPUT-REC                 PIC X(80).                     
000416        WORKING-STORAGE SECTION.                                         
000417        01  WS-REFORMAT.                                                 
000418            05  WS-ENROLL-NO              PIC 9(06).                     
000419            05  WS-SNAME                  PIC X(30).                     
000420            05  WS-MATHS-MARKS            PIC ZZZ.                       
000421            05  WS-SCIENCE-MARKS          PIC ZZZ.                       
000422            05  WS-COMPUTER-MARKS         PIC ZZZ.                       
000423            05  WS-AVG-MARKS              PIC ZZZ.                       
000425        01  WS-INPUT-FILE-FS              PIC X(02).                     
000426        01  WS-OUTPUT-FILE-FS             PIC X(02).                     
000430        01  WS-ERROR-FLAG                 PIC X(03).                     
000440        01  WS-ENDOFFILE                  PIC X(03).                     
000450        01  WS-HEADER1                    PIC X(48) VALUE ALL "^V".      
000451        01  WS-HEADER2.                                                  
000452            02 FILLER                     PIC X(17) VALUE ALL "*".       
000453            02 FILLER                     PIC X(14)                      
000454                                          VALUE "STUDENT REPORT".        
000455            02 FILLER                     PIC X(17) VALUE ALL "*".       
000460        01  WS-HEADER3.                                                  
000470            02 FILLER                     PIC X(01) VALUE "|".           
000480            02 FILLER                     PIC X(05) VALUE "ROLL".        
000490            02 FILLER                     PIC X(01) VALUE "|".           
000500            02 FILLER                     PIC X(29) VALUE "STUDENT NAME".
000600            02 FILLER                     PIC X(01) VALUE "|".           
000700            02 FILLER                     PIC X(02) VALUE "MA".          
000710            02 FILLER                     PIC X(01) VALUE "|".           
000720            02 FILLER                     PIC X(02) VALUE "SC".          
000730            02 FILLER                     PIC X(01) VALUE "|".           
000740            02 FILLER                     PIC X(02) VALUE "CO".          
000750            02 FILLER                     PIC X(01) VALUE "|".           
000760            02 FILLER                     PIC X(02) VALUE "AV".          
000800        PROCEDURE DIVISION.                                              
000810       ******************************************************************
000820       * MAIN PROGRAM FLOW.                                              
000830       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INITIALIZE-PARA.                               
001100            PERFORM 20000-PROCESS-PARA                                   
001110              UNTIL WS-ERROR-FLAG         = "YES"                        
001120              OR    WS-ENDOFFILE          = "YES".                       
001200            PERFORM 30000-CLOSE-PARA.                                    
002000            STOP RUN.                                                    
002010       ******************************************************************
002020       * OPEN FILE FOR WRITING.                                          
002030       ******************************************************************
002100        10000-INITIALIZE-PARA.                                           
002200            OPEN INPUT INPUT-FILE.                                       
002210                IF WS-INPUT-FILE-FS            IS = "00"                 
002220                DISPLAY      "INPUT FILE OPENED SUCCESSFULLY."           
002221                OPEN OUTPUT OUTPUT-FILE                                  
002222                    IF WS-OUTPUT-FILE-FS       IS = "00"                 
002223                    DISPLAY "OUTPUT FILE OPENED SUCCESSFULLY."           
002224                    ELSE                                                 
002225                        DISPLAY    "OUTPUT FILE ACCESS ERROR."           
002226                        MOVE "YES"             TO WS-ERROR-FLAG          
002230                ELSE                                                     
002231                    DISPLAY         "INPUT FILE ACCESS ERROR."           
002240                    MOVE 'YES'                 TO WS-ERROR-FLAG.         
002250       * WRITE REPORT HEADER                                             
002260            MOVE WS-HEADER1 TO FS-OUTPUT-REC.                            
002270                         WRITE FS-OUTPUT-REC.                            
002280            MOVE WS-HEADER2 TO FS-OUTPUT-REC.                            
002290                         WRITE FS-OUTPUT-REC.                            
002300            MOVE WS-HEADER3 TO FS-OUTPUT-REC.                            
002400                         WRITE FS-OUTPUT-REC.                            
002500       ******************************************************************
002510       * MOVE VALUES, CALCULATE AVERAGE, WRITE TO FILE.                  
002520       ******************************************************************
002600        20000-PROCESS-PARA.                                              
002610            READ INPUT-FILE                                              
002620            AT END                                                       
002621                MOVE "YES"                TO WS-ENDOFFILE                
002630            NOT AT END                                                   
002640                IF  FS-AVG-MARKS > 070                                   
002641                    MOVE FS-ENROLL-NO      TO WS-ENROLL-NO               
002642                    MOVE FS-SNAME          TO WS-SNAME                   
002643                    MOVE FS-MATHS-MARKS    TO WS-MATHS-MARKS             
002644                    MOVE FS-SCIENCE-MARKS  TO WS-SCIENCE-MARKS           
002645                    MOVE FS-COMPUTER-MARKS TO WS-COMPUTER-MARKS          
002646                    MOVE FS-AVG-MARKS      TO WS-AVG-MARKS               
002647                    MOVE WS-REFORMAT       TO FS-OUTPUT-REC              
002648                    DISPLAY FS-OUTPUT-REC                                
002650       *            MOVE FS-STUD-REC       TO WS-REFORMAT                
002651       *            MOVE WS-REFORMAT       TO FS-OUTPUT-REC              
002652       *            DISPLAY FS-OUTPUT-REC                                
002660                    WRITE FS-OUTPUT-REC                                  
002661                END-IF                                                   
002670            END-READ.                                                    
006653       ******************************************************************
006654       * DISPLAY FILE STATUS AND CLOSE THE FILE.                         
006660       ******************************************************************
006700        30000-CLOSE-PARA.                                                
006800            DISPLAY  WS-INPUT-FILE-FS.                                   
006810            DISPLAY WS-OUTPUT-FILE-FS.                                   
006820            MOVE WS-HEADER1 TO FS-OUTPUT-REC.                            
006830                         WRITE FS-OUTPUT-REC.                            
006900            CLOSE  INPUT-FILE.                                           
007000            CLOSE OUTPUT-FILE.                                           
****** **************************** Bottom of Data ****************************