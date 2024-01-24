---
title: "02-clean_data"
format: html
---
```{r}
#### Preamble ####
# Purpose: Clean the Apartment Building Evaluation data set 
# Author: Hari Lee Robledo
# Date: 18 January 2024
# Email: hari.leerobledo@mail.utoronto.ca
# Pre-requisites: none
```

```{r}
#### Workspace setup ####
#install.package("dplyr")
library(opendatatoronto)
library(tidyverse)
library(janitor)
library(dplyr)
library(kableExtra)
```



```{r}
#### Clean the Apartment Building Evaluation data set ####

# Code referenced from:https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html

raw_apt_eval_data<-
  read_csv(
    file = "apt_eval_data.csv",
    show_col_types = FALSE
  )

#Change the name of the raw data into the clean data
cleaned_eval_data <-
  clean_names(raw_apt_eval_data)

#Select the rows of interest
cleaned_eval_data <-
  cleaned_eval_data |>
  select(
    id,
    ward,
    year_built,
    wardname,
    proactive_building_score
  ) |>
  group_by(ward) |>
  arrange(ward)

cleaned_eval_data

#Summarize data to calculate apartment building average score per ward
#Code referenced from: https://chat.openai.com/
average_scores_per_ward <- 
  cleaned_eval_data |>
  select(
    ward,
    wardname,
    proactive_building_score
  ) |>
  group_by(ward) |>
  summarise(
    wardname = first(wardname),
    avg_proactive_building_score = mean(proactive_building_score, na.rm = TRUE)
  ) |>
  arrange(ward)

average_scores_per_ward

#Summarize data to calculate average score per year built
#Code referenced from: https://chat.openai.com/
average_scores_per_year_built <- 
  cleaned_eval_data |>
  select(
    ward,
    year_built,
    proactive_building_score
  ) |>
  group_by(year_built) |>
  summarize(avg_proactive_building_score = mean(proactive_building_score, na.rm = TRUE)) |>
  arrange(year_built)

average_scores_per_year_built

```

```{r}
#| warning: false

#### Clean the 2023-WardProfiles-2011-2021-CensusData data set ####
raw_ward_profile_data = 
  read_csv(
    file = "raw_ward_profile_data.csv",
    show_col_types = FALSE
  )

# Code referenced from: https://github.com/christina-wei/INF3104-1-Covid-Clinics/blob/main/outputs/paper/covid_clinics.qmd

# Select row 1383 in data where it has the average total income of households in 2020
# transpose the table to make the rows and columns match ward data
ward_income_vector = 
  transpose((raw_ward_profile_data[1383,]))[[1]] |>
  as.numeric()

# Select the rows of interest
ward_income_vector =
  ward_income_vector[3:length(ward_income_vector)]

# Create table with ward code and income
average_ward_income_data = tibble(
  ward_code = 1:25,
  income = ward_income_vector
)
average_ward_income_data

#merge ward income data and average scores per ward
merged_data <- cbind(average_ward_income_data,average_scores_per_ward)

merged_data <- merged_data |>
  select(-ward_code)
  
merged_data 
```

```{r}
#### Save cleaned data ####

# Code referenced from:https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html

# save cleaned apartment building evaluation data 
write_csv(
  x = cleaned_eval_data,
  file = "cleaned_eval_data.csv"
)

# save average scores per ward data
write_csv(
  x = average_scores_per_ward,
  file = "average_scores_per_ward.csv"
)

# save average_score_per_year_built 
write_csv(
  x = average_scores_per_year_built,
  file = "average_scores_per_year_built.csv"
)

# save average_ward_income_data
write_csv(
  x = average_ward_income_data,
  file = "average_ward_income_data.csv"
)

# save merged_data
write_csv(
  x = merged_data,
  file = "avg_scores_and_income_per_ward.csv"
)
```
