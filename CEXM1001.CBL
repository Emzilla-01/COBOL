000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM1001.                                            
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: ACCEPT TWO NUMBERS FROM SYSIN.                   
000330       *  SEND THESE VALUES TO A SUBORDINATE PROGRAM.                    
000331       *  CALCULATE SOME VALUES AND DISPLAY IN SPOOL VIA SUB-PGM.        
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     08/09/2016     PROGRAM CREATED               
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01 WS-NUM1                      PIC 9(03).                       
000403        01 WS-NUM2                      PIC 9(03).                       
000404        01 WS-SUM                       PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000900            ACCEPT WS-NUM1.                                              
001000            ACCEPT WS-NUM2.                                              
001010            DISPLAY "MAIN-PGM VALUES...".                                
001020            DISPLAY "WS-NUM1 : " WS-NUM1.                                
001030            DISPLAY "WS-NUM2 : " WS-NUM2.                                
001100            CALL    'SPGM1001'          USING WS-NUM1, WS-NUM2.          
002000            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************
