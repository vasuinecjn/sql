/*
Given the following two tables, return the fraction of users, rounded to two decimal places,
who accessed Amazon music and upgraded to prime membership within the first 30 days of signing up.  
*/
create table users
(
user_id integer,
name varchar(20),
join_date date
);
insert into users
values (1, 'Jon', CAST('2020-2-14' AS date)), 
(2, 'Jane', CAST('2020-2-14' AS date)), 
(3, 'Jill', CAST('2020-2-15' AS date)), 
(4, 'Josh', CAST('2020-2-15' AS date)), 
(5, 'Jean', CAST('2020-2-16' AS date)), 
(6, 'Justin', CAST('2020-2-17' AS date)),
(7, 'Jeremy', CAST('2020-2-18' AS date));


create table events
(
user_id integer,
type varchar(10),
access_date date
);

insert into events values
(1, 'Pay', CAST('2020-3-1' AS date)), 
(2, 'Music', CAST('2020-3-2' AS date)), 
(2, 'P', CAST('2020-3-12' AS date)),
(3, 'Music', CAST('2020-3-15' AS date)), 
(4, 'Music', CAST('2020-3-15' AS date)), 
(1, 'P', CAST('2020-3-16' AS date)), 
(3, 'P', CAST('2020-3-22' AS date));

select count(distinct case when datediff(e.access_date, u.join_date) <= 30 then u.user_id end) / count(distinct u.user_id) * 100 as upgraded_users from 
(select user_id, join_date from users where user_id in (select user_id from events where type='Music')) u left join events e
on u.user_id = e.user_id
and e.type = 'P'
