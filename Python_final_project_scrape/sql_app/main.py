from typing import List
import requests
from bs4 import BeautifulSoup
from schema import Boxoffice


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
print(boxoffice2)

    # boxoffice = [{'title': "Magic Mike's Last Dance", 'weekly_gross': '$8.3M', 'total_gross': '$8.3M', 'weeks_released': 1}, 
    # {'title': 'Avatar: The Way of Water', 'weekly_gross': '$7.2M', 'total_gross': '$647.3M', 'weeks_released': 9}, 
    # {'title': 'Titanic', 'weekly_gross': '$6.7M', 'total_gross': '$6.7M', 'weeks_released': 1}, 
    # {'title': '80 for Brady', 'weekly_gross': '$5.8M', 'total_gross': '$24.8M', 'weeks_released': 2}, 
    # {'title': 'Puss in Boots: The Last Wish', 'weekly_gross': '$5.6M', 'total_gross': '$158.6M', 'weeks_released': 8}, 
    # {'title': 'Knock at the Cabin', 'weekly_gross': '$5.4M', 'total_gross': '$23.4M', 'weeks_released': 2}, 
    # {'title': 'A Man Called Otto', 'weekly_gross': '$2.6M', 'total_gross': '$57.4M', 'weeks_released': 7}, 
    # {'title': 'Missing', 'weekly_gross': '$2.6M', 'total_gross': '$26.6M', 'weeks_released': 4}, 
    # {'title': 'M3GAN', 'weekly_gross': '$2.4M', 'total_gross': '$91.0M', 'weeks_released': 6}, 
    # {'title': 'Plane', 'weekly_gross': '$1.2M', 'total_gross': '$30.8M', 'weeks_released': 5}]