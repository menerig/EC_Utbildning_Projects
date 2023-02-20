from typing import Optional
from pydantic import BaseModel


class Boxoffice(BaseModel):
    id: Optional[int]
    title: str
    weekly_gross: str
    total_gross: str
    weeks_released: int
    