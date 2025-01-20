
# Setup -------------------------------------------------------------------

# Load packages
library(tidyverse)

# Tilburg University ------------------------------------------------------

# Load data
non_essay <- read_csv("Data/Tilburg University/prepared-non-essay-data-tilburg-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# French universities -----------------------------------------------------

# Load data
non_essay <- read_csv("Data/French universities/prepared-non-essay-data-french.csv")

# Start date and end date for each lab
non_essay %>%
  group_by(university) %>%
  summarize(
    short = first(university_short),
    study_start = min(start_date),
    study_end = last(start_date)
  )

# Start N per lab
non_essay %>%
  group_by(university) %>%
  count()

# Attention check
non_essay %>% group_by(university) %>% count(attention1)
non_essay %>% group_by(university) %>% count(attention2)

# How many will continue their study?
non_essay %>% group_by(university) %>% count(study_continue)
non_essay %>% group_by(university) %>% count(study_plan)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
non_essay %>%
  group_by(university) %>%
  count()

# Bergen University -------------------------------------------------------

# Load data
non_essay <- read_csv("Data/Bergen University/prepared-non-essay-data-bergen-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# University of Amsterdam -------------------------------------------------

# Load data
non_essay <- read_csv("Data/University of Amsterdam/prepared-non-essay-data-university-of-amsterdam.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Clemson University ------------------------------------------------------

# Load data
non_essay <- read_csv("Data/Clemson University/prepared-non-essay-data-clemson-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# University at Buffalo ---------------------------------------------------

# Load data
non_essay <- read_csv("Data/University at Buffalo/prepared-non-essay-data-university-at-buffalo.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# SWPS University ---------------------------------------------------------

# Load data
non_essay <- read_csv("Data/SWPS University/prepared-non-essay-data-SWPS-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Macquarie University ----------------------------------------------------

# Load data
non_essay <- read_csv("Data/Macquarie University/prepared-non-essay-data-macquarie-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Université Libre de Bruxelles -------------------------------------------

# Load data
non_essay <- read_csv("Data/Université Libre de Bruxelles/prepared-non-essay-data-universite-libre-de-bruxelles.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Southern Illinois University --------------------------------------------

# Load data
non_essay <- read_csv("Data/Southern Illinois University/prepared-non-essay-data-southern-illinois-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# University of São Paulo -------------------------------------------------

# Load data
non_essay <- read_csv("Data/University of Sao Paulo/prepared-non-essay-university-of-sao-paulo.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Muğla Sıtkı Koçman University -------------------------------------------

# Load data
non_essay <- read_csv("Data/Muğla Sıtkı Koçman University/prepared-non-essay-mugla-sitki-kocman-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Heriot Watt University --------------------------------------------------

# Load data
non_essay <- read_csv("Data/Heriot Watt University/prepared-non-essay-heriot-watt-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Higher School of Economics University -----------------------------------

# Load data
non_essay <- read_csv("Data/Higher School of Economics University/prepared-non-essay-higher-school-economics-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Sunway University -------------------------------------------------------

# Load data
non_essay <- read_csv("Data/Sunway University/prepared-non-essay-data-sunway-university.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Baskent University ------------------------------------------------------

# Load data
non_essay <- read_csv("Data/Baskent University/prepared-non-essay-data-bu.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# Coventry University -----------------------------------------------------

# Load data
non_essay <- read_csv("Data/Coventry University/prepared-non-essay-data-cou.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

# University of Delhi -----------------------------------------------------

# Load data
non_essay <- read_csv("Data/University of Delhi/prepared-non-essay-data-uod.csv")

# Start date and end date
non_essay %>% pull(start_date) %>% min()
non_essay %>% pull(start_date) %>% max()

# Start N
nrow(non_essay)

# Attention check
count(non_essay, attention1)
count(non_essay, attention2)

# How many will continue their study?
count(non_essay, study_continue)

# Exclude participants who:
# - Report not being motivated
# - Failed the attention check
# - Will not continue their studies
# Remove those who reported not being motivated
non_essay <- non_essay %>%
  filter(attention1 != "not at all" & attention1 != "mostly not") %>%
  filter(attention2 == "mostly not") %>%
  filter(study_continue != "no")

# Final N
nrow(non_essay)

