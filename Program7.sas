/**** QUESTION 1 *****/
data Data_set;
 infile '/folders/myfolders/stocks.txt' dlm='09'x;      /*Tab-delimited file*/
 input Stock_Symbol $ Price NumOfShares;                   
 Value = round(Price*NumOfShares);                   /*I rounded the numbers*/
run; 

    
    
    
ods pdf file = "/folders/myfolders/AQ7.pdf"  ;
proc print data = Data_set NOOBS;
title 'Table for Question1';                     /*Title put here*/

                                
proc means data = Data_set MEAN;                /*Since only average number was required*/
title 'Mean Table' ;                  
var Price NumOfShares ;    


proc document name = Q7A;
   import textfile = '/folders/myfolders/Program7.sas' to ^ ;  /* We only need output, not code*/
   replay;
   
run;
quit;
ods pdf close;   


