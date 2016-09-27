000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM603.                                              
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO DISPLAY                       
000330       * THE SERIES 1, 5, 9, 13,....                                     
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/20/2016     PROGRAM CREATED                
000361       * JEBA02    ***REMOVED***     7/21/2016     APPLIED CODING STANDARDS       
000362       *                                  & REFINED PROCEDURE.           
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01  WS-COUNTER                  PIC 9(03)   VALUE 001.           
000700        01  WS-LIMIT                    PIC 9(03).                       
000710        01  WS-ITERS                    PIC 9(03)   VALUE 000.           
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
000910            PERFORM 10000-ACCEPT-PARA.                                   
001000            PERFORM 20000-LOOP-PARA                                      
001100                UNTIL WS-COUNTER        > WS-LIMIT.                      
001110            STOP RUN.                                                    
001120        10000-ACCEPT-PARA.                                               
001130            ACCEPT WS-LIMIT.                                             
001200        20000-LOOP-PARA.                                                 
001201            ADD 1 TO WS-ITERS.                                           
001202            DISPLAY "ITERATION " WS-ITERS " : VALUE " WS-COUNTER.        
001210            ADD 4 TO WS-COUNTER.                                         