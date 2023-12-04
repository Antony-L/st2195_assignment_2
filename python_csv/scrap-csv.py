#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Dec  4 22:14:43 2023

@author: antony
"""

import requests
from bs4 import BeautifulSoup

# Scrape the CSV example from the Wikipedia page
url = "https://en.wikipedia.org/wiki/Comma-separated_values"
response = requests.get(url)
soup = BeautifulSoup(response.content, "html.parser")
csv_data = soup.find_all("pre")

# Save the scraped CSV data to a file in the "python_csv" folder
with open("cars.csv", "w") as file:
    file.write(csv_data[10].text)