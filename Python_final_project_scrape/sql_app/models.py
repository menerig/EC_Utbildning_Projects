from sqlalchemy import Column, ForeignKey, Integer, String
from .new_database import Base


class Film(Base):
    __tablename__ = "Boxoffice"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, unique=True)
    weekly_gross = Column(String)
    total_gross = Column(String)
    weeks_released = Column(Integer)

