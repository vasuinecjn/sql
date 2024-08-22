/*
leetcode hard problem 1369 . Where we need to find second most recent activity and if user has only 1 activoty then return that as it is. We will use SQL window functions to solve this problem.
*/

create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);

insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');

with activity_details as (
	select 
		*,
		count(1) over(partition by username) as total_activity_of_user,
		rank() over(partition by username order by startdate desc) as rnk
	from useractivity
)
select * from activity_details 
where rnk = 2 or total_activity_of_user = 1

