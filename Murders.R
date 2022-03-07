# Load the packages ------------------------------------------------

library(dslabs)
library(tidyverse)
library(dplyr)
data("murders")


# Exploring the data  ----------------------------------------------
str(murders)
head(murders)
rename(murders, murder_total = total)
