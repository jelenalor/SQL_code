-- delete.sql
--
-- Submitted by: Jelena Lor
-- 
-- 


-- Deletion process is structured in specific order to ensure any table with the 
-- foreign key are deleted first and the table with primary key representing the 
-- employee id is deleted last. This is to not violate the foreign key dependencies
-- The same result can be achieved by adding ON DELETE CASCADE, ON UPDATE CASCADE when table is created, however for purposes of coursework the deletion was performed as per 
-- below to demonstrate in depth understanding of the knowledge of the deletion process and Foreign Key Dependencies.




DELETE FROM event
WHERE creatorID = (SELECT id FROM employee WHERE email='chandler_bing@friends.com');   -- Delete first as no dependencies


DELETE FROM likeComment
WHERE employeeID = (SELECT id FROM employee WHERE email='chandler_bing@friends.com') OR  					-- Delete Like made by controversial employee
commentID IN (SELECT id FROM post_comment WHERE creatorID=(SELECT id FROM employee WHERE email='chandler_bing@friends.com'));   -- Delete any likes for comment that was made by controversial employee


DELETE FROM likeStatus
WHERE employeeID = (SELECT id FROM employee WHERE email='chandler_bing@friends.com') OR
statusID IN (SELECT id FROM post_status WHERE creatorID=(SELECT id FROM employee WHERE email='chandler_bing@friends.com'));	-- Delete any likes for status that was created by controversial employee


DELETE FROM post_comment
WHERE creatorID = (SELECT id FROM employee WHERE email='chandler_bing@friends.com') OR						
statusID IN (SELECT id FROM post_status WHERE creatorID=(SELECT id FROM employee WHERE email='chandler_bing@friends.com'));	-- Delete any comments that may have been made by any employee but which 
																-- relate to status that was created by controversial employee



DELETE FROM post_status
WHERE creatorID = (SELECT id FROM employee WHERE email='chandler_bing@friends.com'); 


DELETE FROM employee
WHERE email='chandler_bing@friends.com';  




