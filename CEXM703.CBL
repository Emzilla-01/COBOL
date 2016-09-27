000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM703.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO CREATE A PROGRAM THAT DISPLAYS A              
000330       * MULTIPLICATION TABLE IN A TABLE.                                
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***    7/27/2016       PROGRAM COPIED FROM CEXM703.  
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-TABLE.                                                     
000700          02 WS-PRODUCT                 PIC 9(03)    OCCURS 12 TIMES.    
000710        01 WS-BASE                      PIC 9(03).                       
000720        01 WS-COUNT                     PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
000910            PERFORM 10000-ACCEPT-PARA.                                   
000920            PERFORM 20000-MOVE-PARA                                      
000930              UNTIL WS-COUNT            = 12.                            
000940              INITIALIZE WS-COUNT.                                       
000950            PERFORM 30000-DISPLAY-PARA                                   
000960              UNTIL WS-COUNT            = 12.                            
000970            STOP RUN.                                                    
001000        10000-ACCEPT-PARA.                                               
001010            ACCEPT WS-BASE.                                              
001100        20000-MOVE-PARA.                                                 
001110            ADD 1 TO WS-COUNT.                                           
001111            COMPUTE WS-PRODUCT(WS-COUNT) = WS-BASE * WS-COUNT.           
001200        30000-DISPLAY-PARA.                                              
001210            ADD 1 TO WS-COUNT.                                           
001300            DISPLAY WS-BASE " X " WS-COUNT " = " WS-PRODUCT(WS-COUNT).   