/* QUESTION 1 */ 

data Data_set1;
 infile '/folders/myfolders/AO Division.dat' dlm = '09'x FIRSTOBS=2;  
 input Division: $18.
       Job_Type $6.;                                    
run; 

proc print data = Data_set1 noobs;
run;


data Data_set2;
 infile '/folders/myfolders/CORP Division.dat' dlm = '09'x FIRSTOBS = 2 ;  
 input Division: $20.
       Job_Type: $6.;  
run; 

proc print data = Data_set2 noobs;
run;


data Data_set3;
 infile '/folders/myfolders/empdata.dat' FIRSTOBS=2;  
 input @1 Date DATE9.
       @11 empid $6.
       Job_Type $
       Salary dollar7.
       ;    
 format Date DATE9. Salary dollar7.;
run; 

proc print data = Data_set3 noobs;
run;

data Data_set4;
 infile '/folders/myfolders/FINANCE_IT Division.dat' dlm = '09'x FIRSTOBS=2;  
 input Division: $12.
       Job_Type: $6.;
run; 

proc print data = Data_set4 noobs;
run;


data Data_set5;
 infile '/folders/myfolders/FLIGHT OPS Division.dat' dlm = '09'x FIRSTOBS=2;   
 input Division: $17.
       Job_Type: $6.;                                    
run; 

proc print data = Data_set5 noobs;
run;


data Data_set6;
 infile '/folders/myfolders/HR Division.dat' dlm = '09'x FIRSTOBS=2;   
 input Division: $15.
       Job_Type: $6.;                                    
run; 

proc print data = Data_set6 noobs;
run;



data Data_set7;
 infile '/folders/myfolders/Personal.dat' FIRSTOBS=2;   
 input @1 L_Name $18.
       @20 F_Name $17.
       Phone_Num
       empid $
       ;    
run; 

proc print data = Data_set7 noobs;
run;

data Data_set8;
 infile '/folders/myfolders/SALES Division.dat' dlm = '09'x FIRSTOBS=2;   
 input Division: $18.
       Job_Type: $6.; 
      
run; 

proc print data = Data_set8 noobs;
run;


/* Part A */
data Divison;
 set Data_set1 Data_set2 Data_set4 Data_set5 Data_set6 Data_set8;
run;

proc print data = Divison noobs;
run;

proc sort data = Divison;
By Job_Type;
run;

proc sort data = Data_set3;
by Job_Type;
run;



/* Part B */

data EmpData_div_merged;
 merge Divison (in = D1) Data_set3 (in = D2);
 by Job_Type;
 if D1 = 1 and D2 = 1;
run;

proc print data = EmpData_div_merged;
run;


proc sort data = EmpData_div_merged;
BY empid;
run;

proc sort data = Data_set7;
BY empid;
run;

libname forQ2 "/folders/myfolders/";


data forQ2.Air_Emps_Full;
 merge EmpData_div_merged Data_set7;
 by empid;
 DROP Phone_Num;
 set EmpData_div_merged(rename = (Salary = CurrentSalary));
 CurrentSalary = put(CurrentSalary, dollar5.);
 Drop Salary;
 Label Division = "Division of Org"
      Job_Type = "JOB_ID"
      Date = "Date of Hiring"
      Empid = "Employee ID"
      CurrentSalary = "Wages"
      L_Name = "Last Name"
      F_Name = "First Name";
run;

proc print data= forQ2.Air_Emps_Full noobs label;
run;


/* Labelling allows us to make variables in input according to our needs, small and easy to write. So, once we are all done with the variables, we can rename them at the end and provide easy representative for others.


/* Part C */

data forQ2.Air_Emps_Underpaid;
 set forQ2.Air_Emps_Full;
 WHERE Date < "01JAN1990"d AND CurrentSalary < 45000;
run;

proc print data = forQ2.Air_Emps_Underpaid LABEL;
run;

/* Part D */


ods pdf file = "/folders/myfolders/Q1A3.pdf";
proc print data = forQ2.Air_Emps_Underpaid (obs= 10) noobs LABEL; 

title 'Table for Question1';                    
proc document name = Q1D;
   import textfile = '/folders/myfolders/Q1A3.sas' to ^ ; 
   replay;
  
run;
quit;
ods pdf close;   





