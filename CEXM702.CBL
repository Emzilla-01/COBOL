000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM702.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * WRITE A PROGRAM TO STORE 12 TEMPERATURES OF THE DAY. DISPLAY AVG
000331       * OF THE DAY.                                                     
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/25/2016      PROGRAM CREATED               
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-DAY.                                                       
000700          02 WS-TEMP                    PIC 9(02)   OCCURS 12 TIMES.     
000710        01 WS-COUNT                     PIC 9(02).                       
000720        01 WS-TEMP-AVG                  PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000810        00000-MAIN-PARA.                                                 
000811            PERFORM 10000-ACCEPT-PARA                                    
000812                UNTIL WS-COUNT          >= 12.                           
000813            MOVE 0 TO WS-COUNT.                                          
000814            PERFORM 20000-TTL-PARA                                       
000815                UNTIL WS-COUNT          >= 12.                           
000816            DIVIDE WS-TEMP-AVG BY 12 GIVING WS-TEMP-AVG.                 
000817            MOVE 0 TO WS-COUNT.                                          
000818            PERFORM 30000-DISPLAY-PARA                                   
000819                UNTIL WS-COUNT          >= 12.                           
000820            DISPLAY "AVERAGE TEMPERATURE IS: " WS-TEMP-AVG "F".          
000821            STOP RUN.                                                    
000830        10000-ACCEPT-PARA.                                               
001300            ADD 1 TO WS-COUNT.                                           
001400            ACCEPT WS-TEMP(WS-COUNT).                                    
001510        20000-TTL-PARA.                                                  
001511            ADD 1 TO WS-COUNT.                                           
001520            ADD WS-TEMP(WS-COUNT) TO WS-TEMP-AVG.                        
001530        30000-DISPLAY-PARA.                                              
001531            ADD 1 TO WS-COUNT.                                           
001540            DISPLAY "READING # " WS-COUNT " : "  WS-TEMP(WS-COUNT) "F".  