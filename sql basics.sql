-- creating a new database
create database comapny;
-- it is better to write: create database  databas_name if exists;
create database if not exists comapny;
show databases;
drop database comapny;
drop database if exists school;
-- table related commands


-- multi line comment

create database if not exists sql_practice;
use sql_practice;
/*create table table_name(
column name dtype constraint,
column name dtype constraint,
column name dtype constraint,
column name dtype constraint
);
*/
create table company(
department_id int primary key auto_increment,
department_name varchar(20)
);
insert into company (department_name) values
('Sales'),('Marketing'),('HR'),('Front Desk'),('backend'),('developer'),('Cafeteria');
select * from company;

-- renaming table :: rename table old_tableName to new table_name
rename table company to departments;
rename table departments to company;
show tables;
use sakila;
show tables;
use sql_practice;
desc table company;

-- drop table to delete table
drop table if exists worker;
drop table company;
create table if not exists company(
department_id int primary key auto_increment,
department_name varchar(20)
);
insert into company (department_name) values
('Sales'),('Marketing'),('HR'),('Front Desk'),('backend'),('developer'),('Cafeteria');
select * from company;

-- truncate deletes all data from the table but keeps the table
truncate table company;
select * from company;
insert into company (department_name) values
('Sales'),('Marketing'),('HR'),('Front Desk'),('backend'),('developer'),('Cafeteria');
select * from company;

-- alter command
create table if not exists emp(
emp_id int primary key,
name varchar(20),
age smallint
);
insert into emp(emp_id,name,age) values
(1,'shorya',23),
(2,'kavita',21),
(3,'rahul',34),
(4,'vijay',54);
select* from emp;
rename table emp to workers;

show tables;
describe workers;

-- Alter commands
-- they are used to change the structure of an existing table in a database, like adding/deleting/removing or changing a columns's dat type.
rename table workers to emp;

-- Adding a column
alter table emp
add column salary int not null default 20000;
select* from emp;
alter table emp
add column location varchar(15),
add column nationality varchar(15) default 'India';
select* from emp;
describe emp;

alter table emp
add column email varchar(30) after name;
update emp
set email='shorya.b@gmail.com' where emp_id=1;
update emp 
set email='k.bisht' where name='kavita';
select * from emp;
alter table emp
modify designation varchar(20) default 'backend' after salary;

-- deleting a column
alter table emp
drop column location;
select * from emp;


alter table emp
add column dateofjoining date default '2025-12-01' after designation;

alter table emp
change dateofjoining doj date;
select* from emp where name='shorya';
/* to change existing column's data tye or constraint, use MODIFY
syntax: alter table table_name
modify column name new dtype new constraint
*/

alter table emp
modify salary varchar(15),
modify name varchar(30) not null;
describe emp;
select * from emp;
insert into emp (emp_id,name,email,age,salary,designation,doj,nationality)
values (5,'gopi','gopi@xyz.com',45,'67000','HR','2021-01-01','USA');
alter table emp
modify emp_id int auto_increment;
INSERT INTO emp (name, email, age, salary, doj)
VALUES ('John Doe', 'john.doe@email.com', 30, '50000', '2024-05-20');
select * from emp;
alter table emp
change name emp_name varchar(20);
alter table emp
change emp_name name varchar(20) not null;
describe emp;
select* from emp;