000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM501D.                                            
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * TO DETERMINE WHETHER A GIVEN NUMBER IS POSITIVE OR NEGATIVE.    
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/18/2016     PROGRAM CREATED                
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-A PIC S999 VALUE -99.                                      
000700        01 DS-A PIC -ZZZ.                                                
000800        PROCEDURE DIVISION.                                              
000900        ACCEPT-PARA.                                                     
001100            MOVE WS-A TO DS-A.                                           
001200        MAIN-PARA.                                                       
001300            IF WS-A < 0                                                  
001400              DISPLAY DS-A " IS NEGATIVE."                               
001500            ELSE                                                         
001600              IF WS-A > 0                                                
001700                DISPLAY DS-A " IS POSITIVE."                             
001800              ELSE                                                       
001810                DISPLAY DS-A " IS ZERO.".                                
001900            STOP RUN.                                                    