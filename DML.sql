/* Data Manipulation language :iNSERT, update , DELETE 
CRUD OPERATIONS
CREATE, RETREIEVE, UPDATE, DELETE */

select * FROM EMP;
insert INTO EMP (NAME,EMAIL,AGE,SALARY,DOJ) values
('ram prasad','rp@yahoo.com',76,'20000','1985-12-20'),
('hari mohan','hm@rediff.com',67,'12000','2001-01-13');
select * from emp;
describe emp;
insert into emp (name,email) values
('vivek','abc@xyz.com');
insert into emp (name,email) values
('zorawar','zx@mymail.com');
insert into emp(name,nationality) values
('peter','spain');
insert into emp (name,nationality) values
('fuji','japan');
describe emp;
insert into emp (name,salary)
values ('gabbar',13000);
select * from emp;
insert into emp
values (14,'virat','v@gmail.com',33,2500,'gatekeeper','2024-12-01','sri lanka');
insert into emp
values (15,'virat','v@gmail.com',33,2500,'gatekeeper','2024-12-01','sri lanka');
insert into emp
values (16,'virat','v@gmail.com',33,'2500','gatekeeper','2024-12-01','sri lanka');
insert into emp
values (17,'ishant','v@gmail.com','33','12500','gatekeeper','2024-12-01','sri lanka');
insert into emp
values (18,'virat','v@gmail.com',33,'2500','gatekeeper','2024-12-01',9898);
delete from emp 
where emp_id>9;

insert into emp (name,salary)
values ('virat',45000); -- typecasting a number is being typecasted as a string

/*update table name
sets col1=value1,
.
.
.
coln=valuen 
where condition
without where all rows will be updated*/
update emp
set designation='sales'
where designation='front desk'
and emp_id is not null;

UPDATE emp
SET designation = 'sales'
WHERE designation = 'front desk'
AND emp_id IS NOT NULL;

alter table emp
modify salary int ;
describe emp;

update emp 
set salary = salary+salary*0.1
where emp_id=5;
select *from emp;
delete from emp where emp_id=19;
insert into emp (emp_id,name)
values (10,'virat');
insert into emp (name,age)
values ('virat',33);
set sql_safe_updates=0;
update emp
set designation='sales' 
where designation='HR';
update emp
set age = 18 where age is null;
update emp set designation='IT consultant';
update emp 
set salary =10000 where salary is null;
delete from emp where emp_id=20;
select* from emp;

/* **********************************
   IMPORTANT QUERY – DO NOT MODIFY
*********************************** */
alter table emp auto_increment=11;


insert into emp (name,email,nationality)
values
('sunny','s@xyz.com','France');

/*******************************
DQL Data Query Language:
instructions to retrieve data from databases, 
Select command to filter & return specific results from a SQL table
***************************************/
