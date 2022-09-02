000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM505.                                              
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * TO ASSIST THE ELECTRA MODELING COMPANY WITH SELECTING MODELS.   
000331       * LOOKING FOR ...                                                 
000332       *  MALE MODELS, BLONDE HAIR, BLUE EYES, OVER 6', 185-200LBS.      
000333       * FEMALE MODELS, BROWN HAIR, BROWN EYES, OVER 5', 110-125LBS.     
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/18/2016     PROGRAM CREATED                
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-NAME PIC X(10).                                            
000750        01 CND-GENDER PIC X.                                             
000760          88 CND-M VALUE "M".                                            
000770          88 CND-F VALUE "F".                                            
000780          88 CND-O VALUE "O".                                            
000790        01 CND-HAIR PIC X(3).                                            
000791          88 CND-HBLN VALUE "BLN".                                       
000792          88 CND-HBRN VALUE "BRN".                                       
000793          88 CND-HBLK VALUE "BLK".                                       
000794        01 CND-EYES PIC X(3).                                            
000795          88 CND-EBLU VALUE "BLU".                                       
000796          88 CND-EBRN VALUE "BRN".                                       
000797          88 CND-EHZL VALUE "HZL".                                       
000798        01 CND-HEIGHT PIC 9V9.                                           
000799          88 CND-HEIGHT-M VALUES 6 THRU 9.9.                             
000800          88 CND-HEIGHT-F VALUES 5 THRU 9.9.                             
000801        01 CND-WEIGHT PIC 9(3).  
 000802          88 CND-WEIGHT-M VALUES 185 THRU 200.                           
 000803          88 CND-WEIGHT-F VALUES 110 THRU 125.                           
 000810        PROCEDURE DIVISION.                                              
 001140        ACCEPT-PARA.                                                     
 001150            ACCEPT WS-NAME.                                              
 001151            ACCEPT CND-GENDER.                                           
 001160            ACCEPT CND-HAIR.                                             
 001170            ACCEPT CND-EYES.                                             
 001180            ACCEPT CND-HEIGHT.                                           
 001190            ACCEPT CND-WEIGHT.                                           
 001200        MALE-PARA.                                                       
 001300            EVALUATE TRUE                                                
 001400              WHEN CND-M                                                 
 001410              AND CND-HBLN                                               
 001420              AND CND-EBLU                                               
 001500              AND CND-HEIGHT-M                                           
 001600              AND CND-WEIGHT > 185                                       
 001700              AND CND-WEIGHT < 200                                       
001800            DISPLAY "FOUND " WS-NAME ", POSSIBLE MATCH FOR MALE MODEL "  
001801              WHEN OTHER DISPLAY "NO MATCH FOUND FOR MALE MODEL.".       
001810        FEMALE-PARA.                                                     
001820            EVALUATE TRUE                                                
001830              WHEN CND-F                                                 
001840              AND CND-HBRN                                               
001850              AND CND-EBRN                                               
001860              AND CND-HEIGHT-F                                           
001870              AND CND-WEIGHT > 110                                       
001880              AND CND-WEIGHT < 125                                       
001890            DISPLAY "FOUND " WS-NAME ", POSSIBLE MATCH FOR FEMALE MODEL."
001891              WHEN OTHER DISPLAY "NO MATCH FOUND FOR FEMALE MODEL.".     
001900            STOP RUN.                                                     