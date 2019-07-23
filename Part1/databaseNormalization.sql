-- Part 1.5 databaseNormalization.sql
--
-- Submitted by: Jelena Lor
-- 


--  Write your Database Normalization statements here


CREATE TABLE crime_status AS  
SELECT DISTINCT(status_id),status_desc
FROM crimes;



CREATE TABLE crime_description AS  
SELECT DISTINCT(crime_no),crime_desc
FROM crimes;



CREATE TABLE road AS  
SELECT DISTINCT(rd),area
FROM crimes;


CREATE TABLE area AS  
SELECT DISTINCT(area) AS area_id, area_name
FROM crimes;


ALTER TABLE crimes
DROP COLUMN status_desc, DROP COLUMN crime_desc, DROP COLUMN area, DROP COLUMN area_name;


-- Add Primary and Foreign Keys

ALTER TABLE crime_status
MODIFY status_id VARCHAR(20) NOT NULL;

ALTER TABLE crime_status
ADD PRIMARY KEY (status_id);



ALTER TABLE crime_description
MODIFY crime_no INT(11) NOT NULL;

ALTER TABLE crime_description
ADD PRIMARY KEY (crime_no);




ALTER TABLE road
ADD PRIMARY KEY (rd);


ALTER TABLE area
ADD PRIMARY KEY (area_id);


ALTER TABLE road
ADD FOREIGN KEY (area) REFERENCES area(area_id);


ALTER TABLE crimes
ADD PRIMARY KEY (dr_no);



ALTER TABLE crimes
ADD FOREIGN KEY (rd) REFERENCES road(rd),
ADD FOREIGN KEY (status_id) REFERENCES crime_status(status_id),
ADD FOREIGN KEY (crime_no) REFERENCES crime_description(crime_no),
ADD FOREIGN KEY (image_no) REFERENCES image(image_no);







