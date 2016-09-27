 000100        IDENTIFICATION DIVISION.                                         
 000200        PROGRAM-ID. CEXM405.                                             
 000300        AUTHOR. ***REMOVED*** KAY.                                                
 000310       ******************************************************************
 000320       * FUNCTIONALITY: TO TEST DIFFERENT EDITED CHARACTERS.             
 000330       *                                                                 
 000340       * ----------------------------------------------------------------
 000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
 000351       * ----------------------------------------------------------------
 000360       * JEBA02    ***REMOVED***     7/22/2016      PROGRAM CREATED               
 000370       ******************************************************************
 000400        DATA DIVISION.                                                   
 000500        WORKING-STORAGE SECTION.                                         
 000600        01 WS-DATA1.                                                     
 000700          05 WS-DOLLAR PIC 9(06).                                        
 000710          05 WS-DATE PIC 9(06).                                          
000720          05 WS-SALARY PIC 9(06).                                        
000730          05 WS-ACC PIC 9(06).                                           
000740          05 WS-NUM1 PIC S9(03)V9(03) SIGN LEADING.                      
000750          05 WS-NUM2 PIC S9(03)V9(03) SIGN LEADING.                      
000760        01 WS-DATA2.                                                     
000770          05 WS-DOLLAR1 PIC $9(06).                                      
000780          05 WS-DATE1 PIC 99/99/99.                                      
000790          05 WS-SALARY1 PIC ZZZ999.                                      
000791          05 WS-ACC1 PIC ***999.                                         
000792          05 WS-NUM3 PIC 9(03).9(03)CR.                                  
000793          05 WS-NUM4 PIC 9(03).9(03)DB.                                  
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-ACCEPT-PARA.                                   
001001            PERFORM 20000-MOVE-PARA.                                     
001010            PERFORM 30000-DISPLAY-PARA.                                  
001020            STOP RUN.
001100        10000-ACCEPT-PARA.                                               
001300            ACCEPT WS-DOLLAR.                                            
001400            ACCEPT WS-DATE.                                              
001500            ACCEPT WS-SALARY.                                            
001600            ACCEPT WS-ACC.                                               
001700            ACCEPT WS-NUM1.                                              
001800            ACCEPT WS-NUM2.                                              
001810        20000-MOVE-PARA.                                                 
001830            MOVE WS-DOLLAR TO WS-DOLLAR1.                                
001840            MOVE WS-DATE TO WS-DATE1.                                    
001850            MOVE WS-SALARY TO WS-SALARY1.                                
001860            MOVE WS-ACC TO WS-ACC1.                                      
001870            MOVE WS-NUM1 TO WS-NUM3.                                     
001880            MOVE WS-NUM2 TO WS-NUM4.                                     
001900        30000-DISPLAY-PARA.                                              
002000            DISPLAY WS-DOLLAR " TRANSLATES TO " WS-DOLLAR1.              
002100            DISPLAY WS-DATE " TRANSLATES TO " WS-DATE1.                  
002200            DISPLAY WS-SALARY " TRANSLATES TO " WS-SALARY1.    
002300            DISPLAY WS-ACC " TRANSLATES TO " WS-ACC1.                    
002400            DISPLAY WS-NUM1 " TRANSLATES TO " WS-NUM3.                   
002500            DISPLAY WS-NUM2 " TRANSLATES TO " WS-NUM4.                                                                                 