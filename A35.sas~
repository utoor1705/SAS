/* Question 5 */



/* A */
data Quad;
 do x = 0 to 10 by 0.10;
   QuadEq = 3*x**2 - 5*x + 10;
   output;
 end;
run;





/* B */

data Weather;
 do City =  "Dallas","Austin";
    do Hour = 1 to 24;
	   input Temp @;
	   output;
	end;
 end;

 datalines;
 80 81 82 83 84 84 87 88 89 89 
 91 93 93 95 96 97 99 95 92 90 88
 86 84 80 78 76 77 78
 80 81 82 82 86
 88 90 92 92 93 96 94 92 90
 88 84 82 78 76 74
 ;
 run;

 
 
 
 
/* C */ 

data double_money;
 Interest = 0.0475;
 Total = 0;
 Year = 0;
 do until (Total >= 30000); 
    Total = Total + 1000;
    Year = Year + 1;
	Total = Total + Total * Interest;
    output;
 end;
 format Total dollar10.0;
run;

/* Required Years  19 */






ods pdf file = "/folders/myfolders/A3Q5.pdf";

proc print data = double_money noobs ;


proc document name = Q5;
   import textfile = '/folders/myfolders/A35.sas' to ^ ; 
  
run;
quit;
ods pdf close;
