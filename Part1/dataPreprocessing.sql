-- Part 1.3 dataPreprocessing.sql
--
-- Submitted by: Jelena Lor
-- 

-- Write your Data Preprocessing statements here


-- time_occ update for 2013 table


UPDATE crimes2013
SET time_occ = concat(concat(substring(time_occ,1,2),':'),substring(time_occ,3,2))
where length(time_occ)=4
;

UPDATE crimes2013
SET time_occ = concat(concat(concat('0',substring(time_occ,1,1)),':'),substring(time_occ,2,2))
where length(time_occ)=3
;

UPDATE crimes2013
SET time_occ = concat('00:',substring(time_occ,1,2))
where length(time_occ)=2
;

UPDATE crimes2013
SET time_occ = concat('00:0',substring(time_occ,1,1))
where length(time_occ)=1
;



-- time_occ update for 2014 table

UPDATE crimes2014
SET time_occ = concat(concat(substring(time_occ,1,2),':'),substring(time_occ,3,2))
where length(time_occ)=4
;

UPDATE crimes2014
SET time_occ = concat(concat(concat('0',substring(time_occ,1,1)),':'),substring(time_occ,2,2))
where length(time_occ)=3
;

UPDATE crimes2014
SET time_occ = concat('00:',substring(time_occ,1,2))
where length(time_occ)=2
;

UPDATE crimes2014
SET time_occ = concat('00:0',substring(time_occ,1,1))
where length(time_occ)=1
;


-- check and update incorrect image_no 
-- Checked the crimes2014 database and it does not include any image_no below 0
-- Checked that table 2013 and 2014 include the image_no that are the same as image_no in table 2015, 
-- it is unlikely that the same image would relate to crime from 2013 and from crime 2015.
-- Also the same image_no in database 2013 and 2014 comes up for many crimes
-- If the image relates to the crime scene this could potentially mean an error in image_no as it is unlikely 
-- that the same crime scene image would relate to large number of unrelated cases.


-- For the purpose of this assignment, we assume that the images provided in the 2015 database relate only to the 2015 crimes



UPDATE crimes2013
SET image_no=NULL
where image_no<1
;


UPDATE crimes2014
SET image_no=NULL
where image_no<1
;



-- Capitalise status in 2013. In 2014 and in 2015 data the status is capitalised

UPDATE crimes2013
SET status = UPPER(status);



-- Date reported AND date_occ in 2015 is in format DD/MM/YYYY but in 2014 is in format YYYY-MM-DD, in 2013 is in format DDth Month, Year

-- convert date to date

UPDATE crimes2015
SET date_occ = str_to_date(date_occ,'%m/%d/%Y');

UPDATE crimes2015
SET date_reported = str_to_date(date_reported,'%m/%d/%Y');



UPDATE crimes2013
SET date_occ = str_to_date(date_occ,'%D %M, %Y');

UPDATE crimes2013
SET date_reported = str_to_date(date_reported,'%D %M, %Y');



UPDATE crimes2014
SET date_occ = str_to_date(date_occ,'%Y-%M-%d');

UPDATE crimes2014
SET date_reported = str_to_date(date_reported,'%Y-%M-%d');



-- convert time to time


UPDATE crimes2013
SET time_occ= str_to_date(time_occ,'%H:%i');


UPDATE crimes2014
SET time_occ= str_to_date(time_occ,'%H:%i');


UPDATE crimes2015
SET time_occ= str_to_date(substring(time_occ,1,8),'%H:%i:%s');



-- Using the code below (Intentionally commented out) found three instances where the same crime_no
-- correspond to different crime_description

-- select crime_no,count(distinct(crime_desc)) AS c from crimes2013  group by crime_no having c>1 ;
-- the code above return count 2 for crime_no 440, meaning there are two distinct descriptions in relation to this code
-- select distinct(crime_desc),crime_no from crimes2013 where crime_no=440;  

-- crime_no 440 has two descriptions:  THEFT PLAIN - PETTY (UNDER $400), THEFT PLAIN - PETTY ($950 & UNDER) 


-- select crime_no,count(distinct(crime_desc)) AS c from crimes2014  group by crime_no having c>1 ; 
-- select distinct(crime_desc),crime_no from crimes2014 where crime_no=813; 
-- select distinct(crime_desc),crime_no from crimes2014 where crime_no=930; 

