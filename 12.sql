create database school;
use school;
create table city(
city_id int primary key,
name varchar(20)
);
create table student(
id int primary key,
name varchar(20),
city_id int,
foreign key (city_id) references city(city_id)
on update cascade
on delete cascade
);
insert into city(city_id,name)
values 
(1,'delhi'),
(2,'mumbai'),
(3,'chennai'),
(4,'kolkata');
select *from city;
insert into student (id,name,city_id)
values
(1,'sunny',1),
(2,'shorya',1),
(3,'kavita',2),
(4,'kanchan',4),
(5,'asha',3),
(6,'devina',2);
select * from student;
insert into student (id,name,city_id) values
(7,'ram',3);
delete from city where city_id=1;
select * from student;
update city set name='nainital' where city_id=2;
select * from city;
select * from student;

update city set name='almore' where city_id=3;
update city set city_id=1500 where name='nainital';
update city set city_id = 10 where city_id=3;
select * from city;