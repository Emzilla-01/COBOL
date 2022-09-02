000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. STREX03.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST THE FUNCTIONALITY OF INSPECT.            
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY    08/09/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01  WS-CNT1 PIC 9(02) VALUE 0.                                   
000405        01  WS-CNT2 PIC 9(02) VALUE 0.                                   
000406        01  WS-STRING1 PIC A(15) VALUE 'ABCDACDADEAAAFF'.                
000800        PROCEDURE DIVISION.                                              
000810            DISPLAY "WS-STRING1, : " WS-STRING1.                         
000900            INSPECT WS-STRING1 TALLYING WS-CNT1 FOR CHARACTERS.          
001000            DISPLAY "WS-CNT1, TOTAL CHARACTERS : " WS-CNT1.              
001100            INSPECT WS-STRING1 TALLYING WS-CNT2 FOR ALL 'A'.             
001200            DISPLAY "WS-CNT2, TOTAL 'A'S : " WS-CNT2.                    
001300            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************