-- LEFT JOIN • Missing Data • Interview Traps

-- All customers with or without rentals
select c.first_name,c.last_name, count(r.customer_id) from rental r
left join customer c on c.customer_id=r.customer_id
group by c.customer_id;

SELECT
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r
    ON c.customer_id = r.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name;
    
-- Customers who have never rented
select c.first_name,c.last_name, count(r.rental_id) as total_rentals from customer c 
left join rental r on c.customer_id=r.customer_id
group by c.customer_id,c.first_name,c.last_name 
having count(r.rental_id)=0;

-- Show film title and inventory_id
select f.title, i.inventory_id from film f 
left join inventory i on i.film_id=f.film_id;

-- 4️⃣ Films that were never rented
SELECT
    f.film_id,
    f.title
FROM film f
LEFT JOIN inventory i
    ON f.film_id = i.film_id
LEFT JOIN rental r
    ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;

-- Stores with zero rentals
select s.store_id from store s
left join inventory i on i.store_id=s.store_id
left join rental r on r.inventory_id=i.inventory_id
GROUP BY s.store_id
having count(r.rental_id)=0;

-- 1️⃣ Customers with no rentals
select c.first_name,c.last_name from customer c
left join rental r on r.customer_id=c.customer_id
group by c.first_name,c.last_name 
having count(r.rental_id)=0;