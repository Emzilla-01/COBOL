000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. STREX01.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST THE FUNCTIONALITY OF STRING HANDLING.    
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY    08/09/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01  WS-STRING                      PIC A(30).                    
000403        01  ws-string2                     pic x(30).                    
000404        01  WS-STR1                        PIC A(15) VALUE 'USTGLOBAL'.  
000405        01  WS-STR2                        PIC A(07) VALUE 'Welcome'.    
000406        01  WS-STR3                        pic a(07) value 'To AND'.     
000407        01  ws-count                       pic 9(02) value 1.            
000800        PROCEDURE DIVISION.                                              
000900            string ws-str2 delimited by size                             
001000                   ws-str3 delimited by space                            
001100                   ws-str1 delimited by size                             
001200            into   ws-string                                             
001300            with pointer  ws-count                                       
001400            end-string.                                                  
001500            display 'ws-string : ' ws-string.                            
001600            move ws-string(10:3) TO WS-STRING2.                          
001700            display 'ws-string2 : ' ws-string2.                          
001800            move '-'             to ws-string2(4:).                      
001900            display 'ws-string2 : ' ws-string2.                          
001910            move ws-str1(4:)     to ws-string2(5:).                      
001920            display 'ws-string2 : ' ws-string2.                          
001930            display ws-string2(3:3).                                     
002000            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************