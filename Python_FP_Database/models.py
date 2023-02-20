from typing import Optional, Literal
from pydantic import BaseModel


# Instantiate two class models for both databases - films and customers
class Film(BaseModel):
    film_id: Optional[int] = None
    film_name: str
    rental_rate: Literal[30, 40]
    genre: Literal["Drama", "Science Fiction", "Action", "Horror", "Childrens", "Romance", "Comedy"]
    language: str
    rating: Literal["U", "PG", "15", "18"]
    description: str


class Customer(BaseModel):
    customer_id: Optional[int] = None
    first_name: str
    last_name: str
    email: str
    phone: str
    password: Optional[str] = None
