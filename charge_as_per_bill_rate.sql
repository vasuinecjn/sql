/*
will be solving it using Analytical function. You will learn how to use Lead analytical function with partition by clause and how to deal with data ranges in SQL.
*/

create table billings 
(
emp_name varchar(10),
bill_date date,
bill_rate int
);

insert into billings values
('Sachin','1990-01-01',25)
,('Sehwag' ,'1989-01-01', 15)
,('Dhoni' ,'1989-01-01', 20)
,('Sachin' ,'1991-05-01', 30)
;

create table HoursWorked 
(
emp_name varchar(20),
work_date date,
bill_hrs int
);
insert into HoursWorked values
('Sachin', '1990-01-07' ,3)
,('Sachin', '1990-01-08', 5)
,('Sehwag','1990-01-07', 2)
,('Sachin','1991-01-07', 4)


