000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM801.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: TO RECEIVE FIRST AND LAST NAME AS TWO FIELDS     
000330       * IN SYSIN. DISPLAY AS ONE ITEM USING REDEFINES                   
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/27/2016     PROGRAM CREATED                
000361       * JEBA02    EMY     8/01/2016     APPLIED CODING STANDARDS.      
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01  WS-NAME.                                                     
000410            02  WS-FIRSTNAME              PIC X(10).                     
000420            02  WS-LASTNAME               PIC X(10).                     
000430        01  WS-REDEFINE                   REDEFINES WS-NAME.             
000460            02  WS-FULLNAME               PIC X(20).                     
000800        PROCEDURE DIVISION.                                              
000801       ******************************************************************
000810       * MAIN FLOW OF PGM.                                               
000820       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-ACCEPT-PARA.                                   
001100            PERFORM 20000-DISPLAY-PARA.                                  
002000            STOP RUN.                                                    
002001       ******************************************************************
002010       * ACCEPT VALUES FROM SYSIN.                                       
002020       ******************************************************************
002100        10000-ACCEPT-PARA.                                               
002200            ACCEPT WS-FIRSTNAME.                                         
002300            ACCEPT WS-LASTNAME.    
002301       ******************************************************************
002310       * DISPLAY VALUES IN SPOOL.                                        
002320       ******************************************************************
002400        20000-DISPLAY-PARA.                                              
002500            DISPLAY WS-FULLNAME.                                                                               