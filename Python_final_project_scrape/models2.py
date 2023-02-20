from pydantic import BaseModel


class Boxoffice(BaseModel):
    id: int = None
    title: str
    weekly_gross: str
    total_gross: str
    weeks_released: int
