data Cache;
 infile '/folders/myfolders/President.txt' dlm='09'x;  
 input FullName: $22.
       City: $19.  
       State: $20.
       ASP 
       DOB: mmddyy10.
       Term
       Votes comma10.
       PercVote: PERCENT8.2;
       
       DOBC = DOB ;                                     
       DOBC_D = substr(put(DOBC, date10.), 1, 3);
       DOBC_M = substr(put(DOBC, date10.), 4, 3);
       DOBC_Y = substr(put(DOBC, date10.), 7, 4);
       
       DOBC2 = DOB;
       DOBC2_D = SCAN(put(DOBC2, ddmmyy10.), 1, '/');
       DOBC2_M = SCAN(put(DOBC2, ddmmyy10.), 2, '/');
       DOBC2_Y = SCAN(put(DOBC2, ddmmyy10.), 3, '/');
       
 format DOB mmddyy10. Votes comma10. PercVote PERCENT8.2 DOBC date10. DOBC2 ddmmyy10.;
run;

/*** Substr & Scan function ***/
/* In the case of Substr, we observe that it takes away a certain part of the character and extracts it for us as output. E.g, when I was doing DOBC_D, I extract Day by signally position or coloum 1 and 2 movement. Hence, I was able to extract what I required.
/* In the case of Scan, we observe that it utilizes delimiter to commit the same function as substr, that is extrating a certain part of the observation. I worked here with "/" delimiter. Without a delimiter, where there is no space between date values, it would be impossible to utilize this function.*/
/* To conclude, I would prefer Substr as compared to Scan because it can be utilized in almost all ways, unlike Scan. Both of them do the same function, but one does it with position and movement, while the other does it with delimiter. But delimiter, though it makes it easy, is its biggest weakness as well. */


ods pdf file = "/folders/myfolders/AQ5.pdf"  ;

proc print data = Cache (Obs = 10);
Title "United States Presidential Data";
run;

proc document name = Q5A;
   import textfile = '/folders/myfolders/Program5.sas' to ^ ;  /* We only need output, not code*/
   replay;
   
run;
quit;
ods pdf close;