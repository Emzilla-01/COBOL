000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM503.                                              
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * WRITE A PROGRAM TO TAKE IN THE ROLL NO, NAME, MARKS OF ENGLISH, 
000331       * MATHEMATICS, HINDI AND SCIENCE. ALL THE MARKS ARE OUT OF 100.   
000334       * A = 75-100, B = 50-74, C = 0-50                                 
000335       *                                                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/18/2016     PROGRAM CREATED                
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000510        01 WS-REPORT-CARD.                                               
000600          02 WS-NAME PIC X(10).                                          
000700          02 WS-ID PIC X(3).                                             
000701          02 WS-ENG PIC 9(3).                                            
000702          02 WS-ENG-GR PIC A.                                            
000703          02 WS-HIN PIC 9(3).                                            
000704          02 WS-HIN-GR PIC A.                                            
000705          02 WS-MAT PIC 9(3).                                            
000706          02 WS-MAT-GR PIC A.                                            
000707          02 WS-SCI PIC 9(3).                                            
000708          02 WS-SCI-GR PIC A.                                            
000709        01 WS-BORDER PIC X(10) VALUE "**********".                       
000710        01 WS-GRADER PIC 9(3).                                           
000720          88 CND-A VALUES 075 THRU 100.                                  
000730          88 CND-B VALUES 050 THRU 074.                                  
000740          88 CND-C VALUES 000 THRU 050.                                  
000800        PROCEDURE DIVISION.                                              
000900        ACCEPT-PARA.                                                     
001000            ACCEPT WS-NAME.                                              
001100            ACCEPT WS-ID.                                                
001110            ACCEPT WS-ENG.                                               
001120            ACCEPT WS-HIN.                                               
001130            ACCEPT WS-MAT.                                               
001140            ACCEPT WS-SCI.                                               
001200        ENG-PARA.                                                        
001300            MOVE WS-ENG TO WS-GRADER.                                    
001400            EVALUATE TRUE                                                
001500            WHEN CND-A MOVE "A" TO WS-ENG-GR                             
001600            WHEN CND-B MOVE "B" TO WS-ENG-GR                             
001700            WHEN CND-C MOVE "C" TO WS-ENG-GR                             
001800            END-EVALUATE.                                                
001801        HIN-PARA.                                                        
001802            MOVE WS-HIN TO WS-GRADER.                                    
001803            EVALUATE TRUE                                                
001804            WHEN CND-A MOVE "A" TO WS-HIN-GR                             
001805            WHEN CND-B MOVE "B" TO WS-HIN-GR                             
001806            WHEN CND-C MOVE "C" TO WS-HIN-GR                             
001807            END-EVALUATE.                                                
001808        MAT-PARA.                                                        
001809            MOVE WS-MAT TO WS-GRADER.                                    
001810            EVALUATE TRUE                                                
001811            WHEN CND-A MOVE "A" TO WS-MAT-GR                             
001812            WHEN CND-B MOVE "B" TO WS-MAT-GR                             
001813            WHEN CND-C MOVE "C" TO WS-MAT-GR                             
001814            END-EVALUATE.                                                
001815        SCI-PARA.                                                        
001816            MOVE WS-SCI TO WS-GRADER.                                    
001817            EVALUATE TRUE                                                
001818            WHEN CND-A MOVE "A" TO WS-SCI-GR                             
001819            WHEN CND-B MOVE "B" TO WS-SCI-GR                             
001820            WHEN CND-C MOVE "C" TO WS-SCI-GR                             
001821            END-EVALUATE.                                                
001822        DISPLAY-PARA.                                                    
001823            DISPLAY "HELLO, " WS-NAME ".".                               
001824            DISPLAY "MARKS OBTAINED FOR ROLL NO. " WS-ID ".".            
001840            DISPLAY WS-BORDER, WS-BORDER.                                
001850            DISPLAY "ENGLISH : " WS-ENG " : " WS-ENG-GR.                 
001860            DISPLAY "HINDI   : " WS-HIN " : " WS-HIN-GR.                 
001861            DISPLAY "MATHS   : " WS-MAT " : " WS-MAT-GR.                 
001870            DISPLAY "SCIENCE : " WS-SCI " : " WS-SCI-GR.                 
001880            DISPLAY WS-BORDER, WS-BORDER.                                
001900            STOP RUN.                                                    