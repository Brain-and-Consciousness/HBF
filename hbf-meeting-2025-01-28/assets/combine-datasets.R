
# In this script, I combine the pretest data from each lab into a single 
# data set. This code requires that all the data files are placed in a folder
# called 'Data'.

# Setup -------------------------------------------------------------------

# Load packages
library(tidyverse)

# Read and combine datasets -----------------------------------------------

# Load essay topic labels
essay_topics <- read_csv("Data/essay-topics.csv")

# Load essay data
essay <- list.files("Data/", pattern = "prepared-essay", 
    full.names = TRUE, recursive = TRUE) %>%
  map_df(read_csv)

# Load non-essay data
non_essay <- list.files("Data/", pattern = "non-essay", 
    full.names = TRUE, recursive = TRUE) %>%
  map_df(read_csv)

data <- left_join(essay, non_essay, by = "ID")
data <- left_join(data, essay_topics, by = "item_nr")

# Save data ---------------------------------------------------------------

write_csv(data, "Data/prepared-data.csv")

