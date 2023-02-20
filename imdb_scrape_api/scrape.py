from typing import List
import requests
from bs4 import BeautifulSoup
from models import Boxoffice

api_base_url = "http://127.0.0.1:8000/"

box_office_url = "https://www.imdb.com/chart/boxoffice/?ref_=nv_ch_cht"

def url(route: str):
    return f"{api_base_url}{route}"

page = requests.get(box_office_url).text
data = BeautifulSoup(page, "html.parser")

page_heading = data.find("h1")
page_links = data.find_all("a")

film_soup = BeautifulSoup()

for link in page_links:
    # Kolla om har en href
    if link.has_attr("href"):
        if "article" in link.parent["class"]:
            film_soup.append(link.parent)
            
# print(film_soup.prettify())

film_tags = film_soup.find_all(attrs={"class": "posterColumn"})
# test_film = film_tags[1]
# print(test_film)

boxoffice: List[Boxoffice] = []
boxoffice2 = []


for film in film_tags:
    total_gross = film.find(attrs={"class": "secondaryInfo"}).text.strip()
    title = film.find("td").text.strip()
    weekly_gross = film.find(attrs={"class": "ratingColumn"}).text.strip()
    weeks_released = int(film.find(attrs={"class": "weeksColumn"}).text)

    boxoffice.append(Boxoffice(title=title, weekly_gross=weekly_gross, 
    total_gross=total_gross, weeks_released=weeks_released))


for film in boxoffice:
    film = film.dict()
    boxoffice2.append(film)

num = 1
for film in boxoffice2:
    film["id"] = num
    num += 1

print(boxoffice2)