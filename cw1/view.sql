-- view.sql
--
-- Submitted by: Jelena Lor -- 





-- VIEW THAT DOES NOT ALLOW CHANGES
CREATE VIEW future_events AS
SELECT * FROM event
WHERE event_date >= CURRENT_DATE()
WITH CHECK OPTION;				-- This codes will prevent from making the changes to data in the table if the change does not satisfy the Where Condition


-- CHECK -> The code below will result in error, e.g. table won't be updated due to constraint, e.g. 2018-01-18 is before current date, therefore does not satisfy condition.

UPDATE future_events 
SET event_date = '2018-01-18'
WHERE event_date = '2019-01-25'; 		