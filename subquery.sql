-- 1️⃣ Customers who have never rented a film
select first_name, last_name from customer
where customer_id not in(
select distinct customer_id from rental);

-- 2️⃣ Films that have never been rented
select title from film 
where film_id not in(
select distinct i.film_id from inventory i 
inner join rental r on
i.inventory_id=r.inventory_id);

-- 3️⃣ Customers who made at least one rental
select first_name,last_name from customer
where customer_id in( 
select distinct customer_id from rental);

-- 4️⃣ Customers who rented more than the average number of rentals
select c.first_name,c.last_name from customer c 
inner join rental r on r.customer_id=c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) >(
 SELECT AVG(rental_count)
    FROM (
        SELECT COUNT(*) AS rental_count
        FROM rental
        GROUP BY customer_id
    ) AS t
);

-- 5️⃣ Films with rental rate higher than the average rental rate
select title from film 
where rental_rate>(
select avg(rental_rate) from film);

-- 6️⃣ Customers who rented films from the Action category
SELECT DISTINCT c.first_name, c.last_name
FROM customer c
WHERE c.customer_id IN (
    SELECT r.customer_id
    FROM rental r
    JOIN inventory i
        ON r.inventory_id = i.inventory_id
    JOIN film_category fc
        ON i.film_id = fc.film_id
    JOIN category cat
        ON fc.category_id = cat.category_id
    WHERE cat.name = 'Action'
);


