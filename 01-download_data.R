---
title: "01-download_data"
format: html
---
```{r}
#### Preamble ####
# Purpose: Download the Apartment Building Evaluation data set and the Ward Profile data setfrom the Open Data Toronto website
# Author: Hari Lee Robledo
# Date: 18 January 2024
# Email: hari.leerobledo@mail.utoronto.ca
# Pre-requisites: none
```

```{r}
#### Workspace setup ####
#install.packages("opendatatoronto")
library(opendatatoronto)
library(tidyverse)
library(readxl)
```

```{r}
# Get 2023-WardProfiles-2011-2021-CensusData data set from the Open Data Toronto website
#Code referenced from: https://piazza.com/class/lrja9wmteoj28u/post/10
download.file(url = "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/6678e1a6-d25f-4dff-b2b7-aa8f042bc2eb/resource/16a31e1d-b4d9-4cf0-b5b3-2e3937cb4121/download/2023-WardProfiles-2011-2021-CensusData.xlsx",               destfile = "raw_data.xlsx")

data <- read_excel("raw_data.xlsx", sheet = "2021 One Variable")

# write data for the first tab: "2016 Census One Variable"
write_csv (
  x = data,
  file = "raw_ward_profile_data.csv"
)
```

```{r}
# Get Apartment Building Evaluation data set from the Open Data Toronto website
#Code referenced from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html
raw_apt_eval_data <-
  read_csv(
    file =
      "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/4ef82789-e038-44ef-a478-a8f3590c3eb1/resource/7fa98ab2-7412-43cd-9270-cb44dd75b573/download/Apartment%20Building%20Evaluations%202023%20-%20current.csv",
    show_col_types = FALSE,
  )

# Save Apartment Building Evaluation raw data into the project
write_csv(
  x = raw_apt_eval_data,
  file = "apt_eval_data.csv"
)
```