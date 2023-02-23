# Lab | SQL Queries 3
USE sakila;

# 1. How many distinct (different) actors' last names are there?
SELECT count(distinct(last_name))
FROM actor;

# 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)
SELECT count(distinct(language_id))
FROM film;

SELECT count(distinct(language_id))
FROM language;

# 3. How many movies were released with `"PG-13"` rating?
SELECT count(film_id)
FROM film
WHERE rating = "PG-13";

# 4. Get 10 the longest movies from 2006.
SELECT title, length, release_year
FROM film
WHERE release_year = 2006
ORDER BY length desc
LIMIT 10;

# 5. How many days has been the company operating (check `DATEDIFF()` function)?
SELECT payment_date,last_update,datediff(last_update,payment_date)
from payment
LIMIT 1;


# 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, MONTH(rental_date) as month, DAYOFMONTH(rental_date)as weekday
FROM rental
LIMIT 20;

# 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT  *,      # adding comma here will add an extra column to table
CASE
	WHEN (DAYNAME(rental_date) = "Saturday" OR "Sunday") THEN "Weekend"
	ELSE "workday"
    END as day_type
from rental;

# 8. How many rentals were in the last month of activity?
SELECT distinct(MONTH(rental_date)), count(*)
FROM rental
GROUP BY rental_date
ORDER BY rental_id desc
LIMIT 1;

