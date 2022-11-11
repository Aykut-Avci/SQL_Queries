-- Which actor has appeared in the most films?


Use sakila;


select actor_id, first_name, last_name from actor
inner join film_actor using (actor_id)
group by actor_id
order by count(actor_id) desc
limit 1;


-- Most active customer (the customer that has rented the most number of films)

select customer_id, first_name, last_name from customer left join rental using(customer_id)
group by customer_id
order by count(customer_id) desc
limit 1;


-- List number of films per category.

select name, count(name) from category right join film_category using(category_id)
group by category_id;

-- Display the first and last names, as well as the address, of each staff member.

select first_name, last_name, address from staff inner join address using(address_id);


-- Display the total amount rung up by each staff member in August of 2005.

select sum(amount), first_name, last_name from payment left join staff using(staff_id)
where payment_date between "2005-08-01" and "2005-08-31"
group by staff_id;

-- List each film and the number of actors who are listed for that film

select count(distinct actor_id), title from film_actor left join actor using(actor_id) left join film using(film_id)
group by film_id
order by count(distinct actor_id) desc; 

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name

select first_name, last_name, sum(amount) from payment join customer using(customer_id)
group by customer_id
order by last_name;


-- Optional: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.

select title, count(film_id) from rental join inventory using(inventory_id) join film using(film_id)
group by film_id
order by count(film_id) desc







