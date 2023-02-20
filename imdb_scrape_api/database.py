from typing import Optional

from sqlmodel import Field, SQLModel, create_engine

DB_FILE = "db.sqlite3"
engine = create_engine(f"sqlite:///{DB_FILE}", echo=True)

class FilmModel(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    title: str
    weekly_gross: str
    total_gross: str
    weeks_released: int


def create_tables():
    SQLModel.metadata.create_all(engine)

if __name__ == "__main__":
    create_tables()