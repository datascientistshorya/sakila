-- getting familioar with sakil DB
show tables;
-- description of tables
describe staff_list;
-- viewing first 10 movies
select* from film limit 10;
-- 4️⃣ Show only movie titles & rental rates
select title, rental_rate from film limit 6;
-- 5️⃣ Find all movies with rental rate = 0.99
select title from film where rental_rate =0.99;
-- — Filtering & Sorting 
-- ️⃣ Movies longer than 120 minutes
select title from film where length>120;
-- 7️⃣ Sort movies by length (longest first)
select *from film order by length desc;
-- 8️⃣ Movies released after 2005
select title from film where release_year>2005;
-- 9️⃣ Total number of movies
select count(*) from film;
-- 🔟 Average rental rate
select avg(rental_rate) from film as avg_rent;
-- 1️⃣1️⃣ Number of movies per rating
select rating, count(*) as movie_count 
from film group by rating;
-- 1️⃣2️⃣ Which actors acted in which movies?
select a.first_name, a.last_name, f.title from film_actor ac
inner join actor a on a.actor_id=ac.actor_id
inner join film f on f.film_id=ac.film_id;
-- 1️⃣3️⃣ List customers with their city
select c.first_name,c.last_name, ci.city
from customer c inner join address a on c.address_id= a.address_id
inner join city ci on a.city_id=ci.city_id;
-- 1️⃣4️⃣ Total payments made by each customer
select customer_id, sum(amount) from payment group by customer_id;
-- 1️⃣5️⃣ Top 5 highest-paying customers
select customer_id, sum(amount) from payment group by customer_id order by sum(amount) desc limit 5;
-- 1️⃣ Count total customers
select count(*) as total_customer from customer;
-- 2️⃣ Find the most expensive rental rate
select max(rental_rate) as top_rent from film;
-- 3️⃣ Find total payments collected
select sum(amount) tot_payment from payment;
-- 4️⃣ Show number of rentals per customer
select customer_id, count(rental_id) as tot_rental from rental group by customer_id;
