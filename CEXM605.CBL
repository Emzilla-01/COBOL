000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID CEXM605.                                              
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM TO DISPLAY THE                   
000330       *                MULTIPLICATION TABLE OF A NUMBER.                
000331       * INPUT WS-BASE : BASE VALUE OF MULTIPLICATION TABLE.             
000332       * INPUT WS-LIMIT: TO WHAT MULTIPLE OF WS-BASE THE TABLE CALCULATES
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/20/2016     PROGRAM CREATED                
000361       * JEBA02    ***REMOVED***     7/21/2016     APPLIED CODING STANDARDS.      
000362       *                                  DOCUMENTED PROCEDURE.          
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01  WS-BASE                     PIC 9(03).                       
000700        01  WS-LIMIT                    PIC 9(03).                       
000710        01  WS-COUNT                    PIC 9(03)   VALUE 000.           
000720        01  WS-MULTIPLE                 PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000801        00000-MAIN-PARA.                                                 
000802            PERFORM 10000-ACCEPT-PARA.                                   
000803            PERFORM 20000-DISPLAY-PARA                                   
000804                UNTIL WS-COUNT >= WS-LIMIT.                              
000805            STOP RUN.                                                    
000810        10000-ACCEPT-PARA.                                               
000820            ACCEPT WS-BASE.                                              
000830            ACCEPT WS-LIMIT.                                             
001200        20000-DISPLAY-PARA.                                              
001210            ADD 1 TO WS-COUNT.                                           
001220            COMPUTE WS-MULTIPLE = WS-BASE * WS-COUNT.                    
001300            DISPLAY WS-BASE " X " WS-COUNT " = " WS-MULTIPLE.            