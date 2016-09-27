000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM701.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * WRITE A PROGRAM TO DISPLAY DAYS OF WEEK USING                   
000331       * ONE-DIMENSIONAL ARRAY.                                          
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/25/2016      PROGRAM CREATED               
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-WEEK.                                                      
000700          02 WS-DAY                     PIC X(3)    OCCURS 7 TIMES.      
000710        01 WS-COUNT                     PIC 9(01).                       
000800        PROCEDURE DIVISION.                                              
000810        00000-MAIN-PARA.                                                 
000811            PERFORM 10000-MOVE-PARA.                                     
000812            PERFORM 20000-DISPLAY-PARA  UNTIL WS-COUNT = 7.              
000813            STOP RUN.                                                    
000820        10000-MOVE-PARA.                                                 
000900            MOVE "SUN" TO WS-DAY(1).                                     
001000            MOVE "MON" TO WS-DAY(2).                                     
001100            MOVE "TUE" TO WS-DAY(3).                                     
001200            MOVE "WED" TO WS-DAY(4).                                     
001300            MOVE "THU" TO WS-DAY(5).                                     
001400            MOVE "FRI" TO WS-DAY(6).                                     
001500            MOVE "SAT" TO WS-DAY(7).                                     
001510        20000-DISPLAY-PARA.                                              
001600            ADD 1 TO WS-COUNT.                                           
001700            DISPLAY WS-DAY(WS-COUNT) " : " WS-COUNT.                     
