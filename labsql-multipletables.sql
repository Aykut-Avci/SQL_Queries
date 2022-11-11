-- Write a query to display for each store its store ID, city, and country.

select store_id,city, country from store left join address using(address_id) 
left join city using(city_id) left join country using(country_id);

-- Write a query to display how much business, in dollars, each store brought in.

select sum(amount), store_id from store join inventory using(store_id) join rental using(inventory_id)
join payment using(rental_id)
group by store_id;

-- What is the average running time(length) of films by category?

select name, avg(length) from film join film_category using(film_id)  join category using(category_id)

group by `name`;

-- Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

select name, avg(length) from film join film_category using(film_id)  join category using(category_id)

group by `name`

order by avg(length) desc

limit 5;

-- Display the top 5 most frequently(number of times) rented movies in descending order.

select title, count(film_id) from rental join inventory using(inventory_id) join film using(film_id)
group by film_id
order by count(film_id) desc
limit 5;

-- List the top five genres in gross revenue in descending order.

select name, sum(amount) from payment join rental using(rental_id) join inventory using(inventory_id) join film_category using(film_id) 
join category using(category_id)
group by `name`
order by sum(amount) desc
limit 5;

-- Is "Academy Dinosaur" available for rent from Store 1?

select title, store_id from inventory join film using(film_id) 
where title ="Academy Dinosaur" and store_id = 1
limit 1 








