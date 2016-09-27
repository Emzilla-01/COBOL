000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM703B.                                            
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO CREATE A PROGRAM THAT DISPLAYS A              
000330       * MULTIPLICATION TABLE IN A GRID.                                 
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***    7/27/2016       PROGRAM COPIED FROM CEXM703.  
000361       * JEBA02    ***REMOVED***    7/27/2016       BEGUN ADAPTATION FOR GRID.    
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01 WS-TABLE.  
000610          02 WS-01                      PIC 9(03) VALUE 001              
000620                                        OCCURS 12 TIMES.                 
000700          02 WS-02                      PIC 9(03) VALUE 002              
000701                                        OCCURS 12 TIMES.                 
000702          02 WS-03                      PIC 9(03) VALUE 003              
000703                                        OCCURS 12 TIMES.                 
000704          02 WS-04                      PIC 9(03) VALUE 004              
000705                                        OCCURS 12 TIMES.                 
000706          02 WS-05                      PIC 9(03) VALUE 005              
000707                                        OCCURS 12 TIMES.                 
000708          02 WS-06                      PIC 9(03) VALUE 006              
000709                                        OCCURS 12 TIMES.                 
000710          02 WS-07                      PIC 9(03) VALUE 007              
000711                                        OCCURS 12 TIMES.                 
000712          02 WS-08                      PIC 9(03) VALUE 008              
000713                                        OCCURS 12 TIMES.                 
000714          02 WS-09                      PIC 9(03) VALUE 009              
000716                                        OCCURS 12 TIMES.                 
000717          02 WS-10                      PIC 9(03) VALUE 010              
000718                                        OCCURS 12 TIMES.                 
000719          02 WS-11                      PIC 9(03) VALUE 011              
000720                                        OCCURS 12 TIMES.                 
000721          02 WS-12                      PIC 9(03) VALUE 012              
000722                                        OCCURS 12 TIMES.                 
000730        01 WS-COUNT                     PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-01-PARA UNTIL WS-COUNT = 12.                   
001010            INITIALIZE WS-COUNT.                                         
001020            PERFORM 30000-DISPLAY-PARA UNTIL WS-COUNT = 12.              
001030            STOP RUN.                                                    
001100        10000-01-PARA.                                                   
001110            ADD 1 TO WS-COUNT.                                           
001112            MULTIPLY WS-01(WS-COUNT) BY WS-COUNT GIVING WS-01(WS-COUNT). 
001200        30000-DISPLAY-PARA.                                              
001210            ADD 1 TO WS-COUNT.                                           
001300            DISPLAY  "001 X " WS-COUNT " = "  WS-01(WS-COUNT).                                                              