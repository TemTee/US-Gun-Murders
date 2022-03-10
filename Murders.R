# Load the packages ------------------------------------------------

library(dslabs)
library(tidyverse)
library(dplyr)
data("murders")
us_gun_murder <- save(murders, file = "murders.rda")


# Exploring the data  ----------------------------------------------
str(murders)
head(murders)
table(is.na(murders))
murders <- murders %>% mutate(rate = total/population *10^5)
hist(murders$total, col = "cyan 3")
hist(murders$rate, col = "cyan 3")
plot(murders$population, murders$total, col = "red")