-- crime_no 813 has two descriptions: CHILD ENDANGERMENT/NEG.  , CHILD ANNOYING (17YRS & UNDER, DID NOT TOUCH VICTI 
-- crime_no 930 has two descriptions: CRIMINAL THREATS - NO WEAPON DISPLAYED , THREATS, VERBAL/TERRORIST 

-- SOLUTION

-- Since codes exhibit characteristic of hierarchy of crimes, e.g. 
-- all crime_no starting with 4 relate to theft, it makes sense to create a new crime_co starting with 4

-- Check for the distinct crime_no across all database:

-- SELECT DISTINCT(crime_no) FROM crimes2013
-- UNION
-- SELECT DISTINCT(crime_no) FROM crimes2014
-- UNION
-- SELECT DISTINCT(crime_no) FROM crimes2015
-- ORDER BY 1;

-- The next available crime_no after 440 is 443. Therefore assign the crime description  THEFT PLAIN - PETTY ($950 & UNDER) crime_no 443


UPDATE crimes2013
SET crime_no=443
WHERE crime_desc='THEFT PLAIN - PETTY ($950 & UNDER)';

-- CHECK  -> RUN THE BELOW CODE WHICH RETURNS Empty Set
-- select crime_no,count(distinct(crime_desc)) AS c from crimes2013  group by crime_no having c>1 ;


-- The next available crime_no after 813 is 814. Therefore assign the crime description  CHILD ANNOYING (17YRS & UNDER, DID NOT TOUCH VICTI  crime_no 814
-- The next available crime_no after 930 is 931. Therefore assign the crime description  THREATS, VERBAL/TERRORIST  crime_no 931


UPDATE crimes2014
SET crime_no=814
WHERE crime_desc='CHILD ANNOYING (17YRS & UNDER, DID NOT TOUCH VICTI';

UPDATE crimes2014
SET crime_no=931
WHERE crime_desc='THREATS, VERBAL/TERRORIST';

-- CHECK  -> RUN THE BELOW CODE WHICH RETURNS Empty Set
-- select crime_no,count(distinct(crime_desc)) AS c from crimes2014  group by crime_no having c>1 ; 



-- DUPLICATES

-- Code to check for total values:
-- select count(*) from crimes2013;  --> 5035
-- select count(*) from crimes2014;  --> 1013
-- select count(*) from crimes2015;  --> 285

-- FIND DUPLICATES

-- select dr_no AS c from crimes2014 group by 1 having count(*)>1 ;

-- The above code shows all dr_no that appear more than one
-- The total number of duplicate rows are 45 (code below)
-- select count(dr_no) from (select dr_no from crimes2014 group by 1 having count(*)>1) AS t ;

-- the check above was performed for 2013 and 2015 datasets too and resulted in empty set which means no duplicates


-- The below code removes duplicates and at the same time swap the order of columns in dataset 2014 to ensure it is consistent with other two datasets.

CREATE TABLE temp AS (SELECT DISTINCT dr_no,date_reported,date_occ,time_occ,area,area_name,rd,crime_no,crime_desc,status,status_desc,image_no FROM crimes2014);
DROP TABLE crimes2014;
CREATE TABLE crimes2014 AS (SELECT * FROM temp);
DROP TABLE temp;

-- CHECK  -> RUN THE BELOW CODE AND IT WILL RESULT IN EMPTY SET
-- select dr_no AS c from crimes2014 group by 1 having count(*)>1 ;
-- Also total number of rows in 2014 is now 968 (1013-45) which is correct



-- ANOMALIES

-- Image no in 2013 and 2014 are similar to the ones in 2015, however no images were supplied with 2013 and 2014 dataset.
-- I run the check to see how many distinct image_no there are in total across all three datasets (code below)

-- SELECT DISTINCT(image_no) FROM crimes2013
-- UNION
-- SELECT DISTINCT(image_no) FROM crimes2014
-- UNION
-- SELECT DISTINCT(image_no) FROM crimes2015
-- ORDER BY 1;

-- select count(image_no) from (SELECT DISTINCT(image_no) FROM crimes2013 UNION SELECT DISTINCT(image_no) FROM crimes2014 UNION SELECT DISTINCT(image_no) FROM crimes2015 ORDER BY 1) AS b;



-- there are 994 unique image_no across all three datasets and there are 1001 unique image_no (images) in image table
-- As a result, for the purpose of this assignment assume the same image relates to various crimes across all three years



















