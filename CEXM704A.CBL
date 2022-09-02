000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM704A.                                            
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO ACCEPT EMPLOYEE NUMBERS       
000321       *  AND NAMES THROUGH SYSIN - LOAD THESE VALUES INTO               
000322       *  AN INDEXED TABLE. SEND EMPLOYEE # VIA SYSIN                    
000330       *  AND DISPLAY THE EMPLOYEE NAME IN SPOOL.                        
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY    7/25/2016       PROGRAM CREATED.              
000361       * JEBA02    EMY    7/26/2016       PROGRAM EDITED FOR FUNCTION.  
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-DEC.                                                       
000700          02 WS-TABLE              OCCURS 6 TIMES                        
000702                                     INDEXED BY I.                       
000703            03 WS-NUM                   PIC X(03).                       
000704            03 WS-NAME                  PIC X(20).                       
000706        01 WS-COUNT                     PIC 9(03) VALUE 1.               
000707        01 WS-QUERY                     PIC X(03).                       
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
000910            PERFORM 10000-ACCEPT-PARA                                    
000920              UNTIL WS-COUNT            = 7.                             
000921              INITIALIZE WS-COUNT.                                       
000930            ACCEPT WS-QUERY.                                             
000950            PERFORM 20000-SEARCH-PARA.                                   
000952            PERFORM 30000-DISPLAY-PARA                                   
000953              UNTIL WS-COUNT            = 7.                             
000960            STOP RUN.                                                    
001000        10000-ACCEPT-PARA.                                               
001020            ACCEPT WS-NUM(WS-COUNT).                                     
001030            ACCEPT WS-NAME(WS-COUNT).                                    
001040            ADD 1 TO WS-COUNT.                                           
001100        20000-SEARCH-PARA.                                               
001110            SET I TO 1.                                                  
001200            SEARCH WS-TABLE                                              
001300                AT END DISPLAY "# NOT FOUND."                            
001400            WHEN WS-NUM(I) = WS-QUERY                                    
001410            DISPLAY "FOUND " WS-NUM(I) " : " WS-NAME(I)                  
001420            END-SEARCH.                                                  
001430        30000-DISPLAY-PARA.                                              
001440            DISPLAY WS-NUM(WS-COUNT) " : " WS-NAME(WS-COUNT).            
001450            ADD 1 TO WS-COUNT.                                           