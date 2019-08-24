-- insert.sql
--
-- Submitted by: Jelena Lor - 


-- 

INSERT INTO employee (name,surname,sex,dateOfBirth,email) VALUES ('Rachel','Green','F','1989-01-10','rachel_green@friends.com');
INSERT INTO employee (name,surname,sex,dateOfBirth,email) VALUES ('Monica','Geller','F','1989-05-20','monica_geller@friends.com');
INSERT INTO employee (name,surname,sex,dateOfBirth,email) VALUES ('Chandler','Bing','M','1989-10-15','chandler_bing@friends.com');



INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (1,'Going to work trip to Spain, yaay!','2018-10-12 10:00:00');
INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (1,'Happy Birthday Chandler!','2018-10-15 10:00:00');
INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (1,'So happy to work with Chandler on the next project','2018-10-30 12:00:00');

INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (2,'Passed my exams, yaay!','2018-10-10 09:00:04');
INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (2,'Signed up to Business event on 18th Jan','2018-11-25 10:09:12');
INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (2,'Got promoted!','2018-12-10 11:33:03');

INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (3,'Attending Social on 11th Jan..','2018-12-20 11:45:08');
INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (3,'Check out this article','2019-01-10 09:45:07');
INSERT INTO post_status (creatorID,status_text,status_timestamp) VALUES (3,'Let the holiday begin!','2019-01-15 20:45:23');



INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,1,'Have a great trip!','2018-10-12 09:04:00');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (1,1,'Thanks!','2018-10-12 17:43:12');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,2,'Happy Birthday!','2018-10-15 16:09:40');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (3,2,'Thank you','2018-10-16 17:20:30');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (3,3,'Me too!','2018-10-30 14:34:40');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,3,'Jealous!','2018-10-30 16:03:45');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (1,4,'Congratualtions!','2018-10-11 18:09:34');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,4,'Well Done','2018-10-10 18:34:23');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (1,5,'Me too','2018-11-25 15:07:34');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,5,'See you there','2018-11-25 16:38:23');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (1,6,'Congratulations!','2018-12-10 18:45:09');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (3,6,'Congrats!','2018-12-10 18:25:09');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (1,7,'Me too','2018-12-21 15:45:09');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (3,7,'See you there', '2018-12-21 19:45:09');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,8,'Great info, thanks!','2019-01-11 18:55:09');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (3,8,'Thanks','2019-01-11 13:45:09');

INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (1,9,'Have a great time','2019-01-15 14:25:09');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (2,9,'Enjoy!','2019-01-15 18:45:09');
INSERT INTO post_comment (creatorID,statusID,comment_text,comment_timestamp) VALUES (3,9,'Thanks','2019-01-15 20:27:09');



INSERT INTO likeComment (employeeID,commentID) VALUES (1,1);
INSERT INTO likeComment (employeeID,commentID) VALUES (1,5);

INSERT INTO likeComment (employeeID,commentID) VALUES (2,2);
INSERT INTO likeComment (employeeID,commentID) VALUES (2,7);

INSERT INTO likeComment (employeeID,commentID) VALUES (3,15);
INSERT INTO likeComment (employeeID,commentID) VALUES (3,18);




INSERT INTO likeStatus (employeeID,statusID) VALUES (1,4);
INSERT INTO likeStatus (employeeID,statusID) VALUES (1,5);

INSERT INTO likeStatus (employeeID,statusID) VALUES (2,1);
INSERT INTO likeStatus (employeeID,statusID) VALUES (2,2);

INSERT INTO likeStatus (employeeID,statusID) VALUES (3,6);
INSERT INTO likeStatus (employeeID,statusID) VALUES (3,2);



INSERT INTO event (creatorID,type,description,event_date,event_time,location) VALUES (2,'Business','Suppliers Hospitality Event','2018-01-18','14:00:00','KING''S COLLEGE LONDON, STRAND CAMPUS');    -- use double '' for King's to treat ' as special character instead of closing quotation
INSERT INTO event (creatorID,type,description,event_date,event_time,location) VALUES (2,'Business','Customers Hospitality Event','2019-01-25','20:00:00','KING''S COLLEGE LONDON, STRAND CAMPUS');    -- intentionally left the date to be 2019, e.g. in the future in order to display for VIEW task
INSERT INTO event (creatorID,type,description,event_date,event_time,location) VALUES (2 ,'Business','Market Update Event','2018-02-08','14:00:00','KING''S COLLEGE LONDON, STRAND CAMPUS');	      -- intentionally created all events in the past to enable to check the VIEW UPDATE (to change the past date be in the future) did not amend the underling data in table

INSERT INTO event (creatorID,type,description,event_date,event_time,location) VALUES (3,'Social','First post New Year Social','2018-01-11','18:00:00','KING''S COLLEGE LONDON, GUY''S CAMPUS');
INSERT INTO event (creatorID,type,description,event_date,event_time,location) VALUES (3,'Social','Company''s Annual Ball','2018-02-01','18:00:00','KING''S COLLEGE LONDON, GUY''S CAMPUS');
INSERT INTO event (creatorID,type,description,event_date,event_time,location) VALUES (3,'Social','Company''s Annual Networking Event','2018-02-15','18:00:00','KING''S COLLEGE LONDON, GUY''S CAMPUS');





