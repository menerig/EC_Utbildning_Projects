import json
from fastapi import FastAPI, Response, Depends, Request
from typing import List, Union
from sqlmodel import Session, select
from fastapi.templating import Jinja2Templates
from fastapi.responses import HTMLResponse

from models import Boxoffice
from scrape import boxoffice2
from database import FilmModel, engine

app = FastAPI()

templates = Jinja2Templates(directory="templates")

data= []

@app.on_event("startup")
async def startup_event():

    session = Session(engine)

    # check if the database is already populated
    stmt = select(FilmModel)
    result = session.exec(stmt).first()

    # load data only if there are no rows
    if result is None:
        for film in boxoffice2:
            session.add(FilmModel(**film))
        session.commit()
    session.close()

def get_session():
    with Session(engine) as session:
        yield session

@app.get("/show_boxoffice", response_class=HTMLResponse)
def show_boxoffice(request: Request, session: Session = Depends(get_session)):
    movies = session.exec(select(FilmModel))
    context = {"request": request, "movies": movies}
    return templates.TemplateResponse("movies.html", context)


@app.get("/boxoffice/", response_model=List[Boxoffice])
def get_boxoffice(session: Session = Depends(get_session)):
    # SELECT * FROM
    stmt = select(FilmModel)
    result = session.exec(stmt).all()
    return result

@app.get("/boxoffice/{id}", response_model=Union[Boxoffice, str])
def get_film(id: int, response: Response, session: Session = Depends(get_session)):
    # find track with id or return none if not contained
    film = session.get(FilmModel, id)
    if film == None:
        response.status_code = 404
        return "Film not found"
    return film


@app.post("/add_boxoffice/", response_model=Boxoffice, status_code = 201)
def add_films(film: FilmModel, session: Session = Depends(get_session)):
    session.add(film)
    session.commit()
    session.refresh(film)
    return film


@app.put("/update_boxoffice/{id}", response_model=Union[Boxoffice, str])
def update_film(id: int, updated_film: Boxoffice, response: Response, session: Session = Depends(get_session)):

    film = session.get(FilmModel, id)

    if film == None:
        response.status_code = 404
        return "Film not found"

    film_dict = updated_film.dict(exclude_unset=True)
    for key, val in film_dict.items():
        setattr(film, key, val)

    session.add(film)
    session.commit()
    session.refresh(film)
    return film


@app.delete("/delete_boxoffice/{id}")
def update_film(id: int, response: Response, session: Session = Depends(get_session)):

    film = session.get(FilmModel, id)

    if film == None:
        response.status_code = 404
        return "Film not found"

    session.delete(film)
    session.commit()
    return Response(status_code = 200)