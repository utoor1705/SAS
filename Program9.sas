/*** Question 2 ***/



/** A **/
data Air_Emps_Raises;
set forQ2.Air_Emps_Full;
Years = intck('year', Date, '01Jan2019'd, 'continuous');


if Years >= 35 then NewSalary = CurrentSalary + 3500 + 0.002*CurrentSalary;
else if Years >= 35 and Job_Type in ("3","2") then NewSalary = CurrentSalary + 3500 + 0.025*CurrentSalary;
else if Years >=35 and Job_Type in ("1") then  NewSalary = CurrentSalary + 3500 + 0.015*CurrentSalary;

else if Years < 35 And Years >= 25 then NewSalary = CurrentSalary + 2000 + 0.0175*CurrentSalary;
else if Years < 35 And Years >= 25 and Job_Type in ("3","2") then NewSalary = CurrentSalary + 2000 + 0.02*CurrentSalary;
else if Years < 35 And Years >= 25 and Job_Type in ("1") then  NewSalary = CurrentSalary + 2000 + 0.01*CurrentSalary;

else if Years < 25 then NewSalary = CurrentSalary + 0.0250*CurrentSalary;
else if Years < 25 and Job_Type in ("3","2") then NewSalary = CurrentSalary + 0.0125*CurrentSalary;
else if Years < 25 and Job_Type in ("1") then NewSalary = CurrentSalary + 0.0075*CurrentSalary;

else NewSalary = "Investigation Req";


format NewSalary dollar8.;
by empid;

label Years = "Years of Service";


run;

proc print data = air_emps_raises LABEL Noobs;
run;


/** B **/


Data Underpaid;
set forQ2.Air_Emps_Underpaid;

Years = intck('year', Date, '01Jan2019'd, 'continuous');


if Years >= 35 then NewSalary = CurrentSalary + 3500 + 0.002*CurrentSalary;
else if Years >= 35 and Job_Type in ("3","2") then NewSalary = CurrentSalary + 3500 + 0.025*CurrentSalary;
else if Years >=35 and Job_Type in ("1") then  NewSalary = CurrentSalary + 3500 + 0.015*CurrentSalary;

else if Years < 35 And Years >= 25 then NewSalary = CurrentSalary + 2000 + 0.0175*CurrentSalary;
else if Years < 35 And Years >= 25 and Job_Type in ("3","2") then NewSalary = CurrentSalary + 2000 + 0.02*CurrentSalary;
else if Years < 35 And Years >= 25 and Job_Type in ("1") then  NewSalary = CurrentSalary + 2000 + 0.01*CurrentSalary;

else if Years < 25 then NewSalary = CurrentSalary + 0.0250*CurrentSalary;
else if Years < 25 and Job_Type in ("3","2") then NewSalary = CurrentSalary + 0.0125*CurrentSalary;
else if Years < 25 and Job_Type in ("1") then NewSalary = CurrentSalary + 0.0075*CurrentSalary;

else NewSalary = "Investigation Req";

format NewSalary dollar8.;
by empid;



label Years = "Years of Service";

run;

proc print data = Underpaid LABEL noobs;
Where NewSalary < 45000;
run;


/** C **/

ods pdf file = "/folders/myfolders/AQ2A.pdf";
proc print data = air_emps_raises (OBS= 10) LABEL noobs;
title "For Question A, All Employees";
Footnote "All employee Data";


proc document name = Table1;
   import textfile = '/folders/myfolders/A3-Q2.sas' to ^ ; 
run;
quit;
ods pdf close; 



ods pdf file = "/folders/myfolders/Q2A3.pdf";

proc print data = Underpaid (OBS = 10) LABEL noobs;
Where NewSalary < 45000;
title "For Question B, Under-Paid ";
FOOTNOTE "Under-Paid Data";

proc document name = Table2;
   import textfile = '/folders/myfolders/Q2A3.sas' to ^ ;
   replay;
run;
quit;
ods pdf close; 


