/*** Question 4 ***/



/** A **/
libname mydata "/folders/myfolders";

proc sort data = mydata.target121999 OUT = work.sort_b;
by FlightID;
WHERE Date = '15dec1999'd and Origin = 'BHM';
run;


proc print data = work.sort_b;
run;


/** B **/

proc sort data = mydata.sales121999 OUT = work.sort_s;
by FlightID;
WHERE Date = '15dec1999'd and Origin = 'BHM';
run;


proc print data = work.sort_s;
run;

/** C **/

data compare;
set work.sort_b work.sort_s;
merge work.sort_b work.sort_s;
by FlightID;
LostCargoRev = CargoTarRev - CargoRev;
run;

proc print data = compare;
run;


/** D **/


ods pdf file = "/folders/myfolders/AQ4D.pdf";


proc print data = compare label;
var CargoTarRev CargoRev LostCargoRev;
label LostCargoRev = "Loss in Cargo Revenue";
format LostCargoRev dollar8.2;

title 'Table for Question4D';                    
proc document name = Q4D;
   import textfile = '/folders/myfolders/A3-Q4.sas' to ^ ; 
  REPLAY;
run;
quit;
ods pdf close;   

