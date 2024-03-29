#### Preamble ####
# Purpose: Basic tests codes for loaded dataset.
# Author: Hari Lee Robledo 
# Date: January 25 2024 
# Contact: hari.leerobledo@mail.utoronto.ca
# Pre-requisites:
  # 00-simulate_data.R
  # 01-download_data.R
  # 02-data_cleaning.R

```{r}
#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)

#### Test data ####

# Referenced code from: https://chat.openai.com/
# Check that there are 25 wards in the average scores per ward data
test1 <- average_scores_per_ward |>
  summarise(unique_wards = n_distinct(ward)) |>
  pull(unique_wards) == 25

test1

# Check that there are 25 wards in the average scores and income per ward data
test2 <- avg_scores_and_income_per_ward |>
  summarise(unique_wards = n_distinct(ward)) |>
  pull(unique_wards) == 25

test2

# Check that the average income per ward is between 85700 and 224800
# Referenced code from: https://github.com/christina-wei/INF3104-1-Covid-Clinics/blob/main/scripts/00-simulation.R
test3 <- 
  avg_scores_and_income_per_ward$income |> min() == 85700
  avg_scores_and_income_per_ward$income |> max() == 224800
  
test3

# Check that there are 120 years in the average scores per year built data
test4 <- average_scores_per_year_built |>
  summarise(unique_year_built = n_distinct(year_built)) |>
  pull(unique_year_built) == 120

test4

# Check that the average score per year is between 6 and 99.75
# Referenced code from: https://github.com/christina-wei/INF3104-1-Covid-Clinics/blob/main/scripts/00-simulation.R
test6 <- 
  average_scores_per_year_built$avg_proactive_building_score |> min() == 64
  average_scores_per_year_built$avg_proactive_building_score |> max() == 99.75

test6
```
