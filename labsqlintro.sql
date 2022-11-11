/*

Review the tables in the database.
Explore tables by selecting all columns from each table or using the in built review features for your client.
Select one column from a table. Get film titles.
Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
5.1 Find out how many stores does the company have?
5.2 Find out how many employees staff does the company have?
5.3 Return a list of employee first names only?

*/

select * from sakila.actor;

select title from sakila.film;

select name as languages from sakila.language;

select count(*) from sakila.store;
-- there are 2 stores

select * from sakila.staff;
select count(*) from sakila.staff;

select first_name from sakila.staff