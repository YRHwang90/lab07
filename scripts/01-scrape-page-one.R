# load packages ----------------------------------------------------------------

library(tidyverse)
library(rvest)

# set url ----------------------------------------------------------------------

first_url <- "https://collections.ed.ac.uk/art/search/*:*/Collection:%22edinburgh+college+of+art%7C%7C%7CEdinburgh+College+of+Art%22?offset=0"

# read first page --------------------------------------------------------------

page <- read_html(first_url)

# scrape titles ----------------------------------------------------------------

titles <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()
titles
# scrape links -----------------------------------------------------------------

links <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_attr("href") %>%
  str_replace("\\.", "https://collections.ed.ac.uk/art")

links
 ?str_replace()
# scrape artists ---------------------------------------------------------------

artists <- page %>%
  html_nodes(".iteminfo") %>%
  html_node(".artist") %>%
  html_text() %>%
  str_squish()

# put together in a data frame -------------------------------------------------

first_ten <- tibble(
  title = titles,
  artist = artists,
  link = links
)

# scrape second ten paintings --------------------------------------------------


second_url <- "https://collections.ed.ac.uk/art/search/*:*/Collection:%22edinburgh+college+of+art%7C%7C%7CEdinburgh+College+of+Art%22?offset=10"

# read second page --------------------------------------------------------------

page2 <- read_html(second_url)

# scrape titles ----------------------------------------------------------------

titles2 <- page2 %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()
titles
# scrape links -----------------------------------------------------------------

links2 <- page2 %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_attr("href") %>%
  str_replace("\\.", "https://collections.ed.ac.uk/art")

# scrape artists ---------------------------------------------------------------

artists2 <- page2 %>%
  html_nodes(".iteminfo") %>%
  html_node(".artist") %>%
  html_text() %>%
  str_squish()

# put together in a data frame -------------------------------------------------

sec_ten <- tibble(
  title2 = titles2,
  artist2 = artists2,
  link2 = links2
)

