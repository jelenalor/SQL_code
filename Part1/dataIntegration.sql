-- Part 1.4 dataIntegration.sql
--
-- Submitted by: Jelena Lor
-- 


--  Write your Data Integration statements here


-- Combine all three databases

CREATE TABLE crimes AS 
SELECT * FROM
(SELECT * FROM crimes2013
UNION
SELECT * FROM crimes2014
UNION
SELECT * FROM crimes2015) AS t;


-- Create timestamp 

ALTER TABLE crimes
ADD COLUMN occured DATETIME;

UPDATE crimes
SET occured = timestamp(date_occ,time_occ);

ALTER TABLE crimes
DROP date_occ, DROP time_occ;



-- CHECK to ensure all image_no in the crimes table as in image table too:

-- select distinct(image_no) from crimes WHERE image_no NOT IN (select distinct(image_no) from image);

ALTER TABLE crimes CHANGE COLUMN status  status_id VARCHAR(20);   -- rename the column status as 'status' is a reserved word


-- ANOMALIES 

UPDATE crimes
SET crime_no=443
WHERE crime_desc='THEFT PLAIN - PETTY ($950 & UNDER)';


UPDATE crimes
SET crime_desc='CHILD ANNOYING (17YRS & UNDER, DID NOT TOUCH VICTIM)'
WHERE crime_desc='CHILD ANNOYING (17YRS & UNDER, DID NOT TOUCH VICTI ';


UPDATE crimes
SET crime_no=814
WHERE crime_desc='CHILD ANNOYING (17YRS & UNDER, DID NOT TOUCH VICTIM)';

-- Update inconsistencies in descriptions


UPDATE crimes
SET crime_desc='THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD'
WHERE crime_desc='THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVEST';




UPDATE crimes
SET crime_desc='VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)'
WHERE crime_desc='VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDAL';



UPDATE crimes
SET crime_desc='SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANUS OTH '
WHERE crime_desc='SODOMY/SEXUAL CONTACT B/W PENIS OF ONE PERS TO ANU ';


-- CHECK TO ENSURE NO MORE DUPLICATE crime_no 
-- select distinct(crime_no),count(distinct(crime_desc)) AS c from crimes group by crime_no having c>1 ;





