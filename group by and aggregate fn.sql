/*********************
aggragate functions
works on a set of values and return a single value,ignores null values
**********************
min(),max(),avg(),count(),
***********************/
select min(salary) as 'lowest salary' from employee;
select min(age) as  'Youngest Employee' from employee;
select min(salary) as 'lowest salary' from employee
where department='sales';

select department, avg(salary) from employee
group by department;

select avg(salary) from employee
where department = 'sales';

select city, count(emp_id) from employee
group by city;

select * from employee limit 5;
insert into employee (emp_name,gender)
values ('amit','male');
 select min(emp_name) as 'youngest emp' from employee;
 select emp_id from employee where emp_name='amit';
 
 select count(emp_id) as 'total employees', city
 from employee
 group by city;
 
 rename table employee to emp;
 drop table emp;

describe emp;

select avg(salary) as ' AVG salary ', department
from emp
group by department;

select sum(salary) as 'Total salary', department
from emp 
group by department order by 'Total salary' desc;


/*****************
SPLIT APPLY COMBINE
*****************/

select avg(AGE), CITY FROM EMP
group by CITY;
select* FROM EMP LIMIT 20;

select AVG(AGE), CITY, GENDER FROM EMP
GROUP BY CITY, GENDER;

/********************
WHERE BEFORE GROUP BY CAUSE SPLITTING IS DONE AS PER WHERE THEN ITEMS ARE GROUPED
****************************/
describe EMP;
select DEPARTMENT, MAX(SALARY) AS 'MAXIMUM CTC'
FROM EMP
WHERE DEPARTMENT NOT IN ('HR', 'FINANACE')
group by DEPARTMENT;
select city, department, count(*)
from emp
group by city, department
order by city; -- unique groups of city department, use order by when using combination for better output view

select city, department, count(*)
from emp
group by city, department
order by department;

select city, department, count(*)
from emp
group by city, department
order by city,department;

select department, shift, count(*)
from emp
group by department, shift
order by department, shift;