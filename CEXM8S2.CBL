000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM8S2.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST THE FUNCTIONALITY OF REDEFINES.          
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     8/1/2016      PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01  WS-DESCRIPTION.                                              
000403          05  WS-NUM.                                                    
000404            10  WS-NUM1                 PIC 9(02)  VALUE 20.             
000405            10  WS-NUM2                 PIC 9(02)  VALUE 56.             
000407          05  WS-CHAR.                                                   
000408            10  WS-CHAR1                PIC X(02)  VALUE 'AA'.           
000409            10  WS-CHAR2                PIC X(02)  VALUE 'BB'.           
000410          66  WS-NEW                    RENAMES WS-NUM2 THRU WS-CHAR2.   
000800        PROCEDURE DIVISION.                                              
000801       * DISPLAY RENAMED DATA ITEM, DISPLAY ORIGINAL ITEMS.              
000810        00000-MAIN-PARA.                                                 
000900            DISPLAY "WS-NEW : " WS-NEW.                                  
001000            DISPLAY "WS-NUM : " WS-NUM.                                  
001100            DISPLAY "WS-CHAR: " WS-CHAR.                                 
002000            STOP RUN.                                                    