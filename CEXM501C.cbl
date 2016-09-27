000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM501C.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * TO DETERMINE WHETHER A GIVEN NUMBER IS ODD OR EVEN.             
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/18/2016     PROGRAM CREATED                
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-A PIC 99.                                                  
000700        01 WS-REMAINDER PIC 99.                                          
000710        01 WS-QUO PIC 9.                                                 
000800        PROCEDURE DIVISION.                                              
000900        ACCEPT-PARA.                                                     
001100            ACCEPT WS-A.                                                 
001200        MAIN-PARA.                                                       
001300            DIVIDE WS-A BY 2 GIVING WS-QUO REMAINDER WS-REMAINDER.       
001310            IF WS-REMAINDER = 0                                          
001400              DISPLAY WS-A " IS EVEN."                                   
001500            ELSE DISPLAY WS-A " IS ODD.".                                
001600            STOP RUN.                                                    