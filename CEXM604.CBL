000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM604.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO PRINT A NAME N NUMBER OF TIMES,               
000330       * WHERE N IS USER-DEFINED.                                        
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/20/2016     PROGRAM CREATED                
000361       * JEBA02    EMY     7/21/2016     APPLIED CODING STANDARDS.      
000362       * JEBA02    EMY     7/22/2016     INCREASED BYTES OF WS-NAME.    
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000510        01  WS-NAME                     PIC X(20).                       
000520        01  WS-LIMIT                    PIC 9(03).                       
000600        01  WS-COUNTER                  PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000801        00000-MAIN-PARA.                                                 
000802            PERFORM 10000-ACCEPT-PARA.                                   
000803            PERFORM 20000-DISPLAY-PARA                                   
000804                UNTIL WS-COUNTER        >= WS-LIMIT.                     
000805            STOP RUN.                                                    
000810        10000-ACCEPT-PARA.                                               
000811            ACCEPT WS-NAME.                                              
000820            ACCEPT WS-LIMIT.                                             
001200        20000-DISPLAY-PARA.                                              
001210            ADD 1 TO WS-COUNTER.                                         
001300            DISPLAY WS-COUNTER " : " WS-NAME.                            