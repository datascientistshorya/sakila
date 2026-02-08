create database ecommerce_db;
use ecommerce_db;
/* Create a table customers with:
customer_id (INT, primary key)
first_name (VARCHAR 50)
last_name (VARCHAR 50)
email (VARCHAR 100)
created_at (DATE)*/
create table customers(
customer_id INT primary key,
first_name VARCHAR (50),
last_name VARCHAR (50),
email VARCHAR (100),
created_at DATE
);
-- Modify the customers table so that customer_id becomes AUTO_INCREMENT.
alter table customers
modify customer_id int auto_increment;
describe customers;

/* Create a table products with:
product_id (INT, primary key)
product_name (VARCHAR 100)
price (DECIMAL 8,2)
stock_qty (INT) */

create table products(
product_id int primary key,
product_name varchar(30),
price decimal (8,2),
stock_qty int);

-- 5. Add a category column (VARCHAR 50) to the products table.
alter table products
add column category varchar(50);
describe products;

-- 6. Add a UNIQUE constraint to the email column in customers.
alter table customers
modify email varchar(50) unique;
describe customers;

/*Create a table orders with:
order_id (INT, PK, AUTO_INCREMENT)
customer_id (INT)
order_date (DATE)
order_status (VARCHAR 20)*/

create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
order_status varchar(20));
describe orders;

-- 8. Add a foreign key constraint on orders.customer_id referencing customers.customer_id.customers
alter table orders
add constraint fk
foreign key (customer_id)
references customers(customer_id);

/*Create a table order_items with:
order_item_id (INT, PK)
order_id (INT)
product_id (INT)
quantity (INT)*/

create table order_items(
order_item_id int primary key,
order_id int,
product_id int,
quantity int);

/* Add foreign keys in order_items referencing:
orders(order_id)
products(product_id)*/

alter table order_items
add constraint fk1 
foreign key (order_id)
references orders(order_id),
add constraint fk2
foreign key(product_id)
references products(product_id);
describe order_items;

-- 11. Add a column phone_number (VARCHAR 15) to customers.
alter table customers
add column phone_number varchar(15);

-- 12. Rename column phone_number to mobile_number.
alter table customers
rename column phone_number to mobile_number;
describe customers;

-- 13. Change datatype of order_status to VARCHAR(30).
alter table orders
modify order_status varchar(30);

-- 14. Add a NOT NULL constraint to product_name.
alter table products
modify product_name varchar(30) not null;
describe products;

-- 15. Remove the category column from products.
alter table products
drop category;

-- 16. Rename the table customers to users.
rename table customers to users;

-- 17. Add a column last_login (DATETIME) to users.
alter table users
add column last_login datetime;

-- 18. Drop the foreign key constraint from orders.
describe orders;

alter table orders
drop foreign key fk;

describe orders;
ALTER TABLE orders
DROP FOREIGN KEY orders_ibfk_1;

show create table orders;

-- 19. Truncate the order_items table.
truncate table order_items;

-- 20. Drop the order_items table completely.
drop table order_items;

/* Create a table payments with:
payment_id (PK)
order_id (FK)
payment_mode (VARCHAR 20)
payment_status (VARCHAR 20)
Ensure payment_status only allows: 'SUCCESS', 'FAILED', 'PENDING'
(Hint: CHECK constraint in MySQL*/

create table payments(
payment_id int primary key,
order_id int, 
payment_mode varchar(20),
payment_status varchar(20),
constraint chk_stat
check (payment_status in ('SUCCESS', 'FAILED', 'PENDING'))
);
create table colors(
color enum('red', 'green','blue'));
 describe users;
 insert into users (customer_id,first_name,last_name) values
 (1,'kavita','bisht');
 
 insert into colors values
 ('red'),
 ('green'),
 ('blue');
 select*from colors;
 
 alter table colors
 add column customer_id int;
 describe colors;
 alter table colors
 add constraint foreignkey
 foreign key (customer_id)
 references users(customer_id);
 describe emp;
 select* from emp limit 10;
 insert into emp (emp_name, salary)
 values ('ramu',100000);
 select * from emp order by emp_id desc limit 5; 
 update emp 
 set emp_name = 'gangu bai' where emp_id=102;
 select *from actor limit 10;
 select *from film limit 10;
 show databases;
 drop database students;

 drop database students_new ;