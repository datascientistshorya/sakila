-- Count rentals per customer (on every row)Show:rental_id,customer_id,rental_date,total rentals made by that customer (repeat on every row)

select customer_id,rental_id,rental_date,
count(*) over (partition by customer_id) as total_rentals
from rental; 

-- Total payments per customer For every payment row, show:payment_id,customer_id,amount,total amount paid by that customer
select customer_id, payment_id, amount,
sum(amount) over (partition by customer_id) as total_amount 
from payment;

-- Number of films per rating For every film, show:film_id,title,rating,,total films with the same rating

select film_id,title,rating,
count(*) over (partition by rating) as  total_films
from film;

-- 4️⃣ Total rentals per storeFor each rental row, show:rental_id,inventory_id,store_id,total rentals from that store
select i.store_id,r.inventory_id, r.rental_id,
count(*) over (partition by store_id) as total_rentals
from rental r
inner join inventory i on
r.inventory_id=i.inventory_id;

-- Count of actors per filmFor each film-actor row, show:film_id,actor_id,total actors in that film
select film_id, actor_id,
count(actor_id) over (partition by film_id) as total_actors
from film_actor;

-- total lms per category:or each film-category row, show:film_id,category_id,total films in that category
select film_id,category_id, 
count(film_id) over (partition by category_id) as total__films
from film_category;

-- Average rental rate per ratingFor each film, show:title,rating,rental_rate,average rental rate of that rating
select title,rating,rental_rate,
avg(rental_rate) over (partition by rating) as avg_rental
from film;

-- Order of rentals per customerShow:rental_id,customer_id,rental_date,rental number for that customer (1st, 2nd, 3rd…)
select customer_id, rental_id, rental_date,
row_number() over (partition by customer_id order by rental_date) as running_count
from rental;

-- Latest rental per customerFor each rental row, show:customer_id,rental_id,rental_date,rank of rental (latest = 1)
select customer_id,rental_id,rental_date,
rank() over(partition by customer_id order by rental_date desc) as rankOfRental
from rental;

-- Running total of payments per customerShow:payment_id,customer_id,payment_date,amount,running total of amount paid by that customer (ordered by date)
select customer_id,payment_id, payment_date, amount,
sum(amount) over (partition by customer_id order by payment_date) as running_total
from payment;

-- Rank films by rental_rate within ratingShow:title,rating,rental_rate,rank within the same rating (highest rate first)
select title,rating,rental_rate,
dense_rank() over (partition by rating order by rental_rate desc) as rank_within_rating
from film;

-- First rental date per customer

-- For each rental row, show:customer_id,rental_id,rental_date,earliest rental date of that customer
select customer_id,rental_id,rental_date,
min(rental_date) over (partition by customer_id ) as earliest_rentals
from rental;

-- Number of rentals per day (on each row)Show:rental_id,rental_date,total rentals on that date
select rental_id, rental_date,
count(*) over (partition by date(rental_date) ) as tot_rentals
from rental;

-- Payment rank per customerShow:payment_id,customer_id,amount,rank of payment amount per customer (highest first)
select * from(
select customer_id,  sum(amount),
rank() over(order by sum(amount) desc) as tot_payment_rank
from payment
group by customer_id) as ranked_customers;

-- Previous rental date per customerShow:rental_id,customer_id,rental_date,previous rental date of the same customer
select customer_id, rental_id, rental_date,
lag(rental_date) over (partition by customer_id order by rental_date) as previous_rental
from rental;

-- Days between rentals per customerShow:rental_id,customer_id,rental_date,days since previous rental
select customer_id,rental_id,rental_date,
datediff(rental_date,lag(rental_date)
over (partition by customer_id order by rental_date)) as days_since_last_rental
from rental;

-- Difference between current and previous paymentShow:payment_id,customer_id,payment_date,amount,difference from previous payment amount
select customer_id,payment_id,payment_date,amount,
amount-lag(amount) over (partition by customer_id order by payment_date) as amount_difference
from payment;

