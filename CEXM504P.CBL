000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM504.                                              
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       * TO DETERMINE HOW HOT A GIVEN TEMPERATURE IS.                    
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/18/2016     PROGRAM CREATED                
000361       *                    7/19/2016     ADDED C TO F CONVERSION.       
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-TEMP PIC 99.                                               
000710          88 CND-GOOD VALUES 20 THRU 29.                                 
000720          88 CND-HOT VALUES 30 THRU 39.                                  
000730          88 CND-VHOT VALUES 40 THRU 50.                                 
000740        01 WS-TEMPF PIC 9(3).                                            
000750        01 DS-TEMPF PIC Z(3).                                            
000800        PROCEDURE DIVISION.                                              
000900        ACCEPT-PARA.                                                     
001000            ACCEPT WS-TEMP.                                              
001200        MAIN-PARA.                                                       
001300            EVALUATE TRUE                                                
001400            WHEN CND-GOOD DISPLAY WS-TEMP " IS A GOOD TEMPERATURE."      
001500            WHEN CND-HOT DISPLAY WS-TEMP " IS A HOT TEMPERATURE."        
001600            WHEN CND-VHOT DISPLAY WS-TEMP " IS A VERY HOT TEMPERATURE."  
001700            WHEN OTHER DISPLAY WS-TEMP " IS UNDEFINED!".                 
001710        CONVERT-PARA.                                                    
001720            MOVE WS-TEMP TO WS-TEMPF.                                    
001730            DIVIDE WS-TEMPF BY 0.55 GIVING WS-TEMPF.                     
001740            ADD 32 TO WS-TEMPF.                                          
001741            MOVE WS-TEMPF TO DS-TEMPF.                                   
001750            DISPLAY WS-TEMP " CELSIUS IS " DS-TEMPF " FAHRENHEIT.".      
001800            STOP RUN.                                                    