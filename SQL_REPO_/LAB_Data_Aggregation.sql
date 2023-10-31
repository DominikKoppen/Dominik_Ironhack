USE sakila;

#1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT MIN(length) AS min_duration
FROM film;

SELECT MAX(length) AS max_duration
FROM film;


#1.2. Express the average movie duration in hours and minutes. Don't use decimals.

SELECT AVG(length)
FROM film;

#Hint: Look for floor and round functions.

#2.1 Calculate the number of days that the company has been operating.
#Hint: To do this, use the rental table, and the DATEDIFF() function to subtract the earliest date in the rental_date column from the latest date.

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date))
FROM rental;

#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.

SELECT MONTH(rental_date) AS month, WEEKDAY(rental_date) AS day
FROM rental;

#You need to ensure that customers can easily access information about the movie collection. 
#To achieve this, retrieve the film titles and their rental duration. 
#If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order
#SELECT IFNULL(NULL, 500)

SELECT title, IFNULL (rental_duration, "NOT AVAILABLE" )
FROM film
ORDER BY rental_duration ASC;

#Next, you need to analyze the films in the collection to gain some more insights. Using the film table, determine:
#1.1 The total number of films that have been released.

SELECT COUNT(film_id)
FROM film;

#1.2 The number of films for each rating.
SELECT rating, COUNT(film_id) 
FROM film
GROUP BY rating;

#1.3 The number of films for each rating, sorting the results in descending order of the number of films. 
#This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.
SELECT rating, COUNT(film_id) 
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

#Using the film table, determine:
#2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. 
#Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
SELECT rating, AVG(length) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

#2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
SELECT rating, AVG(length) AS mean_duration
FROM film
GROUP BY rating
HAVING AVG(length) > 120; 
