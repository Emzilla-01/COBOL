000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXSAM2.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST TABLE FUNCTIONALITY.                     
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY    7/26/2016       PROGRAM CREATED               
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-TABLE.                                                     
000800          05 WS-A PIC A(10) OCCURS 5 TIMES.                              
000900        PROCEDURE DIVISION.                                              
001000        00000-MAIN-PARA.                                                 
001010            ACCEPT WS-A(1).                                              
001100            DISPLAY "ONE-D TABLE : " WS-TABLE.                           
001200            STOP RUN.                                                    