-- Part 2.1 constraints.sql
--
-- Submitted by: Jelena Lor
-- 


--  Write your CREATE TRIGGERS statements here



DELIMITER //
CREATE TRIGGER CrimeReportDate BEFORE INSERT ON crimes2015
FOR EACH ROW
BEGIN
IF cast(str_to_date(NEW.date_reported,'%m/%d/%Y') AS date)<= timestamp(str_to_date(NEW.date_occ,'%m/%d/%Y'),str_to_date(substring(NEW.time_occ,1,8),'%H:%i:%s'))  THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Crimes cannot be reported before they occur';
END IF;
END //
DELIMITER ;

--  Write your testing statements here

-- This insert into table WILL work because date reported (20 September 2015) is after the date occurred (20 August 2015)

INSERT INTO crimes2015 (date_reported,date_occ,time_occ) VALUES ('09/20/2015','08/20/2015','09:00:00.0000');

-- By running the below code:
-- select * from crimes2015 where dr_no IS NULL;
-- Can see the data insert as per above has worked and is included in the table.



-- This insert into table WILL NOT work because the date reported (20 July 2015) is before the date occurred (20 August 2015)

INSERT INTO crimes2015 (date_reported,date_occ,time_occ) VALUES ('07/20/2015','08/20/2015','09:00:00.0000');

-- This insert into table WILL NOT work because the date and time reported (20 August 2015 
-- (since there is no time provided 00:00:00 will be used by the datetime formatting ) 
-- is equal to the date occurred (20 August 2015 00:00:00.0000)

INSERT INTO crimes2015 (date_reported,date_occ,time_occ) VALUES ('08/20/2015','08/20/2015','00:00:00.0000');

