
```{r}
#### Preamble ####
# Purpose: Simulate the Apartment Building Evaluation data set from the Open Data Toronto website
# Author: Hari Lee Robledo
# Date: 18 January 2024
# Email: hari.leerobledo@mail.utoronto.ca
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

#### Simulate score per building ####

set.seed(400)

simulated_building_data <-
  tibble(
  "building" = 1:1760,
  "score" = sample(
    x = c(1:100),
    size = 1760,
    replace = TRUE
  )
)
simulated_building_data

#### Simulate average score per ward ####

set.seed(400)

simulated_score_data <-
  tibble(
  "wards" = 1:25,
  "score" = sample(
    x = c(1:100),
    size = 25,
    replace = TRUE
  )
)
simulated_score_data

#### Simulate building and score per ward ####

set.seed(400)

simulate_data <-
  tibble(
  "building" = 1:1760,
  "ward" = sample(
    x = c(1:25),
    size = 1760,
    replace=TRUE
    ),
  "score" = sample(
    x = (1:100),
    size = 1760,
    replace=TRUE
  )
)
simulate_data

#### Graph score per building ####
#Code referenced from: https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html

# Create data
data <- data.frame(
  building=c("1","2","3","4","5") ,  
  score=c(10,34,70,84,68)
)

# Bar graph
ggplot(data, aes(x=building, y=score)) + 
  geom_bar(stat = "identity") 

#### Graph score per ward ####
#Code referenced from: https://r-graph-gallery.com/218-basic-barplots-with-ggplot2.html

# Create data
data <- data.frame(
  ward=c("1","2","3","4","5") ,  
  score=c(30,94,54,20,58)
)

# Bar graph
ggplot(data, aes(x=ward, y=score)) + 
  geom_bar(stat = "identity") 

#### Test simulated data ####

# check that buildings equal 1760
length(unique(simulated_building_data$building)) == 1760

# check that wards equal 25
length(unique(simulated_score_data$wards)) == 25

# check that score is between 1 and 100
simulated_building_data$score |> min() == 1
simulated_building_data$score |> max() == 100
```
