create table emplpoyee(
emp_id int primary key auto_increment,
emp_name varchar(20) not null,
age int default 25,
gender varchar(10),
department varchar(30),
salary int default 30000,
shift varchar(20),
experience int,
city varchar(20)
);
rename table emplpoyee to employee;

INSERT INTO employee
(emp_name, age, gender, department, salary, shift, experience, city)
VALUES
('Amit',28,'male','HR',85000,'morning',8,'Delhi'),
('Neha',32,'female','admin',90000,'evening',9,'Pune'),
('Rahul',35,'male','IT',60000,'morning',7,'Mumbai'),
('Priya',29,'female','Finance',75000,'evening',6,'Kolkata'),
('Suresh',40,'male','Marketing',88000,'night',12,'Bangalore'),
('Anjali',26,'female','Sales',52000,'morning',4,'Chennai'),
('Rohit',31,'male','IT',58000,'evening',6,'Hyderabad'),
('Kiran',38,'male','Finance',98000,'morning',14,'Delhi'),
('Pooja',27,'female','HR',62000,'evening',5,'Pune'),
('Vikas',34,'male','Sales',56000,'evening',8,'Mumbai'),
('Sunita',30,'female','Marketing',70000,'morning',7,'Kolkata'),
('Manoj',45,'male','admin',140000,'night',20,'Bangalore'),
('Ritu',24,'female','HR',48000,'morning',2,'Chennai'),
('Deepak',36,'male','Finance',92000,'evening',11,'Hyderabad'),
('Kavita',33,'female','admin',88000,'morning',9,'Delhi'),
('Arjun',28,'male','IT',54000,'evening',4,'Pune'),
('Meena',39,'female','Sales',59000,'morning',10,'Mumbai'),
('Nitin',41,'male','Marketing',105000,'night',15,'Kolkata'),
('Shweta',29,'female','Finance',68000,'morning',6,'Bangalore'),
('Alok',52,'male','admin',175000,'night',26,'Chennai'),
('Rina',26,'female','HR',55000,'morning',3,'Hyderabad'),
('Sanjay',37,'male','Sales',62000,'evening',11,'Delhi'),
('Pankaj',34,'male','Finance',86000,'morning',10,'Pune'),
('Divya',22,'female','HR',45000,'evening',1,'Mumbai'),
('Tarun',31,'male','IT',61000,'morning',7,'Kolkata'),
('Seema',48,'female','admin',150000,'night',22,'Bangalore'),
('Aman',27,'male','Sales',53000,'morning',4,'Chennai'),
('Jyoti',35,'female','HR',78000,'evening',9,'Hyderabad'),
('Naveen',42,'male','Finance',115000,'night',17,'Delhi'),
('Kunal',24,'male','IT',47000,'morning',2,'Pune'),
('Bhavna',29,'female','Marketing',65000,'evening',5,'Mumbai'),
('Rakesh',38,'male','IT',72000,'morning',12,'Kolkata'),
('Isha',33,'female','Finance',84000,'evening',10,'Bangalore'),
('Gaurav',36,'male','Sales',61000,'morning',11,'Chennai'),
('Monika',41,'female','HR',98000,'night',16,'Hyderabad'),
('Ajay',55,'male','admin',200000,'night',30,'Delhi'),
('Pallavi',26,'female','HR',56000,'morning',3,'Pune'),
('Lokesh',34,'male','Marketing',73000,'evening',9,'Mumbai'),
('Sneha',28,'female','Sales',54000,'morning',5,'Kolkata'),
('Dinesh',44,'male','Finance',130000,'night',19,'Bangalore'),
('Komal',31,'female','HR',76000,'evening',7,'Chennai'),
('Harsh',23,'male','IT',42000,'morning',1,'Hyderabad'),
('Rekha',39,'female','Marketing',90000,'night',14,'Delhi'),
('Mahesh',46,'male','Sales',68000,'evening',21,'Pune'),
('Nisha',27,'female','Finance',60000,'morning',4,'Mumbai'),
('Yogesh',35,'male','IT',70000,'evening',10,'Kolkata'),
('Anita',52,'female','admin',165000,'night',25,'Bangalore'),
('Pradeep',29,'male','HR',62000,'morning',4,'Chennai'),
('Rohini',33,'female','Marketing',74000,'evening',8,'Hyderabad'),
('Siddharth',37,'male','Sales',65000,'morning',12,'Delhi'),
('Aakash',28,'male','IT',59000,'morning',5,'Pune'),
('Neetu',30,'female','HR',78000,'evening',6,'Mumbai'),
('Rohan',34,'male','Sales',62000,'morning',9,'Kolkata'),
('Pinky',32,'female','Finance',83000,'evening',9,'Bangalore'),
('Sameer',39,'male','Marketing',91000,'night',14,'Chennai'),
('Kajal',26,'female','HR',56000,'morning',3,'Hyderabad'),
('Vinod',41,'male','admin',120000,'night',17,'Delhi'),
('Sonal',29,'female','HR',60000,'evening',5,'Pune'),
('Irfan',36,'male','Sales',64000,'morning',11,'Mumbai'),
('Lata',52,'female','Finance',170000,'night',26,'Kolkata'),
('Ramesh',45,'male','admin',135000,'night',20,'Bangalore'),
('Priti',27,'female','HR',54000,'morning',2,'Chennai'),
('Nikhil',31,'male','IT',65000,'evening',7,'Hyderabad'),
('Alisha',35,'female','HR',82000,'morning',10,'Delhi'),
('Farhan',38,'male','Sales',67000,'evening',12,'Pune'),
('Swati',34,'female','Finance',86000,'morning',11,'Mumbai'),
('Ganesh',50,'male','admin',160000,'night',27,'Kolkata'),
('Reena',29,'female','Marketing',69000,'evening',6,'Bangalore'),
('Kapil',26,'male','IT',48000,'morning',2,'Chennai'),
('Mona',41,'female','HR',98000,'night',16,'Hyderabad'),
('Saurabh',37,'male','Sales',66000,'morning',12,'Delhi'),
('Puneet',55,'male','Finance',190000,'night',29,'Pune'),
('Shalini',24,'female','HR',46000,'evening',1,'Mumbai'),
('Abhishek',33,'male','IT',72000,'morning',9,'Kolkata'),
('Tanvi',28,'female','Marketing',61000,'evening',5,'Bangalore'),
('Rajat',44,'male','Sales',69000,'morning',20,'Chennai'),
('Nupur',36,'female','HR',83000,'evening',11,'Hyderabad'),
('Imran',39,'male','Finance',99000,'night',14,'Delhi'),
('Sheetal',31,'female','HR',64000,'morning',6,'Pune'),
('Vivek',48,'male','admin',155000,'night',23,'Mumbai'),
('Kritika',27,'female','Marketing',59000,'morning',4,'Kolkata'),
('Anwar',35,'male','Sales',63000,'evening',10,'Bangalore'),
('Sunil',52,'male','Finance',175000,'night',26,'Chennai'),
('Poonam',29,'female','HR',62000,'morning',6,'Hyderabad'),
('Mohsin',41,'male','admin',125000,'night',18,'Delhi'),
('Rashmi',33,'female','HR',66000,'evening',7,'Pune'),
('Sahil',38,'male','Sales',68000,'morning',13,'Mumbai'),
('Neelam',45,'female','Marketing',135000,'night',21,'Kolkata'),
('Tushar',26,'male','IT',52000,'morning',3,'Bangalore'),
('Geeta',55,'female','Finance',195000,'night',30,'Chennai'),
('Keshav',29,'male','IT',61000,'evening',6,'Hyderabad'),
('Manisha',34,'female','HR',79000,'morning',10,'Delhi'),
('Rituraj',41,'male','Finance',118000,'night',17,'Pune'),
('Sakshi',26,'female','HR',56000,'morning',3,'Mumbai'),
('Harpreet',38,'male','Sales',67000,'evening',12,'Kolkata'),
('Nandini',31,'female','Marketing',65000,'morning',7,'Bangalore'),
('Deependra',52,'male','admin',175000,'night',26,'Chennai'),
('Preeti',28,'female','HR',60000,'evening',5,'Hyderabad'),
('Jatin',45,'male','Sales',69000,'morning',21,'Delhi'),
('Usha',55,'female','Finance',198000,'night',30,'Pune');
select * from employee limit 10;

