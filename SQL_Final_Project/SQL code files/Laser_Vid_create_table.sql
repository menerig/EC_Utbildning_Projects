USE [Laser Videos];

CREATE TABLE films (
  film_id INT PRIMARY KEY IDENTITY(1, 1),
  film_name VARCHAR(50) NOT NULL,
  rental_rate INT NOT NULL,
  genre VARCHAR(20),
  language VARCHAR(20),
  rating VARCHAR(10),
  description VARCHAR(255)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY IDENTITY(1, 1),
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(50),
  phone VARCHAR(15),
  start_date DATETIME
);

CREATE TABLE staff (
  staff_id INT PRIMARY KEY IDENTITY(1, 1),
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL,
  email VARCHAR(50) NOT NULL,
  home_address VARCHAR(250),
  phone VARCHAR(15) NOT NULL,
  hire_date DATETIME
);

CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY IDENTITY(1, 1),
  film_id INT,
  FOREIGN KEY (film_id) REFERENCES films(film_id) ON UPDATE CASCADE ON DELETE CASCADE,
  date_entered DATETIME
);

CREATE TABLE rentals (
  rental_id INT PRIMARY KEY IDENTITY(1, 1),
  inventory_id INT,
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id) ON UPDATE CASCADE ON DELETE CASCADE,
  date_rented DATETIME,
  date_returned DATETIME,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
  staff_id INT,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE actor (
  actor_id INT PRIMARY KEY IDENTITY(1, 1),
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(25) NOT NULL
);

CREATE TABLE payment (
  payment_id INT PRIMARY KEY IDENTITY(10, 2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
  staff_id INT,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
  rental_id INT,
  FOREIGN KEY (rental_id) REFERENCES rentals(rental_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
  amount INT,
  payment_date DATETIME
);

CREATE TABLE film_actor (
  film_id INT,
  FOREIGN KEY (film_id) REFERENCES films(film_id) ON UPDATE CASCADE ON DELETE CASCADE,
  actor_id INT,
  FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE staff_id_card (
	staff_id INT,
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
	full_name VARCHAR(100) NOT NULL,
	last_login DATETIME,
	last_logout DATETIME
);
