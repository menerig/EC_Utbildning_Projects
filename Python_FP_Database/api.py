from typing import List
from fastapi import FastAPI
from models import Film, Customer

from mssql_db import DB

app = FastAPI()

db = DB()

@app.get("/")
def route():
    return "Welcome to the film app"


@app.get("/all_films")
def get_all_films():
    get_films_query = """
    SELECT * FROM films
    """
    data = db.call_db(get_films_query)
    films = []
    for element in data:
        id, title, rate, genre, language, rating, description = element
        films.append(Film(film_id=id, film_name=title, rental_rate=rate, 
        genre=genre, language=language, rating=rating, description=description))
    # print(data)
    return films

@app.get("/all_customers")
def get_customers():
    get_customers_query = """
    SELECT * FROM customers
    """
    data = db.call_db(get_customers_query)
    customers = []
    for element in data:
        id, firstname, lastname, email, phone, password = element
        customers.append(Customer(customer_id=id, first_name=firstname, last_name=lastname, 
        email=email, phone=phone, password=password))
 #   print(data)
    return customers


@app.post("/add_film")
def add_film(film: Film):
    insert_query = """
    INSERT INTO films
    VALUES ( ?, ?, ?, ?, ?, ?)
    """
    db.call_db(insert_query, film.film_name, film.rental_rate, film.genre, film.language,
    film.rating, film.description)
    return "This adds a film"

@app.post("/add_customer")
def add_film(customer: Customer):
    insert_query = """
    INSERT INTO customers
    VALUES ( ?, ?, ?, ?, ? )
    """
    db.call_db(insert_query, customer.first_name, customer.last_name, customer.email,
    customer.phone, customer.password)
    return "This adds a customer"

@app.delete("/delete_film/{id}")
def delete_film(id: int):
    film_delete_query = """
    DELETE FROM films
    WHERE film_id = ?
    """
    db.call_db(film_delete_query, id)
    return True

@app.delete("/delete_customer/{id}")
def delete_customer(id: int):
    customer_delete_query = """
    DELETE FROM customers
    WHERE customer_id = ?
    """
    db.call_db(customer_delete_query, id)
    return True

@app.put("/update_film/{film_id}")
def update_film(film_id:int, new_film: Film):
    update_film_query = """
    UPDATE films
    SET film_name = ?, rental_rate = ?, genre = ?, language = ?, rating = ?, description = ?
    WHERE film_id = ?
    """
    db.call_db(update_film_query, new_film.film_name, new_film.rental_rate, new_film.genre, new_film.language,
    new_film.rating, new_film.description, film_id)
    return "This updates a film"

@app.put("/update_customer/{id}")
def update_customer(id:int, new_cust: Customer):
    update_customer_query = """
    UPDATE customers
    SET first_name = ?, last_name = ?, email = ?, phone = ?, password = ?
    WHERE customer_id = ?
    """
    db.call_db(update_customer_query, new_cust.first_name, new_cust.last_name, new_cust.email, new_cust.phone,
    new_cust.password, id)
    return "This updates a customer"