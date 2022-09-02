000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. STREX02.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST THE FUNCTIONALITY OF UNSTRING.           
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY    08/09/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01  WS-STRING                      PIC A(30)                     
000403            VALUE 'WELCOME TO USTGLOBAL'.                                
000405        01  WS-STR1                        PIC A(07).                    
000406        01  WS-STR2                        PIC A(02).                    
000407        01  WS-STR3                        PIC A(15).                    
000800        PROCEDURE DIVISION.                                              
000900            UNSTRING WS-STRING DELIMITED BY SPACE                        
001000              INTO WS-STR1, WS-STR2, WS-STR3                             
001100            END-UNSTRING.                                                
001200            DISPLAY 'WS-STR1 : ' WS-STR1.                                
001300            DISPLAY 'WS-STR2 : ' WS-STR2.                                
001400            DISPLAY 'WS-STR3 : ' WS-STR3.                                
001500            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************