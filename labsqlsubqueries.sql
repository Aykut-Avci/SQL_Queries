-- 1.How many copies of the film Hunchback Impossible exist in the inventory system?

use sakila;


select t, s from
(select title as t, count(film_id) s from film join inventory using(film_id)
group by title) as sub
where t = 'HUNCHBACK IMPOSSIBLE';

-- 2. List all films whose length is longer than the average of all the films.

select title from film
where length > (select avg(length) mean from film);


-- 3.Use subqueries to display all actors who appear in the film Alone Trip.


select first_name, last_name from actor
where actor_id in (select actor_id from film_actor
where film_id = (select film_id from film
where title = 'ALONE TRIP'));


-- 4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film
where film_id in (select film_id from film_category 
where category_id = (select category_id from category
where name = 'Family'))

-- 5.Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, 
-- you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information. 


select first_name, last_name, email from customer
where address_id in (select address_id from address 
where city_id in (select city_id from city 
where country_id = (select country_id from country
where country = 'Canada')))


/* Optional. 6. Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
 First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.*/ 

select title from film
where film_id in 
(select film_id from film_actor
where actor_id = (select actor_id from film_actor
group by actor_id
order by count(film_id) desc
limit 1))


-- 7.Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
select title from film 
where film_id in 

(select film_id from inventory 
where inventory_id in (select inventory_id from rental
where customer_id = (select customer_id from payment
group by customer_id 
order by sum(amount) desc
limit 1) ))

-- 8.Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).



select first_name, last_name from customer
where customer_id in (select customer_id from (select sum(amount) s, customer_id from payment
group by customer_id) def
where s > (select avg(sums) from (select sum(amount) as sums from payment 
group by customer_id)abc))
order by first_name





