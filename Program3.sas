/**** QUESTION 2 ****/


/*Student data with assignment statement*/
data Students;
	infile "/folders/myfolders/sleep.dat";
	input @1 Animal_Specie & $25. V2 V3 V4 V5 V6 V7 V8 V9 V10 V11;
	
	if v4 = -999.0 then v4 = .;          /*Instead of missing (v4), I used v4 = "." because missing values are numeric*/
	if v5 = -999.0 then v5 = .;
	if v6 = -999.0 then v6 = .;
	if v7 = -999.0 then v7 = .;
	if v8 = -999.0 then v8 = .;
	
	R_Brain_Body = (v3/1000)/v2;            /*Getting data value in Kgs*/
run;

proc print data = Students (Obs = 10);
run;

proc means data = Students N NMISS MIN MAX MEDIAN MEAN STDDEV;  /*Required variables */
run;


