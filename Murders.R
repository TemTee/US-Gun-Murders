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
head(murders)
hist(murders$total, col = "cyan 3")
hist(murders$rate, col = "cyan 3")
murders %>% mutate(pop= population /10^5) %>%
  ggplot(aes(pop,total, color = region, label = state)) +
  geom_text() +
  geom_jitter(position = "jitter")
  
murders %>% mutate(pop= population /10^5) %>% 
  ggplot(aes(pop,rate, color = region, label = state)) +
  geom_text() +
  geom_jitter(position = "jitter")
