000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM502A.                                            
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * WRITE A PROGRAM TO CATEGORIZE AS CHILD/TEEN/ADULT/SENIOR BASED  
000331       * BASED ON AGE.                                                   
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
001300            IF CND-CHILD                                                 
001310              DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE A CHILD."         
001320            ELSE                                                         
001400              IF CND-TEEN                                                
001410                DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE A TEEN."        
001420              ELSE                                                       
001430                IF CND-ADULT                                             
001440                  DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE AN ADULT."    
001450                ELSE                                                     
001460                  IF CND-SENIOR                                          
001470                  DISPLAY "YOUR AGE IS " WS-AGE ". YOU ARE A SENIOR.".   
001500            STOP RUN.                                                    