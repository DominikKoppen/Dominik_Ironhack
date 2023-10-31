USE sakila;

#1 show all tables
SHOW TABLES;


#2 Retrieve all the data from the tables actor, film and customer

SELECT *
FROM actor;

SELECT *
FROM film;

SELECT *
FROM customer;

# Retrieve the following columns from their respective tables:

#3.1 Titles of all films from the film table
#3.2 List of languages used in films, with the column aliased as language from the language table
#3.3 List of first names of all employees from the staff table

SELECT title
FROM film;

SELECT name AS language
FROM language;

SELECT first_name
FROM staff;

#Retrieve unique release years.

SELECT DISTINCT release_year
FROM film;

#Counting records for database insights:

#5.1 Determine the number of stores that the company has.

SELECT COUNT(store_id)
FROM store;

#5.2 Determine the number of employees that the company has.

SELECT COUNT(manager_staff_id)
FROM store;

#5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(inventory_id)
FROM inventory;

#5.4 Determine the number of distinct last names of the actors in the database.
SELECT DISTINCT COUNT(last_name)
from actor;

#6 Retrieve the 10 longest films.

SELECT length
FROM film
LIMIT 10;

#7 Use filtering techniques in order to:
#Retrieve all actors with the first name "SCARLETT".

SELECT first_name, last_name
from actor
WHERE first_name LIKE "SCARLETT";

#7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

SELECT title
FROM film
WHERE title LIKE "%ARMAGEDDON%" AND length > 100;

#7.3 Determine the number of films that include Behind the Scenes content





