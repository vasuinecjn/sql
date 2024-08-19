create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries 
values 
('A','Bangalore','A@gmail.com',1,'CPU'),
('A','Bangalore','A1@gmail.com',1,'CPU'),
('A','Bangalore','A2@gmail.com',2,'DESKTOP'),
('B','Bangalore','B@gmail.com',2,'DESKTOP'),
('B','Bangalore','B1@gmail.com',2,'DESKTOP'),
('B','Bangalore','B2@gmail.com',1,'MONITOR');

with total_visit as (
  select name, count(1) as total_visit from entries group by name
)
,most_visited_floor as (
  select name, floor as most_visited_floor from (
    select name, floor, rank() over(partition by name order by count(1) desc) as rnk from entries group by name, floor
  ) as x where rnk = 1
)
,resources_used as (
  select name, group_concat(resources) as resources from (select distinct name, resources from entries )x group by name
)
select tv.name, mv.most_visited_floor, tv.total_visit, ru.resources as resources_used 
from total_visit tv inner join most_visited_floor mv inner join resources_used ru 
on tv.name = mv.name and tv.name = ru.name
  
