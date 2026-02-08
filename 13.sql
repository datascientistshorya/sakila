create database sales;
create table customer(
customer_id int, 
name varchar(30),
primary key(customer_id)
);

create table orders(
order_id int primary key,
name varchar(50),
customer_id int,
order_date date,
foreign key (customer_id) references customer(customer_id)
);

insert into customer (customer_id,name) 
values
(1,'shorya'),
(2,'kavita'),
(3,'sunny'),
(4,'kanchan');
select * from customer;
insert into customer
values
(5,'ravi');
insert into orders (order_id,name,customer_id, order_date)
values
(101,'laptop',1,'2005-12-12'),
(102,'cell pone',1,'2024-08-31'),
(103,'flower pot',2,'2025-12-31');
select* from orders;

delete from customer
where customer_id=1;

select *from customer;
select* from orders;
insert into orders (order_id,name,customer_id, order_date)
values
(102,'cell pone',1,'2024-08-31'),
(103,'flower pot',2,'2025-12-31');

delete from orders where customer_id=2
;
select *from orders;
delete from customer where customer_id=2;
select *from customer;


