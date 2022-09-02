000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CEXM802.                                             
000300        AUTHOR. EMY KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY:                                                  
000330       *                                                                 
000331       * DECLARE A NUMERIC DATA ITEM WITH 46 BYTES. OUT OF 46 BYTES,     
000332       *  A   6 BYTES (CONSIDERED AS EMPLOYEE NUMBER)                    
000333       *  B   20 BYTES (CONSIDERED AS EMPLOYEE NAME)                     
000334       *  C   20 BYTES (CONSIDERED AS EMPLOYEE LOCATION)                 
000335       * REDEFINE THESE ITEMS WITH STUDENT DETAILS AS,                   
000336       *  P   6 BYTES (CONSIDERED AS STUDENT NUMBER)                     
000337       *  Q   20 BYTES (CONSIDERED AS STUDENT NAME)                      
000338       *  R   20 BYTES (CONSIDERED AS STUDENT LOCATION)                  
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    EMY     7/27/2016     PROGRAM CREATED.               
000361       * JEBA02    EMY     8/01/2016     APPLIED CODING STANDARDS.      
000370       ******************************************************************
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000402        01  WS-NUMERIC.                                                  
000410            02  WS-A                    PIC 9(18).                       
000420            02  WS-B                    PIC 9(18).                       
000430            02  WS-C                    PIC 9(10).                       
000460        01  WS-STUDENT-DETAILS          REDEFINES WS-NUMERIC.            
000470            02  WS-STUDENT-NUM          PIC X(06).                       
000480            02  WS-STUDENT-NAME         PIC X(20).                       
000490            02  WS-STUDENT-GEO          PIC X(20).                       
000800        PROCEDURE DIVISION.                                              
000801       ******************************************************************
000810       * MAIN PGM FLOW.                                                  
000820       ******************************************************************
000900        00000-MAIN-PARA.                                                 
001000            PERFORM 10000-ACCEPT-PARA.                                   
001100            PERFORM 20000-DISPLAY-PARA.                                  
002000            STOP RUN.                                                    
002001       ******************************************************************
002010       * ACCEPT THREE VALUES VIA SYSIN.                                  
002020       ******************************************************************
002100        10000-ACCEPT-PARA.                                               
002200            ACCEPT WS-STUDENT-NUM.                                       
002300            ACCEPT WS-STUDENT-NAME.                                      
002310            ACCEPT WS-STUDENT-GEO.                                       
002311       ******************************************************************
002320       * DISPLAY REDEFINED VALUE.                                        
002330       ******************************************************************
002400        20000-DISPLAY-PARA.                                              
002500            DISPLAY WS-NUMERIC.                                          