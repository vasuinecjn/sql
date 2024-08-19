-- find new and repeat customers:
create table customer_orders (
    order_id integer,
    customer_id integer,
    order_date date,
    order_amount integer
);

insert into customer_orders 
values
    (1,100,cast('2022-01-01' as date),2000),
    (2,200,cast('2022-01-01' as date),2500),
    (3,300,cast('2022-01-01' as date),2100),
    (4,100,cast('2022-01-02' as date),2000),
    (5,400,cast('2022-01-02' as date),2200),
    (6,500,cast('2022-01-02' as date),2700),
    (7,100,cast('2022-01-03' as date),3000),
    (8,400,cast('2022-01-03' as date),1000),
    (9,600,cast('2022-01-03' as date),3000);
    
with 
fvd as (
    select customer_id, min(order_date) as first_visit_date from customer_orders group by customer_id
)
,visit as (
    select co.*, fvd.first_visit_date 
    from customer_orders as co join fvd
    on co.customer_id = fvd.customer_id
)
select order_date, sum(case when order_date = first_visit_date then 1 else 0 end) as new_customer, sum(case when order_date <> first_visit_date then 1 else 0 end) as old_customer 
from visit
group by order_date







