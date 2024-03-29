 000100        IDENTIFICATION DIVISION.                                         
 000200        PROGRAM-ID. CEXM704.                                             
 000300        AUTHOR. EMY KAY.                                                
 000310       ******************************************************************
 000320       * FUNCTIONALITY: WRITE A PROGRAM TO ACCEPT EMPLOYEE NUMBERS       
 000321       *  AND NAMES THROUGH SYSIN - LOAD THESE VALUES INTO               
 000322       *  AN INDEXED TABLE. SEND EMPLOYEE # VIA SYSIN                    
 000330       *  AND DISPLAY THE EMPLOYEE NAME IN SPOOL.                        
 000340       * ----------------------------------------------------------------
 000350       * PRJ NO    NAME     DATE          MAINT DESC.                    
 000351       * ----------------------------------------------------------------
 000360       * JEBA02    EMY    7/25/2016       PROGRAM CREATED.              
 000361       * JEBA02    EMY    7/26/2016       PROGRAM EDITED FOR FUNCTION.  
 000362       * JEBA02    EMY    7/29/2016       PROGRAM EDITED FOR FORMAT.    
 000363       * JEBA02    EMY    8/01/2016       REMOVED SUBSCRIPT VARIABLE.   
 000370       ******************************************************************
000400        DATA DIVISION.                                                   
000500        WORKING-STORAGE SECTION.                                         
000600        01  WS-DEC.                                                      
000700            02 WS-TABLE                 OCCURS 6 TIMES                   
000702                                        INDEXED BY I.                    
000703              03 WS-NUM                 PIC X(03).                       
000704              03 WS-NAME                PIC X(20).                       
000707        01  WS-QUERY                    PIC X(03).                       
000800        PROCEDURE DIVISION.                                              
000810       ******************************************************************
000811       * MAIN PROGRAM FLOW. INITIALIZE INDEX BEFORE EVERY LOOP.          
000812       *                    ACCEPT WS-QUERY AFTER ACCEPTING DATA.        
000820       ******************************************************************
000900        00000-MAIN-PARA.                                                 
000901            SET I TO 1.                                                  
000910            PERFORM 10000-ACCEPT-PARA                                    
000920              UNTIL I                   = 7.                             
000921            SET I TO 1.                                                  
000930              ACCEPT WS-QUERY.                                           
000950            PERFORM 20000-DISPLAY-PARA                                   
000951              UNTIL I                   = 7.                             
000952            PERFORM 30000-SEARCH-PARA.                                   
000960            STOP RUN.                                                    
000961       ******************************************************************
000970       * ACCEPT 6 RECORDS VIA SYSIN                                      
000980       ******************************************************************
001000        10000-ACCEPT-PARA.                                               
001020            ACCEPT WS-NUM(I).                                            
001030            ACCEPT WS-NAME(I).                                           
001040            SET I UP BY 1.                                               
001041       ******************************************************************
001042       * DISPLAY 6 RECORDS.                                              
001043       ******************************************************************
001050        20000-DISPLAY-PARA.                                              
001060            DISPLAY WS-NUM(I) " : " WS-NAME(I).                          
001070            SET I UP BY 1.                                               
001080       ******************************************************************
001090       * SEARCH FOR WS-QUERY.                                            
001091       ******************************************************************
001100        30000-SEARCH-PARA.                                               
001110            SET I TO 1.                                                  
001200            SEARCH WS-TABLE                                              
001300                AT END DISPLAY "# NOT FOUND."                            
001400            WHEN WS-NUM(I) = WS-QUERY                                    
001410            DISPLAY "FOUND " WS-NUM(I) " : " WS-NAME(I)                  
001420            END-SEARCH.                                                  
