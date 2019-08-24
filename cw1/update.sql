-- update.sql
--
-- Submitted by: Jelena Lor -- 



-- Update Events



UPDATE event
SET type='Social'
WHERE event_time >= '17:00:00';



-- Update Comments
UPDATE post_comment, post_status
SET comment_timestamp = TIMESTAMPADD(MINUTE,1,(SELECT status_timestamp  		 -- Add one minutes to found date
				FROM post_status                        		-- find the date where id in post_status table is equal to statusID in post_comment table
				WHERE post_comment.statusID=post_status.id))

WHERE post_comment.comment_timestamp<=post_status.status_timestamp;  			-- find any comment where the date and time is before the status creation date and time


