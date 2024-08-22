/* recommendation system based on product pairs most commonly purchased together */
use practice;
create table orders
(
order_id int,
customer_id int,
product_id int,
);

insert into orders VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 4),
(3, 1, 5);

create table products (
id int,
name varchar(10)
);
insert into products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

select concat(p1.name,' ', p2.name) as pair, count(1) as frequency
from orders o1 inner join orders o2 on o1.order_id = o2.order_id
inner join products p1 on p1.id = o1.product_id
inner join products p2 on p2.id = o2.product_id
where o1.product_id > o2.product_id 
group by p1.name, p2.name 