000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM501A.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * TO DETERMINE THE GREATER OF TWO NUMBERS.                        
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/18/2016     PROGRAM CREATED                
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-A PIC 99.                                                  
000700        01 WS-B PIC 99. 
000800        PROCEDURE DIVISION.                                              
000900        ACCEPT-PARA.                                                     
001000            ACCEPT WS-A.                                                 
001100            ACCEPT WS-B.                                                 
001200        MAIN-PARA.                                                       
001300            IF WS-A > WS-B                                               
001400              DISPLAY WS-A " IS GREATER THAN " WS-B                      
001500            ELSE                                                         
001600              IF WS-A = WS-B                                             
001700                DISPLAY WS-A " IS EQUAL TO " WS-B                        
001800              ELSE                                                       
001900                DISPLAY WS-B " IS GREATER THAN " WS-A.                   
002000            STOP RUN.                                                                                                     