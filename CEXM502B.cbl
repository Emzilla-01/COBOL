000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM502B.                                            
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * WRITE A PROGRAM TO CATEGORIZE AS CHILD/TEEN/ADULT/SENIOR BASED  
000331       * BASED ON AGE USING EVALUATE STATEMENT.                          
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/18/2016     PROGRAM CREATED                
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-AGE PIC  99.                                               
000700          88 CND-CHILD VALUES  00 THRU  12.                              
000710          88 CND-TEEN VALUES  13 THRU  19.                               
000720          88 CND-ADULT VALUES  20 THRU  65.                              
000730          88 CND-SENIOR VALUES  65 THRU  99.                             
000800        PROCEDURE DIVISION.                                              
000900        ACCEPT-PARA.                                                     
001100            ACCEPT WS-AGE.                                               
001200        MAIN-PARA.                                                       
001300            EVALUATE TRUE                                                
001301              WHEN CND-CHILD                                             
001310                DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE A CHILD."       
001320              WHEN CND-TEEN                                              
001410                DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE A TEEN."        
001420              WHEN CND-ADULT                                             
001440                DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE AN ADULT."      
001450              WHEN CND-SENIOR                                            
001470                DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE A SENIOR."      
001471            END-EVALUATE.                                                
001480            STOP RUN.                                            