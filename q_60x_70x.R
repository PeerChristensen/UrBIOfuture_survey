#q_60x & q_70_x

library(tidyverse)
library(hrbrthemes)
library(scales)

df <- read_csv2("Survey_consolidated_filter_23092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete > 90)
         #company_type == "i")


# q_601 - 605

q60x <- df %>% 
  select(starts_with("q_60")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_601 = "1",q_602 = "2",
                       q_603 = "3",q_604 = "4",q_605 = "5")) %>%
  mutate(value = recode(value,
                 "Personal initiative and entrepreneurship" = "Initiative & entrepreneurship",
                 "Specialists in bio-based sector business/market development" = "Specialists in business dev.",
                 "Technical expertise in materials, products and functionalization" = "Expertise: materials, products..",
                 "Technical expertise in primary conversion processes" = "Expertise: primary conversion",
                 "Technical expertise in secondary conversion processes" = "Expertise: second. conversion",
                 "Technical expertise in sustainable biomass production" = "Expertise: biomass production",
                 "Technology / STEM (Science, Technology, Engineering and Maths)" = "Technology / STEM"))
                 
q60x %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=4) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))

ggsave("images/q_60x.png",width = 15,height=15)     
  
df %>%
  select(q_701) %>%
  filter(!is.na(q_701)) %>%
  pull(q_701
       )
  
  
