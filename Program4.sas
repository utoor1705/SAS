/*** Question 3 ***/ 


data Data_set;
	infile '/folders/myfolders/earthquake.dat';    
	input @1 DateOfQuake yymmdd8.                        /* Format utilized */
       @10 Time time8.                                   /* Format utilized */
       @20 v3 $6.                                        /* To make things easier, variables are utilized this way */
       @27 v4 $7.
       @36 v5 $4. 
       @41 v6 $5.
       @47 v7 $1.
       @50 Locations & $28.;   
       
       
	   Prev_date=lag(DateOfQuake);                         /*Lag rule utilized */
	   Years=intck('year', Prev_date, DateOfQuake, 'continuous' );       /*I calculated for years, months and days since I had no instruction which to get */
	   Months=intck('month', Prev_date, DateOfQuake , 'continuous');
	   Day=intck('day', Prev_date, DateOfQuake, 'continuous');
	   
	   format DateOfQuake Prev_date yymmdd8. Time time8.;                 /*Formatting*/
run;

ods pdf file = "/folders/myfolders/AQ3.pdf"  ;
proc print data=Data_set (Obs=10);
run;


proc document name = Q2A;
   import textfile = '/folders/myfolders/Program4.sas' to ^ ;  /* We only need output, not code*/
   replay;
   
run;
quit;
ods pdf close;