000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM9S3.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST FUNCTIONALITY OF REPORT CREATION.        
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     8-4-2016      PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000380        ENVIRONMENT DIVISION.                                            
000390        INPUT-OUTPUT SECTION.                                            
000391        FILE-CONTROL.                                                    
000392            SELECT INPUT-FILE                                            
000393            ASSIGN TO INFILE                                             
000394            ORGANIZATION IS SEQUENTIAL                                   
000395            ACCESS MODE IS SEQUENTIAL                                    
000396            FILE STATUS IS WS-INPUT-FS.                                  
000397      *                                                                  
000398            SELECT OUTPUT-FILE                                           
000399            ASSIGN TO OUTFILE                                            
000400            ORGANIZATION IS SEQUENTIAL                                   
000401            ACCESS MODE IS SEQUENTIAL                                    
000402            FILE STATUS IS WS-OUTPUT-FS.                                 
000403        DATA DIVISION.                                                   
000404        FILE SECTION.                                                    
000405        FD  INPUT-FILE.                                                  
000406        01  FS-CREW-DATA-I.                                              
000407            02 FS-NAME-I                PIC X(20).                       
000408            02 FS-CLASS-I               PIC X(10).                       
000409            02 FS-SPECIES-I             PIC X(10).                       
000410            02 FS-PURSE-I               PIC 9(10).                       
000411            02 FS-LEVEL-I               PIC 9(02).                       
000412            02 FILLER                   PIC X(28).                       
000413        FD  OUTPUT-FILE.                                                 
000414        01  FS-RECORD-O                 PIC X(80).                       
000420        WORKING-STORAGE SECTION.                                         
000421        01  WS-HEADER1.                                                  
000422            02 FILLER                   PIC X(10)   VALUE ALL "*".       
000423            02 FILLER                   PIC X(10)   VALUE ALL SPACES.    
000424            02 FILLER                   PIC X(12)   VALUE "CREW  REPORT".
000425            02 FILLER                   PIC X(10)   VALUE ALL SPACES.    
000426            02 FILLER                   PIC X(10)   VALUE ALL "*".       
000430        01  WS-HEADER2.                                                  
000431            02 FILLER                   PIC X(01)   VALUE "|".           
000432            02 FILLER                   PIC X(04)   VALUE "NAME".        
000433            02 FILLER                   PIC X(14)   VALUE ALL SPACES.    
000434            02 FILLER                   PIC X(01)   VALUE "|".           
000435            02 FILLER                   PIC X(05)   VALUE "CLASS".       
000436            02 FILLER                   PIC X(04)   VALUE ALL SPACES.    
000438            02 FILLER                   PIC X(01)   VALUE "|".           
000439            02 FILLER                   PIC X(09)   VALUE "SPECIES".     
000440            02 FILLER                   PIC X(01)   VALUE "|".           
000441            02 FILLER                   PIC X(09)   VALUE "$CASH".       
000442            02 FILLER                   PIC X(01)   VALUE "|".           
000443            02 FILLER                   PIC X(03)   VALUE "LVL".         
000444            02 FILLER                   PIC X(01)   VALUE "|".           
000450        01  WS-HEADER3                  PIC X(54)   VALUE ALL "~-".      
000460       *01  WS-CREW-DATA.                                                
000470       *    02 WS-NAME                  PIC X(20).                       
000480       *    02 WS-CLASS                 PIC X(10).                       
000490       *    02 WS-SPECIES               PIC X(10).                       
000500       *    02 WS-PURSE                 PIC 9(10).                       
000600       *    02 WS-LEVEL                 PIC 9(02).                       
000700        01  WS-INPUT-FS                 PIC X(02).                       
000710        01  WS-OUTPUT-FS                PIC X(02).                       
000720        01  WS-ERROR-FLAG               PIC X(03).                       
000730        01  WS-ENDOFFILE                PIC X(03).                       
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
000910            PERFORM 10000-INIT-PARA.                                     
000920            PERFORM 20000-PROCESS-PARA                                   
000930                UNTIL WS-ENDOFFILE =    "YES"                            
000940                OR   WS-ERROR-FLAG =    "YES".                           
000950            PERFORM 30000-CLOSE-PARA.                                    
000960            STOP RUN.                                                    
001000        10000-INIT-PARA.                                                 
001010            OPEN INPUT INPUT-FILE.                                       
001020            IF WS-INPUT-FS           IS NOT = "00"                       
001021                    MOVE "YES"          TO WS-ERROR-FLAG                 
001022                    DISPLAY "ERROR IN OPENING INPUT FILE."               
001030            ELSE    OPEN OUTPUT OUTPUT-FILE                              
001040                IF WS-OUTPUT-FS      IS NOT = "00"                       
001050                    MOVE "YES"          TO WS-ERROR-FLAG                 
001051                    DISPLAY "ERROR IN OPENING OUTPUT FILE."              
001060            END-IF.                                                      
001061            MOVE WS-HEADER3 TO FS-RECORD-O.                              
001062                 WRITE FS-RECORD-O.                                      
001063            MOVE WS-HEADER1 TO FS-RECORD-O.                              
001064                 WRITE FS-RECORD-O.                                      
001070            MOVE WS-HEADER3 TO FS-RECORD-O.                              
001080                 WRITE FS-RECORD-O.                                      
001090            MOVE WS-HEADER2 TO FS-RECORD-O.                              
001091                 WRITE FS-RECORD-O.                                      
001092        20000-PROCESS-PARA.                                              
001094                 READ INPUT-FILE                                         
001095                 AT END MOVE "YES" TO WS-ENDOFFILE                       
001096                 NOT AT END                                              
001097                     MOVE FS-CREW-DATA-I  TO FS-RECORD-O                 
001098                     WRITE FS-RECORD-O.                                  
001200        30000-CLOSE-PARA.                                                
001210            DISPLAY "INPUT FILE STATUS :" WS-INPUT-FS.                   
001220            DISPLAY "OUTPUT FILE STATUS:" WS-OUTPUT-FS.                  
001230            DISPLAY "ERROR FLAG        :" WS-ERROR-FLAG                  
001300            MOVE WS-HEADER3 TO FS-RECORD-O.                              
001400            WRITE FS-RECORD-O.                                           
001500            CLOSE INPUT-FILE.                                            
001600            CLOSE OUTPUT-FILE.                                           
