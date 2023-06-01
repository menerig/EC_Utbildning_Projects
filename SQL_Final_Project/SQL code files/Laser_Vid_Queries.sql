-- Create
-- 1) Insert a row of transaction details into a table
INSERT INTO rentals
VALUES
('42', '2021-05-02', '2022-05-13', '4', '1')

-- 2) Add a column to an existing table
ALTER TABLE staff
ADD gender VARCHAR(15)

-- 3) Create ID cards for staff members
INSERT INTO staff_id_card
VALUES
('1','Anne Powell', '2022-09-09', '2022-09-10'),
('2','Jacqueline Long', '2022-10-02', '2022-10-03'),
('3', 'William Patterson', '2022-09-11', '2022-09-12'),
('4', 'Bonnie Hughes', '2022-11-27', '2022-11-28'),
('5', 'Julia Flores', '2022-12-01', '2022-12-02')

-- Read
-- 1) Select all films that cost 30kr to rent
SELECT film_name, language, description FROM films
WHERE rental_rate = 30
ORDER BY language, film_name; -- films are ordered by language, then title in alphabetical order

-- 2) Get customers with ph. numbers that start with (073)
SELECT first_name, last_name, phone FROM customers
WHERE phone LIKE '(073)%';

-- Update
-- 1) Add data to newly created 'gender' column
UPDATE staff
SET gender = 'he/him'
WHERE staff_id = 3;

UPDATE staff
SET gender = 'she/her'
WHERE staff_id IN (1, 2, 4, 5);

-- 2) Change gender in one row
UPDATE staff
SET gender = 'they/them'
WHERE staff_id = 1;

-- Delete
-- 1) Deleted duplication of data
DELETE from rentals
WHERE rental_id BETWEEN 34 AND 45;

-- 2) Delete a column of data
ALTER TABLE staff
DROP COLUMN gender;

-- Left Join of inventory to films showing all copies of movies in store
SELECT film_name, genre FROM films
LEFT JOIN inventory
ON films.film_id = inventory.film_id
-- Add next line to show films that are not in stock
-- They are in the film database but there are no copies in stock 
WHERE inventory_id IS NULL;

-- two inner joins connecting films and actors through the intermediary of the film/actor table
SELECT film_name, description, first_name, last_name FROM film_actor
INNER JOIN films ON
films.film_id = film_actor.film_id
INNER JOIN actor ON
actor.actor_id = film_actor.actor_id;

-- Nested Query
-- Subquery that performs the same function as the Left Join from above
-- It shows the movies listed in the database that are not in stock
SELECT * FROM films
WHERE NOT EXISTS
(SELECT DISTINCT(film_id) FROM inventory
WHERE films.film_id = inventory.film_id);

-- show full details of customers that made a payment between two given dates
SELECT * FROM customers
WHERE customer_id IN
(SELECT customer_id FROM payment
WHERE payment_date BETWEEN '2021-04-01' AND '2021-04-15');

-- Group By of rental transactions over a two month period
SELECT MONTH(date_rented) AS Month, 
COUNT(*) AS monthly_transactions
FROM rentals
GROUP BY MONTH(date_rented);

-- Math function 'SUM' used to find amount spent by individual customers
SELECT TOP 5 customer_id, SUM(amount) AS amount_paid
FROM payment
GROUP BY customer_id;

-- use @variables to find customer information
DECLARE @first_name VARCHAR(50),
		@last_name VARCHAR(50);

SELECT @first_name = 'Amanda',
@last_name ='Carter';

SELECT * FROM customers
WHERE first_name = @first_name
AND last_name = @last_name;

-- Adapted from a program you gave us :)
-- Create a procedure to scan films table and take out films of a given genre
CREATE PROC film_genre(
  @genre VARCHAR(30)
) AS
BEGIN
  DECLARE @film_name VARCHAR(MAX) = '';
  SELECT
    @film_name = @film_name + film_name
				    + CHAR(10)
  FROM
    films
  WHERE
    genre = @genre
  ORDER BY
    film_name;
  PRINT @film_name;
END;

EXEC film_genre 'Drama'