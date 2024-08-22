CREATE TABLE STORES (
Store varchar(10),
Quarter varchar(10),
Amount int);

INSERT INTO STORES (Store, Quarter, Amount)
VALUES ('S1', 'Q1', 200),
('S1', 'Q2', 300),
('S1', 'Q4', 400),
('S2', 'Q1', 500),
('S2', 'Q3', 600),
('S2', 'Q4', 700),
('S3', 'Q1', 800),
('S3', 'Q2', 750),
('S3', 'Q3', 900);


--method1: 1+2+3+4 = 10 
select store, concat("Q", 10 - sum(cast(right(quarter,1) as signed))) as missing_quarter from stores group by store;

--method2: cross join all the combination
with cte as (
    select distinct s1.store, s2.quarter from stores s1, stores s2 
)
select q.* from cte q left join stores s on q.store = s.store and q.quarter = s.quarter where s.quarter is null order by q.store

