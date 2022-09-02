000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM8S1.                                             
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
000402        01 WS-DESCRIPTION.                                               
000403          05 WS-DATE1                               VALUE '20140831'.    
000404            10 WS-YEAR                  PIC X(04).                       
000405            10 WS-MONTH                 PIC X(02).                       
000406            10 WS-DATE                  PIC X(02).                       
000407          05 WS-DATE2                   REDEFINES WS-DATE1               
000408                                        PIC 9(8).                        
000800        PROCEDURE DIVISION.                                              
000801       * DISPLAY ORIGINAL AND RENAMED DATA ITEM.                         
000810        00000-MAIN-PARA.                                                 
000900            DISPLAY "WS-DATE1 : " WS-DATE1.                              
001000            DISPLAY "WS-DATE2 : " WS-DATE2.                              
002000            STOP RUN.                                                    