select emp_name,salary from  employee 
where gender='male' limit 10; 

/******************************************
Alias
*******************************************/
select emp_name as Name, salary as CTC from employee
where shift='morning';

select * from employee limit 5;
select emp_name as 'First Name ' from employee
where emp_name like 'A%';

/*******************************
OOPERATORS:
COMPARISON ><!=<=>=
lOGICAL and or not
SPECIAL  in beween like
IN IS LIKE MULTIPLE OR CONDITION is null
arithmetic +-* / %
LIKE OPERATOR % represents, multiple character _ for exactly 1character
********************************/
select distinct CITY FROM EMPLOYEE;
select *from employee
where age like '%2';
select* FROM EMPLOYEE;
describe EMPLOYEE;
select emp_name as 'name of the employee' from employee
where emp_name like 's%a';

select emp_name as 'name of the employee' from employee
where emp_name like '____';

select emp_name as 'name of the employee' from employee
where emp_name like 'A___';

select emp_name as 'name of the employee' from employee
where emp_name like '____a';

select emp_name as 'name of the employee' from employee
where emp_name like '_i%';

select city from employee
where city like '_____';

select emp_name as 'name of the employee' from employee
where emp_name like '__a%';


select emp_name as 'name of the employee' from employee
where emp_name like '_i%a';

select city from employee
where city like '%n_';

select * from employee
where salary+5000> 90000;

select distinct department, city 
from employee; -- shows unique combination of both coloumns

select distinct city from employee
order by city desc;

select distinct department,city from employee
order by department,city;

select distinct department,city from employee
order by city,department;

/******************
limit :- no of rows to be returned
offset: skip no. of rows
limit n offset n---> skip m rows & return n rows
******************/

select emp_name from employee
where gender='male' order by emp_name
limit 5 offset 2;

select * from employee where department='IT'
order by salary desc limit 3;