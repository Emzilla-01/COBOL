000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. STREX04.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO TEST THE FUNCTIONALITY OF INSPECT REPLACING.  
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY    08/09/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000406        01  WS-STRING  PIC A(15) VALUE 'ABCDACDADEAAAFF'.                
000407        01  WS-DATE.                                                     
000408            02 WS-YEAR PIC X(02).                                        
000409            02 WS-MONTH PIC X(02).                                       
000410            02 WS-DAY PIC X(02).                                         
000800        PROCEDURE DIVISION.                                              
000900            DISPLAY "OLD STRING : " WS-STRING                            
001000            INSPECT WS-STRING CONVERTING "ABCD" TO "WXYZ".               
001100            DISPLAY "NEW STRING : " WS-STRING.                           
001110            ACCEPT WS-DATE FROM DATE.                                    
001120            DISPLAY WS-MONTH "/" WS-DAY "/" WS-YEAR.                     
001200            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************