USE sakila;

#Step 1: Create a View
# First, create a view that summarizes rental information for each customer. 
#The view should include the customer's ID, name, email address, and total number of rentals (rental_count).

CREATE VIEW rental_info_2 AS
SELECT customer.customer_id, last_name, email, COUNT(rental_id) AS rental_count
FROM customer
INNER JOIN rental
ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id;

Select * from rental_info_2;

#Step 2: Create a Temporary Table
#Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). 
#The Temporary Table should use the rental summary view created in Step 1 to join with the payment table 
#and calculate the total amount paid by each customer.


CREATE TEMPORARY TABLE total_paid_2 AS

SELECT customer.customer_id, last_name, SUM(payment.rental_id) AS total_paid
FROM customer
INNER JOIN rental
ON rental.customer_id = customer.customer_id
INNER JOIN payment
ON rental.rental_id = payment.rental_id
GROUP BY customer.customer_id;


SELECT * from total_paid_2;

#Step 3: Create a CTE and the Customer Summary Report
#Create a CTE that joins the rental summary View with the customer payment summary Temporary Table created in Step 2. 
#The CTE should include the customer's name, email address, rental count, and total amount paid.

#Next, using the CTE, create the query to generate the final customer summary report, 
#which should include: customer name, email, rental_count, total_paid and average_payment_per_rental, 
#this last column is a derived column from total_paid and rental_count.


WITH everyting_joined AS(SELECT customer.customer_id, email, last_name, SUM(payment.rental_id) AS total_paid
							FROM customer
							INNER JOIN rental
							ON rental.customer_id = customer.customer_id
							INNER JOIN payment
							ON rental.rental_id = payment.rental_id
							GROUP BY customer.customer_id)
SELECT everyting_joined.customer_id, last_name, email, COUNT(rental_id) AS rental_count, total_paid
FROM everyting_joined
INNER JOIN rental
ON rental.customer_id = everyting_joined.customer_id
GROUP BY rental.customer_id;




SELECT customer.customer_id, last_name, SUM(payment.rental_id) AS total_paid
							FROM customer
							INNER JOIN rental
							ON rental.customer_id = customer.customer_id
							INNER JOIN payment
							ON rental.rental_id = payment.rental_id
							GROUP BY customer.customer_id;
                            
SELECT customer.customer_id, last_name, email, COUNT(rental_id) AS rental_count
FROM customer
INNER JOIN rental
ON rental.customer_id = customer.customer_id
GROUP BY customer.customer_id;