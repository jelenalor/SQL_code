-- schema.sql
--
-- Submitted by: Jelena Lor -- 


-- 

--Start by creating table with no foreign keys first to satisfy foreign key constraints--

-- Tables names: status, comment renamed to post_status and post_comment --> due to SQL Reserved words
-- Variable names: date, timestamp, time, text also renamed as in code below --> due to SQL Reserved words



CREATE TABLE employee (id INT NOT NULL AUTO_INCREMENT,                              	-- Start by creating table with no foreign keys to avoid foreign keys constraints 
name VARCHAR(20) NOT NULL,      						 	-- assume name is no longer than 20 characters
surname VARCHAR(20),       	
sex ENUM('F','M','N') NOT NULL,  						        -- F for female, M for male and N for neutral
dateOfBirth DATE, 
email VARCHAR(40) NOT NULL, 							        -- assume emails are no longer than 40 characters
PRIMARY KEY (id)
);



CREATE TABLE post_status (id INT NOT NULL AUTO_INCREMENT,				 -- post_status automatically increments +1 to produce unique primary key for table - the same for all other tables
creatorID INT NOT NULL, 
status_text VARCHAR(255) NOT NULL,							 -- Assume status text no longer than 255 characters 
status_timestamp DATETIME NOT NULL, 
PRIMARY KEY (id),
FOREIGN KEY (creatorID) REFERENCES employee(id) 	 -- Foreign Key (FK) Referential Action set to Cascade which means 
);                                                                                   	 -- if FK column is deleted or updated in the parent table, it will automatically be updated in child table too
											 -- the same for all below examples 


CREATE TABLE likeStatus (employeeID INT NOT NULL,
statusID INT NOT NULL,
PRIMARY KEY (employeeID,statusID),
FOREIGN KEY (employeeID) REFERENCES employee(id),
FOREIGN KEY (statusID) REFERENCES post_status(id)
);



CREATE TABLE event (id INT NOT NULL AUTO_INCREMENT,
creatorID INT NOT NULL, 
type ENUM("Business","Social") NOT NULL,      						
description VARCHAR(200) NOT NULL, 
event_date DATE NOT NULL, 
event_time TIME NOT NULL, 
location VARCHAR(200),
PRIMARY KEY(id), 
FOREIGN KEY (creatorID) REFERENCES employee (id)
);



CREATE TABLE post_comment (id INT NOT NULL AUTO_INCREMENT,   				-- Create post_comment table before likeComment table because likeComment table FK References post_comment id and 
creatorID INT NOT NULL, 								-- due to foreign key constrains FK can only reference the existent primary key (PK)
statusID INT NOT NULL, 
comment_text VARCHAR(255) NOT NULL, 
comment_timestamp DATETIME NOT NULL, 
PRIMARY KEY (id),
FOREIGN KEY (creatorID) REFERENCES employee(id),
FOREIGN KEY (statusID) REFERENCES post_status(id)
);



CREATE TABLE likeComment (employeeID INT NOT NULL,
commentID INT NOT NULL, 
PRIMARY KEY (employeeID, commentID),
FOREIGN KEY (employeeID) REFERENCES employee(id),
FOREIGN KEY (commentID) REFERENCES post_comment(id)
);



  