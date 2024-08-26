# Description
This project includes SQL queries designed to analyze various aspects of a film rental database, focusing on the film and payment tables. The queries demonstrate the use of aggregate functions such as COUNT, AVG, MAX, and MIN to extract specific data based on conditions related to film length, rental rates, replacement costs, and customer transactions.

# SQL Queries
Counting Films Longer Than the Average Length

This query calculates the number of films that have a length greater than the average film length.

```sql
Copy code
SELECT count(*) as film_sayısı 
FROM film
WHERE length > ALL 
(
  SELECT AVG(length) as AVGLEN FROM film
);
```
Purpose: Identifies the number of films that exceed the average length, which can be useful for understanding the distribution of film lengths in the database.
Counting Films with the Highest Rental Rate

This query counts how many films have the maximum rental rate.

```sql
Copy code
SELECT COUNT(*) AS film_sayisi 
FROM film
WHERE rental_rate = (SELECT MAX(rental_rate) as max_rental FROM film);
```
Purpose: Helps in determining the prevalence of films with the highest rental rate, which could indicate popular or premium content.
Listing Films with the Lowest Rental Rate and Replacement Cost

This query retrieves the films that have both the lowest rental rate and the lowest replacement cost.

```sql
Copy code
SELECT title, rental_rate, replacement_cost 
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) AS min_r FROM film)
AND replacement_cost = (SELECT MIN(replacement_cost) AS min_c FROM film);
```
Purpose: Useful for identifying the most affordable films in terms of both rental rate and replacement cost, which could be of interest to budget-conscious customers.
Listing Top Customers by Payment Amount

This query lists the customers who have made the highest payments.

```sql
Copy code
SELECT payment.customer_id, first_name, last_name, amount
FROM payment 
INNER JOIN customer ON customer.customer_id = payment.customer_id
WHERE amount = (SELECT MAX(amount) as AMOUNT FROM payment);
```
Purpose: Identifies top customers based on their spending, which can help in targeting loyal customers or analyzing spending behavior.
Use Case
Film Analysis: These queries allow for in-depth analysis of the films in the database, focusing on aspects such as length, rental rates, and costs. This can help in inventory management, pricing strategies, and customer targeting.

Customer Analysis: The query focusing on payments provides insight into customer spending habits, useful for loyalty programs or promotional targeting.

# Conclusion
This project illustrates the power of SQL in extracting meaningful insights from a film rental database. By using aggregate functions and subqueries, the queries provide valuable information about film characteristics and customer behavior, aiding in better decision-making for business operations.
