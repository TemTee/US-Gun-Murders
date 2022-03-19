# Load the packages ------------------------------------------------

library(dslabs)
library(tidyverse)
library(dplyr)
data("murders")
# us_gun_murder <- save(murders, file = "murders.rda")


# Exploring the data  ----------------------------------------------

str(murders)
head(murders)
table(is.na(murders))


#  Analysing the data ----------------------------------------------

murders <- murders %>% mutate(rate = total/population *10^5)
head(murders)
hist(murders$total, col = "cyan 3")
hist(murders$rate, col = "cyan 3")

# California appear to be the state with hightest murder total 

murders %>% mutate(pop= population /10^5) %>%
  ggplot(aes(pop,total, color = region, label = state)) +
  geom_text()

# looking at the population total does it mean California has the
# highest murder rate per every 100,000 citizen?

murders %>%                              #  order of state by population
  mutate(state = reorder(state, population),
         pop = population /10^5) %>%    
  ggplot(aes(pop, state, fill = -pop))+
  geom_col()+
  xlab("Population In Hundred Thousands")+
  ylab("States")+
  theme(legend.position = "none")
  
  

# checking the order of state by murders rate.
# Notice California is no longer the state with the highest murder rate.
murders %>% 
  mutate(state = reorder(state, rate)) %>% 
  ggplot(aes(rate, state, fill = -rate))+
  geom_col()+
  xlab("Murders/100,000 Citizens")+
  ylab("States")+
  theme(legend.position = "none")
