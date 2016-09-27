000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID. CHM602B.                                             
000300        AUTHOR. ***REMOVED*** KAY.                                                
000310       ******************************************************************
000320       * FUNCTIONALITY: WRITE A PROGRAM FOR ACCEPTING N NUMBER OF        
000330       *  STUDENT DETAILS, ACCEPTING N AS INPUT.                         
000331       * ACCEPT MARKS OF 2 SUBJECTS ALONG WITH ROLL NUMBER AND NAME.     
000332       *  VARIANT A: USE PERFORM N TIMES.                                
000340       * ----------------------------------------------------------------
000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
000351       * ----------------------------------------------------------------
000360       * JEBA02    ***REMOVED***     7/20/2016     PROGRAM CREATED                
000361       * JEBA02    ***REMOVED***     7/22/2016     APPLIED CODING STANDARDS.      
000370       *****************************************************************?
000400        DATA DIVISION.                                                   
000401        WORKING-STORAGE SECTION.                                         
000410        01  WS-PGM-ITERS                PIC 9(03).                       
000411        01  WS-PGM-STOP PIC 9(03).                                       
000420        01  WS-NAME                     PIC X(10).                       
000430        01  WS-NUM                      PIC X(03).                       
000440        01  WS-ENG                      PIC 9(03).                       
000450        01  WS-MAT                      PIC 9(03).                       
000800        PROCEDURE DIVISION.                                              
000900        00000-MAIN-PARA.                                                 
000910            PERFORM 10000-INIT-PARA.                                     
001000            PERFORM 20000-ACCEPT-PARA                                    
001010            UNTIL WS-PGM-STOP >= WS-PGM-ITERS.                           
001100            STOP RUN.                                                    
001110        10000-INIT-PARA.                                                 
001120            ACCEPT WS-PGM-ITERS.                                         
001200        20000-ACCEPT-PARA.                                               
001300            ACCEPT WS-NAME.                                              
001400            ACCEPT WS-NUM.                                               
001500            ACCEPT WS-ENG.                                               
001600            ACCEPT WS-MAT.                                               
001610            DISPLAY "********************************".                  
001700            DISPLAY "STUDENT NAME  : " WS-NAME.                          
001800            DISPLAY "STUDENT NUMBER: " WS-NUM.                           
001900            DISPLAY "ENGLISH GRADE : " WS-ENG.                           
002000            DISPLAY "MATH GRADE    : " WS-MAT.                           
002100            DISPLAY "********************************".                  
002200            ADD 1 TO WS-PGM-STOP.                                        