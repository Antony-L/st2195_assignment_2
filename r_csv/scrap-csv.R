# Load necessary libraries
library(tidyverse)
library(rvest)

# Load URL of the Wikipedia page
url <- "https://en.wikipedia.org/wiki/Comma-separated_values"

# Read the Wiki HTML content and parse it to 'page'
page <- read_html(url)

# Extract the CSV data, Convert XML nodeset to raw text & Parse to 'csv_data'
csv_data <- page %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/div[1]/pre[1]/text()') %>%
  html_text()

# Convert CSV to data frame
df <- read.csv(text = csv_data)

# Export CSV file
write_csv(df, 'cars.csv')
