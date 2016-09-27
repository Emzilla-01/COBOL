000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM1002.                                            
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: SILICON VALLEY MFG WANTS AN EMPLOYEE LISTING     
000330       *   THAT INCLUDES EACH EMPLOYEE'S NAME, DEPT NUMBER, & DEPT NAME. 
000331       * DEPT DETAILS ARE IN INPUT FILE.                                 
000332       * READ THE INPUT DATA INTO A SEARCHABLE TABLE.                    
000333       *                                                                 
000334       * INPUT  : JEBA02.***REMOVED***.COBOL.EMPIN                                
000335       * OUTPUT : JEBA02.***REMOVED***.COBOL.CEXM1002                             
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***    08/09/2016     PROGRAM CREATED                
000368       * JEBA02    ***REMOVED***    08/10/2016     PROGRAM UPDATED                
000370       ******************************************************************
000380        ENVIRONMENT DIVISION.                                            
000390        INPUT-OUTPUT SECTION.                                            
000391        FILE-CONTROL.                                                    
000392            SELECT INFILE                                                
000393            ASSIGN TO INFILE                                             
000394            ORGANIZATION IS SEQUENTIAL                                   
000395            ACCESS MODE IS SEQUENTIAL                                    
000396            FILE STATUS IS WS-INFILE-FS.                                 
000397            SELECT OUTFILE                                               
000398            ASSIGN TO OUTFILE                                            
000399            ORGANIZATION IS SEQUENTIAL                                   
000400            ACCESS MODE IS SEQUENTIAL                                    
000401            FILE STATUS IS WS-OUTFILE-FS.                                
000402        DATA DIVISION.                                                   
000403        FILE SECTION.                                                    
000404        FD INFILE.                                                       
000405        01  FS-EMPLOYEE-FILE.                                            
000406            02  FS-EMPNO                PIC X(04).                       
000407            02  FS-EMPNAME              PIC X(20).                       
000408            02  FS-EMPSAL               PIC 9(05).                       
000409            02  FS-DEPTNO               PIC 9(02).                       
000410            02  FS-DOJ                  PIC X(08).                       
000411        FD  OUTFILE.                                                     
000412        01  FS-OUTPUT                   PIC X(80).                       
000413        WORKING-STORAGE SECTION.                                         
000414        01  WS-CTR                      PIC 9(02).                       
000415        01  WS-ERROR-FLAG               PIC X(03).                       
000416        01  WS-ENDOFFILE                PIC X(03).                       
000417        01  WS-INFILE-FS                PIC X(02).                       
000418        01  WS-OUTFILE-FS               PIC X(02).                       
000419        01  WS-EMPLOYEE-FILE            OCCURS 99 TIMES.                 
000420            02  WS-EMPNO                PIC X(04).                       
000421            02  WS-EMPNAME              PIC X(20).                       
000422            02  WS-EMPSAL               PIC 9(05).                       
000423            02  WS-DEPTNO               PIC 9(02).                       
000424            02  WS-DOJ                  PIC X(08).                       
000425       *    02  WS-DEPTNAME             PIC X(15).                       
000426        01  WS-OUTPUT-REC                                                
000427            02  WS-EMPNAME-R            PIC X(20).                       
000428            02  WS-DEPTNO-R             PIC 9(02).                       
000429            02  WS-DEPTNAME-R           PIC X(15).                       
000430        01  WS-DEPT-CND                 PIC 9(02).                       
000431            88  CND-HR                  VALUES 66.                       
000432            88  CND-MARKETING           VALUES 67.                       
000433            88  CND-ACCOUNTS            VALUES 68.                       
000434            88  CND-EXEC                VALUES 69.                       
000440            88  CND-OPS                 VALUES 70.                       
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-INIT-PARA.                                     
001100            PERFORM 20000-PROCESS-PARA                                   
001200              UNTIL WS-ENDOFFILE  = "YES"                                
001300                 OR WS-ERROR-FLAG = "YES".                               
001400            PERFORM 30000-CLOSE-PARA.                                    
002000            STOP RUN.                                                    
002100        10000-INIT-PARA.                                                 
002200            OPEN INPUT INFILE.                                           
002300            IF  WS-INFILE-FS            = "00"                           
002400                DISPLAY                 "INFILE ACCESSED SUCCESSFULLY."  
002500                OPEN OUTPUT OUTFILE                                      
002600                    IF  WS-OUTFILE-FS   = "00"                           
002700                        DISPLAY         "OUTFILE ACCESSED SUCCESSFULLY." 
002800                    ELSE                                                 
002900                        MOVE "YES"      TO WS-ERROR-FLAG                 
003000                        DISPLAY         "OUTFILE ACCESS ERROR."          
003010                    END-IF                                               
003100            ELSE                                                         
003200                MOVE "YES"              TO WS-ERROR-FLAG                 
003300                DISPLAY                 "INFILE ACCESS ERROR."           
003400            END-IF.                                                      
003500        20000-PROCESS-PARA.                                              
003510            ADD 1 TO WS-CTR.                                             
003600            READ INFILE.                                                 
003610            MOVE FS-EMPLOYEE-FILE       TO WS-EMPLOYEE-FILE(WS-CTR)      
003700            MOVE FS-DEPTNO              TO WS-DEPT-CND.                  
003800            EVALUATE TRUE                                                
003900                WHILE CND-HR                                             
004000                MOVE "HUMAN RESOURCES"  TO WS-DEPTNAME                   
004100                WHILE CND-MARKETING                                      
004200                MOVE "MARKETING"        TO WS-DEPTNAME                   
004300                WHILE CND-ACCOUNTS                                       
004400                MOVE "ACCOUNTING"       TO WS-DEPTNAME                   
004500                WHILE CND-EXEC                                           
004600                MOVE "EXECUTIVE"        TO WS-DEPTNAME                   
004700                WHILE CND-OPS                                            
004800                MOVE "OPERATIONS"       TO WS-DEPTNAME                   
004900            END-EVALUATE.                                                
****** **************************** Bottom of Data ****************************
