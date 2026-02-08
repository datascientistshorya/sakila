-- WITH cte_name AS (
    -- SELECT ...
-- )
-- SELECT *
-- FROM cte_name;

-- Customers with total rentals
WITH rental_counts AS (
    SELECT customer_id, COUNT(*) AS total_rentals
    FROM rental
    GROUP BY customer_id)
    select c.first_name, c.last_name, rc.total_rentals from customer c
    inner join rental_counts as rc on
    rc.customer_id=c.customer_id;
    
    -- Films rented more than average
   WITH film_rentals AS (
    SELECT inventory.film_id, COUNT(*) AS rental_count
    FROM rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    GROUP BY inventory.film_id
)
SELECT f.title, fr.rental_count
FROM film f
JOIN film_rentals fr ON fr.film_id = f.film_id
WHERE fr.rental_count >
    (SELECT AVG(rental_count) FROM film_rentals);

-- windows function 
-- function() OVER (
--    PARTITION BY column
--    ORDER BY column
-- ) -- 

-- Running rentals per customer
select customer_id, rental_date,
count(*) over(partition by customer_id order by rental_date ) as running_count
from rental;

-- Rank customers by total rentals
select customer_id,count(*) as total_rentals,
rank () over (order by count(*) desc) as rental_rank
from rental
group by customer_id;

-- 1️⃣ ROW_NUMBER() Number rentals per customer (in order)
SELECT
    rental_id,
    customer_id,
    rental_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS rental_number
FROM rental;

-- DENSE_RANK() Same ranking, no skipped ranks, If two customers tie for rank 1 → next rank is 2.
SELECT
    customer_id,
    COUNT(*) AS total_rentals,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rental_rank
FROM rental
GROUP BY customer_id;

-- 5️⃣ SUM() OVER() Running payment amount per customer 
SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS running_amount
FROM payment;

-- 6️⃣ AVG() OVER() Average payment amount so far
SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    AVG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS avg_amount_so_far
FROM payment;

-- 7️⃣ LAG() Use: Previous row value Previous payment amount
SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS prev_amount
FROM payment;

-- 8️⃣ LEAD() Use: Next row value Next payment amount
SELECT
    payment_id,
    customer_id,
    payment_date,
    amount,
    LEAD(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS next_amount
FROM payment;


-- query tuning  
show index from rental;
EXPLAIN
SELECT *
FROM rental
WHERE customer_id = 10;

explain
SELECT
    customer_id,
    COUNT(*) AS total_rentals,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rental_rank
FROM rental
GROUP BY customer_id;

explain
SELECT
    rental_id,
    customer_id,
    rental_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY rental_date
    ) AS rental_number
FROM rental;


