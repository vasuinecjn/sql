/*
Write a query to find a pid, name, number of friends, sum of marks of person who have friends with total score greater than 100.
*/
use practice;
drop table if exists friend;
create table friend (pid int, fid int);
insert into friend 
values 
(1,2),
(1,3),
(2,1),
(2,3),
(3,5),
(4,2),
(4,3),
(4,5);
drop table if exists person;
create table person (pid int, name varchar(50), score int);
values
(1,'Alice',88),
(2,'Bob',11),
(3,'Devis',27),
(4,'Tara',45),
(5,'John',63);


with person_friend_score as 
(
select f.pid, sum(p.score) as sum_friend_score, count(1) as num_friends from friend f inner join person p on f.fid = p.pid group by f.pid having sum(p.score) > 100
)
select pf.pid, p.name, pf.num_friends, pf.sum_friend_score from person_friend_score pf inner join person p on p.pid = pf.pid