-- 1️⃣8️⃣ Top 3 most rented filmsShow:film_id,title,total rentals,rank by rental count
SELECT
    film_id,
    title,
    total_rentals,
    rental_rank
FROM (
    SELECT
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS total_rentals,
        dense_rank() OVER (
            ORDER BY COUNT(r.rental_id) DESC
        ) AS rental_rank
    FROM film f
    JOIN inventory i ON i.film_id = f.film_id
    JOIN rental r ON r.inventory_id = i.inventory_id
    GROUP BY f.film_id, f.title
) ranked_films
WHERE rental_rank <= 5;

-- Most recent rental per customer (single row per customer)Return:customer_id,rental_id,rental_date

select customer_id,rental_id,
max(rental_date) over (partition by customer_id order by rental_date) as last_rental
from rental;

SELECT
    customer_id,
    rental_id,
    rental_date
FROM (
    SELECT
        customer_id,
        rental_id,
        rental_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY rental_date DESC
        ) AS rn
    FROM rental
) t
WHERE rn = 1;


SELECT
    customer_id,
    last_rental_date,
    average_rental_date
FROM (
    SELECT
        customer_id,
        MAX(rental_date) AS last_rental_date,
        AVG(rental_date) AS average_rental_date
    FROM rental
    GROUP BY customer_id
) t
WHERE last_rental_date > average_rental_date;


-- Count rentals per filmFor each rental row, show:rental_id,inventory_id,film_id,total rentals of that film
select i.film_id,r.rental_id,i.inventory_id,
count(*) over (partition by i.film_id) as total_rentals
from inventory i inner join 
rental r on
r.inventory_id=i.inventory_id;

-- 2️⃣ Average payment amount per customer,For each payment row, show:payment_id,customer_id,amount,average payment amount of that customer
select customer_id,payment_id, amount,
avg(amount) over (partition by customer_id order by payment_date) as avg_amount
from payment;

-- Total customers per storeFor each customer row, show:customer_id,store_id,total customers in that store
select s.store_id,c.customer_id,
count(r.customer_id) over (partition by c.customer_id) as total_customers
from store s 
inner join inventory i on
i.store_id=s.store_id
inner join rental r on
r.inventory_id=i.inventory_id
inner join customer c on
c.customer_id=r.customer_id;

SELECT
    customer_id,
    store_id,
    COUNT(*) OVER (
        PARTITION BY store_id
    ) AS total_customers_in_store
FROM customer;

-- 4️⃣ Count films per language,For each film row, show:film_id,title,language_id,total films in that language
select film_id,title,language_id,
count(*) over (partition by language_id) as total_films
from film;
SELECT
    original_language_id,
    COUNT(*) AS total_films
FROM film
GROUP BY original_language_id;
select* from language;
SELECT
    film_id,
    title,
    language_id,
    COUNT(*) OVER (PARTITION BY language_id) AS total_films_in_language
FROM film;

-- Maximum payment per customerFor each payment row, show:payment_id,customer_id,amount,maximum payment made by that customer
select customer_id,payment_id,amount,
max(amount) over (partition by customer_id) as max_payment
from payment;

-- Minimum rental rate per categoryFor each film-category row, show:film_id,category_id,minimum rental rate in that category
select f.film_id,c.category_id,
min(f.rental_rate) over (partition by c.category_id) as min_rental_rate
from film_category c 
inner join film f on
c.film_id=f.film_id;

-- Total rentals per staffFor each rental row, show:rental_id,staff_id,total rentals handled by that staff member
select rental_id,staff_id,
count(staff_id) over(partition by staff_id) as total_rentals
from rental;
select* from staff;

-- Rank customers by total paymentsShow:customer_id,payment_id,amount,rank of customer based on total payment amount
select customer_id,payment_id,amount,
dense_rank() over (ORDER BY SUM(amount) DESC) AS customer_rank
from payment; 