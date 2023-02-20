from typing import Optional
from fastapi.templating import Jinja2Templates
from fastapi import FastAPI, Request, Header, Depends
from fastapi.responses import HTMLResponse
from sqlalchemy.orm import Session

from .new_database import SessionLocal, engine
from . import models
from main import boxoffice2

models.Base.metadata.create_all(bind=engine)
app = FastAPI()


templates = Jinja2Templates(directory="sql_app/templates")

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.on_event("startup")
def startup_populate_db():
    db = SessionLocal()
    num_films = db.query(models.Film).count()
    if num_films == 0:
        for film in boxoffice2:
            db.add(models.Film(**film))
        db.commit()
        db.close()        
    else:
        print(f"{num_films} films already in DB")
    

@app.get("/demo", response_class=HTMLResponse)
async def demo(
    request: Request, 
    hx_request: Optional[str] = Header(None),
    db: Session = Depends(get_db)
):
    boxoffice = db.query(models.Film).all()
    context = {"request": request, "boxoffice": boxoffice}
    if hx_request:
        return templates.TemplateResponse("table.html", context)
    return templates.TemplateResponse("demo.html", context)
