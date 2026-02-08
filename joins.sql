-- Show movie title + actor first name + last name 👉 Limit to 15 rows
select a.first_name,a.last_name, f.title from film_actor fa
inner join actor a on a.actor_id=fa.actor_id
inner join film f on f.film_id=fa.film_id limit 15;

-- 2️⃣ Show all actors for the movie "ACADEMY DINOSAUR"
select a.first_name,a.last_name from film_actor fa
inner join actor a on a.actor_id=fa.actor_id
inner join film f on f.film_id=fa.film_id where f.title="ACADEMY DINOSAUR";

-- 3️⃣ Show customer full name + city + country
select c.first_name,c.last_name,ci.city, co.country from customer c 
inner join address a on c.address_id=a.address_id
inner join city ci on a.city_id=ci.city_id
inner join country co on co.country_id=ci.country_id;

-- 4️⃣ Show number of customers per country
select co.country, count(c.customer_id) as NO_OF_COSTUMERS from customer c 
inner join address a on c.address_id=a.address_id
inner join city ci on a.city_id=ci.city_id
inner join country co on co.country_id=ci.country_id
group by co.country_id;

-- 5️⃣ Show rental_id, customer_id, rental_date, amount
select r.rental_id, r.customer_id, r.rental_date, p.amount from rental r 
inner join payment p on r.rental_id=p.rental_id
order by r.rental_id;

-- Total amount paid per customer
select c.first_name,c.last_name, sum(p.amount) from payment p
inner join customer c on p.customer_id=c.customer_id
group by c.customer_id;

-- 7️⃣ Top 5 customers by total payment
select c.first_name,c.last_name, sum(p.amount) from payment p
inner join customer c on p.customer_id=c.customer_id
group by c.customer_id
order by sum(p.amount) desc limit 5;

-- Show movie title and language name
SELECT
    f.title AS movie_title,
    l1.name AS language,
    l2.name AS original_language
FROM film f
JOIN language l1
    ON f.language_id = l1.language_id
LEFT JOIN language l2
    ON f.original_language_id = l2.language_id;

-- Show rental_id, rental_date, and movie title
select r.rental_id, r.rental_date, f.title from rental r
inner join inventory i on i.inventory_id=r.inventory_id
inner join film f on f.film_id=i.inventory_id;

-- Show customer name, rental date, store_id
select r.rental_date, c.first_name, c.last_name, s.store_id from rental r 
inner join customer c on r.customer_id=c.customer_id
inner join inventory i on i.inventory_id=r.inventory_id
inner join store s on i.store_id=s.store_id;

-- Show staff name and number of rentals handled
select s.first_name,s.last_name, count(r.rental_id) as rentals_handled from rental r 
inner join staff s on s.staff_id=r.staff_id
group by s.staff_id;

-- Show store_id and number of films available
select s.store_id, count(i.film_id) from inventory i
inner join store s on s.store_id=i.store_id
group by s.store_id;