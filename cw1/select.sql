-- select.sql
--
-- Submitted by: Jelena Lor-- 


-- Employee List
SELECT name,surname,email   -- display name, surname and email for each employee in employee table
FROM employee;





-- Oldest Status
SELECT status_text,status_timestamp
FROM post_status
WHERE status_timestamp=(SELECT MIN(status_timestamp) FROM post_status);  		-- nested function which finds the oldest date by min(date), where statements filters the selection that matches the oldest date found




-- Total Usage


SELECT COUNT(DISTINCT(s.id)) AS status_count, COUNT(DISTINCT(c.id)) AS comment_count, (SELECT COUNT(DISTINCT(id)) FROM event) AS event_count
FROM post_status AS s
RIGHT JOIN post_comment AS c ON s.id=c.statusID;




-- Event Report



SELECT type, COUNT(id) AS count, event_date
FROM event
WHERE MONTH(event_date)=2
GROUP BY 1;        									-- Group by 1 e.g. group by first selected column, e.g. type



-- Comment Report



SELECT e.name, e.surname, COUNT(DISTINCT(c.id)) AS comment_count
FROM employee AS e
LEFT JOIN post_comment AS c ON e.id=c.creatorID    					-- Left join to ensure ALL employees are presented and for these count of comment ccalculated, these ensures that even if employee did not comment, it will be selected with count 0
GROUP BY e.id;




-- Number 1 and 2



SELECT e.name, e.surname, e.email 
FROM employee AS e
RIGHT JOIN post_comment AS c ON c.creatorID=e.id
RIGHT JOIN post_status AS s ON s.creatorID=e.id
GROUP BY e.id
ORDER BY (COUNT(DISTINCT(c.id))+COUNT(DISTINCT(s.id))) DESC
LIMIT 2;




-- Most Controversial Employee
SELECT e.name,e.surname,e.email   						   	-- display only employee name, surname and email
FROM employee AS e
RIGHT JOIN post_status AS s ON s.creatorID=e.id
WHERE s.id = (SELECT statusID  								-- nested function returns the statusID that corresponds to the highest number of comments
  FROM post_comment
  GROUP BY statusID
  HAVING COUNT(*)= (SELECT COUNT(id)     						 -- nested functions returns the highest number of comments for each statusID
                    FROM post_comment 
                    GROUP BY statusID 
                    ORDER BY COUNT(id) 
                    DESC 
                    LIMIT 1) 
             );













