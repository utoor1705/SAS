


data Cache;                                               /*Simple Column Input */
 infile '/folders/myfolders/geocaching.txt';  
 input Name $ 1-20 LongDeg 21-22 LongMin 23-28 LatDeg 29-30 LatMin 31-36;   /* Input */                      
run; 


data Cache1;                                               /*Formatted Input */
 infile '/folders/myfolders/geocaching.txt'; 
 input @1 Name $20. @21 LongDeg 2. @23 LongMin 6.4 @29 LatDeg 2. @31 LatMin 6.5;
run;


ods pdf file = "/folders/myfolders/AQ6.pdf"  ;
proc print data = Cache;                                  /*Simple Column Input */
run;

proc print data = Cache1;                                  /*Formatted Input */
run;


proc report data = Cache1;                              /* Report Generation */
title 'Simple Reportof Geocaching';
columns Name -- LatMin;
label Name = Cache_name
      LongDeg = Longitude_degrees
      LongMin = Longitude_minutes
      LatDeg = Latitude_degrees
      LatMin = Latitude_minutes;
      
      define Name / Display;
      define LongDeg / Display;
      define LongMin / Display;
      define LatDeg / Display;
      define LatMin / Display;

run;

proc document name = Q6A;
   import textfile = '/folders/myfolders/Program6.sas' to ^ ;  /* We only need output, not code*/
   replay;
   
run;
quit;
ods pdf close;
