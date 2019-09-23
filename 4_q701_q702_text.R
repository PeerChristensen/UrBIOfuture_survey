# 4 question 701-702 - free text

library(tidyverse)

df <- read_csv2("Survey_consolidated_filter_20092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete>90)

df %>% filter(!is.na(q_701)) %>% select(q_701)

df %>% filter(!is.na(q_702)) %>% select(q_702)
