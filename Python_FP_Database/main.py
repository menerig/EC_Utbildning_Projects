from datetime import datetime, date
from typing import List
import requests
from models import Film, Customer
from password import password_generator


base_url = "http://127.0.0.1:8000"

def url(route: str):
    return f"{base_url}{route}"


def print_menu():
    print("""
    Customers:
    1. Add a customer
    2. Search for a customer
    3. Update customer details
    4. Delete a customer

    Films:
    5. Add a new film
    6. Print all films
    7. Update a film
    8. Delete a film
    9. Search for a single film

    10. Exit program
    """)
    pass


def add_customer():
    new_password = password_generator()
    print("Please Customer's details")
    firstname = input("Customer's first name: ")
    lastname = input("Customer's last name: ")
    email = input("Customer's email address: ")
    phone = input("Customer's phone number: ")
    new_cust = Customer(first_name=firstname, last_name=lastname, email=email, phone=phone, password=new_password)
    res = requests.post(url("/add_customer"), json=new_cust.dict())
    print(res)
    print(f"\nYour account is now activated. Your password is {new_password}. Please keep it in a safe place.")


def search_customers():
    customers = []
    print("Get customer details")
    res = requests.get(url("/all_customers"))
    if not res.status_code == 200:
        return
    data = res.json()
    for customer in data: 
        customer = Customer(**customer) 
        print("_________")
        print(f"ID: {customer.customer_id}")
        print(f"Name: {customer.first_name} {customer.last_name}")
        print(f"Email: {customer.email}")
        print(f"Phone number: {customer.phone}")
        customers.append(customer)
    return customers


def update_customer(customers: List[Customer]):
    print("Update customers")
    customer_to_update = input("ID of customer you wish to update: ")
    if not str.isdigit(customer_to_update):
        print("ID's are integers, dumbass!")  

    index = None
    for i, customer in enumerate(customers):
        if customer.customer_id == int(customer_to_update):
            index = i
            break
    
    if index == None:
        print("Customer is not in database")
        return
    customer = customers[index]
    
    firstname = input("Customer's first name (leave blank if same): ")
    lastname = input("Customer's last name (leave blank if same): ")
    email = input("Customer's email address (leave blank if same): ")
    phone = input("Customer's phone number (leave blank if same): ")
    password = password_generator()

    if not firstname:
        firstname = customer.first_name
    if not lastname:
        lastname = customer.last_name
    if not email:
        email = customer.email
    if not phone:
        phone = customer.phone

    new_cust = Customer(first_name=firstname, last_name=lastname, email=email, phone=phone, password=password)
    res = requests.put(url(f"/update_customer/{customer_to_update}"), json=new_cust.dict())
    print(res)
    print(f"\nThe customer's new password is {password}. Please inform them asap.")


def delete_customer():
    print("Delete customer account")
    customer_to_delete = input("Id of customer you wish to delete: ")
    if not str.isdigit(customer_to_delete):
        print("Ids are integers")
        return
    res = requests.delete(url(f"/delete_customer/{customer_to_delete}"))
    print(res.json())


def add_film():
    print("Enter the films details:")
    film_name = input("Title of film: ")
    rental_rate = int(input("Rental rate (either 30 or 40): "))
    genre = input("Film Genre (check IMDB): ")
    language = input("Original language (check IMDB): ")
    rating = input("Age rating of film (check film case): ")
    description = input("Description of film: ")
    new_film = Film(film_name=film_name, rental_rate=rental_rate, genre=genre, language=language,
    rating=rating, description=description)
    res = requests.post(url("/add_film"), json=new_film.dict())
    print(res)


def search_films():
    films = []
    print("Get film details")
    res = requests.get(url("/all_films"))
    if not res.status_code == 200:
        return
    data = res.json()
    for film in data: 
        film = Film(**film) 
        print("_________")
        print(f"Film ID: {film.film_id}")
        print(f"Film title: {film.film_name}")
        print(f"Rental Price: {film.rental_rate}")
        print(f"Genre: {film.genre}")
        print(f"Language: {film.language}")
        print(f"Rating: {film.rating}")
        print(f"Description: {film.description}")
        films.append(film)
    return films

def search_single_film(films: List[Film]):
    search_film = input("Type name of film you want: ")
    for film in films:
        if film.film_name == search_film:
            print("_________")
            print(f"Film ID: {film.film_id}")
            print(f"Film title: {film.film_name}")
            print(f"Rental Price: {film.rental_rate}")
            print(f"Genre: {film.genre}")
            print(f"Language: {film.language}")
            print(f"Rating: {film.rating}")
            print(f"Description: {film.description}")
        else:
            print(f"{search_film} does not exist in our database.")
            return film


def update_film(films: List[Film]):
    print("Update films")
    film_to_update = input("ID of film you wish to update: ")
    if not str.isdigit(film_to_update):
        print("ID's are integers, dumbass!")

    index = None
    for i, film in enumerate(films):
        if film.film_id == int(film_to_update):
            index = i
            break
    
    if index == None:
        print("Film is not in database")
        return
    film = films[index]

    film_name = input("Title of film (leave blank if same): ")
    rental_rate = int(input("Rental rate (either 30 or 40) (leave blank if same): "))
    genre = input("Film Genre (check IMDB) (leave blank if same): ")
    language = input("Original language (check IMDB) (leave blank if same): ")
    rating = input("Age rating of film (check film case) (leave blank if same): ")
    description = input("Description of film (leave blank if same): ")

    if not film_name:
        film_name = film.film_name
    if not rental_rate:
        rental_rate = film.rental_rate
    if not genre:
        genre = film.genre
    if not language:
        language = film.language
    if not rating:
        rating = film.rating
    if not description:
        description = film.description

    new_film = Film(film_name=film_name, rental_rate=rental_rate, genre=genre, language=language,
    rating=rating, description=description)
    res = requests.put(url(f"/update_film/{film_to_update}"), json=new_film.dict())
    print(res)


def delete_film():
    print("Delete film entry")
    film_to_delete = input("Id of film you wish to delete: ")
    if not str.isdigit(film_to_delete):
        print("Ids are integers")
        return
    res = requests.delete(url(f"/delete_film/{film_to_delete}"))
    print(res.json())


def main():
    print_menu()
    user_choice = input("Choose an option from the table: ")
    user_choice = user_choice.strip()
    if not str.isdigit(user_choice):
        print("Please enter a valid option: ")
        return
    
    match int(user_choice):
        case 1:
            add_customer()
        case 2:
            customers = search_customers()
        case 3:
            customers = search_customers()
            update_customer(customers)
        case 4:
            delete_customer()
        case 5:
            add_film()
        case 6:
            films = search_films()
        case 7:
            films = search_films()
            update_film(films)
        case 8:
            delete_film()
        case 9:
            films = search_films()
            search_single_film(films)
        case 10:
            exit()
        case _:
            print("Please enter a valid option: ")


while __name__ == "__main__":
    main()
