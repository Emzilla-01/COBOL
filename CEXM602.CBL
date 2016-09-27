000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM602.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO DISPLAY THE EVEN NUMBERS BETWEEN 2-100.       
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/20/2016     PROGRAM CREATED                
000361       * JEBA02    ***REMOVED***     7/21/2016     REFINED STRUCTURE,             
000362       *                                  APPLIED CODING STANDARDS.      
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01  WS-COUNTER                  PIC 9(03)   VALUE 000.           000700        01  WS-MOD                      PIC 9(03).                       
000710        01  WS-BLANK                    PIC 9(03).                       
000720        01  WS-LIMIT                    PIC 9(03)   VALUE 000.           
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-EVEN-PARA                                      
001100                UNTIL WS-LIMIT            >= 100.                        
001110            STOP RUN.                                                    
001200        10000-EVEN-PARA.                                                 
001210            ADD 1 TO WS-LIMIT.                                           
001300            ADD 1 TO WS-COUNTER.                                         
001400            DIVIDE WS-COUNTER BY 2 GIVING WS-BLANK REMAINDER WS-MOD.     
001500            IF WS-MOD = 0                                                
001600                 DISPLAY WS-COUNTER.                                     