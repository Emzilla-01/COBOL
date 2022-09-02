000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM601.                                              
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO DISPLAY                       
000330       * THE SERIES 1, 3, 5, 7, 9, 11....                                
000331       * ... WHILE COMPLYING WITH CODING STANDARDS.                      
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/20/2016     PROGRAM CREATED                
000361       * JEBA02    EMY     7/21/2016     REFINED STRUCTURE AND ...      
000362       *                                  - APPLIED CODING STANDARDS.    
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01  WS-COUNTER                  PIC 9(03)   VALUE 1.             
000700        01  WS-LIMIT                    PIC 9(03).                       
000710        01  WS-ITERS                    PIC 9(03)   VALUE 0.             
000800        PROCEDURE DIVISION.                                              
000801        00000-MAIN-PARA.                                                 
000802            PERFORM 10000-ACCEPT-PARA.                                   
000803            PERFORM 20000-LOOP-PARA                                      
000805                UNTIL WS-COUNTER        > WS-LIMIT.                      
000806            STOP RUN.                                                    
000810        10000-ACCEPT-PARA.                                               
000820            ACCEPT WS-LIMIT.                                             
001200        20000-LOOP-PARA.                                                 
001210            ADD 1 TO WS-ITERS.                                           
001300            DISPLAY "ITERATION " WS-ITERS " : VALUE " WS-COUNTER.        
001400            ADD 2 TO WS-COUNTER.                                         