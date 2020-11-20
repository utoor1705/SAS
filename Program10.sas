/* Question 3 */


/* A */
libname mydata "/folders/myfolders";

proc sort data = mydata.aprtarget;
BY Date;
run;

proc print data=mydata.aprtarget;
run;


proc sort data = mydata.maytarget;
BY Date;
run;

proc print data=mydata.maytarget;
run;


proc sort data = mydata.juntarget;
BY Date;
run;

proc print data=mydata.juntarget;
run;



data work.q3vienna;
 merge mydata.juntarget
       mydata.maytarget
       mydata.aprtarget(rename = (Flight = FlightID))
       mydata.aprtarget(rename = (FClassTar = FTarget))
       mydata.aprtarget(rename = (EClassTar = ETarget));
 drop Flight FClassTar EClassTar;      
 by Date;
run;

proc print data = work.q3vienna;
run;

/* B */

/* There appears to be no error or warning messages in the log file */ 

/* We have about 307 rows of observations with 7 coloums */

/* Our Code first of all makes a library in order to capture the SAS Datasets we have, to */
/* read them. After reading and sorting, we move towards merging them. I merge them by Date */
/* Because I believe that ID's can overlap hence we might have problem in the data, so I made */
/* a safer bet with Date. Moreover, I changed the three variables of aprtarget and made them */
/* coherent with others. After dropping the variables no longer required and using by function */
/* by date, I find my results! */


/* C */

data work.q3vienna;
 merge mydata.juntarget
       mydata.maytarget
       mydata.aprtarget(rename = (Flight = FlightID))
       mydata.aprtarget(rename = (FClassTar = FTarget))
       mydata.aprtarget(rename = (EClassTar = ETarget));
 drop Flight FClassTar EClassTar;      
 by Date;
 
 TotalTar = FTarget + ETarget;
 TotalRev = FRev + ERev;
 
 format TotalRev dollar8.;
 
 keep FlightID Destination Date TotalTar TotalRev;
run;





ods pdf file = "/folders/myfolders/Q3A3.pdf";

proc print data = work.q3vienna (OBS = 10);
title 'Table for Question3C';   
run;

                 
proc document name = Q3C;
   import textfile = '/folders/myfolders/Q3A3.sas' to ^ ; 
replay;  
run;
quit;
ods pdf close; 
