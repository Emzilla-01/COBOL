000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. SPGM1001.                                            
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: ACCEPT TWO NUMBERS FROM SYSIN.                   
000330       *  SEND THESE VALUES TO A SUBORDINATE PROGRAM.                    
000331       *  CALCULATE SOME VALUES AND DISPLAY IN SPOOL VIA SUB-PGM.        
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     08/09/2016     PROGRAM CREATED               
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01 WS-SUM                       PIC 9(03).                       
000403        LINKAGE SECTION.                                                 
000404        01 LS-NUM1                      PIC 9(03).                       
000405        01 LS-NUM2                      PIC 9(03).                       
000800        PROCEDURE DIVISION USING LS-NUM1, LS-NUM2.                       
000900            ADD LS-NUM1 TO LS-NUM2      GIVING WS-SUM.                   
001000            DISPLAY LS-NUM1 " + " LS-NUM2 " = " WS-SUM.                  
001100            EXIT PROGRAM.                                                
****** **************************** Bottom of Data ****************************