000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXSAM4.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST THE SEARCH FUNCTION.                     
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/29/2016      PROGRAM CREATED               
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01 WS-TABLE.                                                     
000403           05 WS-A PIC X(1) OCCURS 18 TIMES INDEXED BY I.                
000404           01 WS-SRCH PIC A(1) VALUE 'M'.                                
000800        PROCEDURE DIVISION.                                              
000900            MOVE 'ABCDEFGHIJKLMNOPQR' TO WS-TABLE.                       
001000            SET I TO 1.                                                  
001100            SEARCH WS-A                                                  
001200                   AT END DISPLAY 'M NOT FOUND IN TABLE'                 
001300                   WHEN WS-A(I) = WS-SRCH                                
001400                   DISPLAY 'LETTER M FOUND IN TABLE'                     
001410       *    HOW CAN WE GET THE POSITION AT WHICH THE QUERY IS FOUND?     
001500            END-SEARCH.                                                  
001600            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************