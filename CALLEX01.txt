000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CALLEX01.                                            
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***    08/09/2016     PROGRAM CREATED                
000368       *                                                                 
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01 WS-STUDENT-ID PIC 9(04) VALUE 1000.                           
000403        01 WS-STUDENT-NAME PIC A(15) VALUE 'TIM'.                        
000800        PROCEDURE DIVISION.                                              
000900            CALL 'UTIL' USING WS-STUDENT-ID, WS-STUDENT-NAME.            
001000            DISPLAY 'STUDENT ID : ' WS-STUDENT-ID.                       
001100            DISPLAY 'STUDENT NAME : ' WS-STUDENT-NAME.                   
002000            STOP RUN.                                                    
****** **************************** Bottom of Data ****************************
