-- Part 1.2 dataLoading.sql
--
-- Submitted by: Jelena Lor
-- 

-- Part 1.2.1 Table Creation


CREATE TABLE crimes2013 (dr_no INT NOT NULL, 
date_reported VARCHAR(20) NOT NULL, 
date_occ VARCHAR(20) NOT NULL, 
time_occ VARCHAR(20) NOT NULL,
area INT NOT NULL, 
area_name VARCHAR(20) NOT NULL,
rd INT NOT NULL,
crime_no INT NOT NULL,
crime_desc VARCHAR(50) NOT NULL,
status VARCHAR(20) NOT NULL,
status_desc VARCHAR(20) NOT NULL,
image_no INT);



CREATE TABLE crimes2014 (date_reported VARCHAR(20) NOT NULL, 
dr_no INT NOT NULL, 
date_occ VARCHAR(20) NOT NULL, 
time_occ VARCHAR(20) NOT NULL,
area INT NOT NULL, 
area_name VARCHAR(20) NOT NULL,
rd INT NOT NULL,
crime_no INT NOT NULL,
crime_desc VARCHAR(50) NOT NULL,
status VARCHAR(20) NOT NULL,
status_desc VARCHAR(20) NOT NULL,
image_no INT);



-- Part 1.2.1 Data Load

LOAD DATA LOCAL INFILE '/home/k1895908/db_cw2/Part1/crimes2013.txt' INTO TABLE crimes2013
FIELDS TERMINATED BY '\t' ENCLOSED BY '\''
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/home/k1895908/db_cw2/Part1/crimes2014.csv' INTO TABLE crimes2014
FIELDS TERMINATED BY ';' ENCLOSED BY '\''
LINES TERMINATED BY '\n' 
IGNORE 1 LINES;