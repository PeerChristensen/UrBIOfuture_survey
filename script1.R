
library(tidyverse)
library(hrbrthemes)

df <- read_csv("data.csv")

#responses
df %>%
  map_df(~sum(!is.na(.))) %>%
  gather() %>%
  mutate(Question = row_number(),
         Pct = value / max(value)*100) %>%
  ggplot(aes(Question,Pct)) +
  geom_line() +
  labs(y = "Response rate")

# 4.1.4.	Age distribution - "q_101"
table(is.na(df$q_101))

df %>% 
  count(q_101) %>%
  filter(!is.na(q_101)) %>%
  mutate(q_101 = fct_relevel(factor(q_101),"> 60", after = 6)) %>%
  ggplot(aes(q_101,n)) +
  geom_col(fill="#98C455",color="#98C455") +
  theme_ipsum_rc() +
  labs(title="Age Distribution",x="Age groups") +
  theme(plot.margin = margin(2,1, 2,1, "cm"),
        plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x = element_text(size = 20),
        #panel.grid = element_blank(),
       # axis.title.y = element_blank(),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm")),
        panel.grid.major.x = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm")))

# 4.1.5.	Gender distribution - "q_102_1" "q_102_2 q_102_3"
df %>% 
  select(q_102_1,q_102_2,q_102_3) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Gender = recode(key, q_102_1 = "Male",q_102_2 = "Female",q_102_3 = "Non-binary")) %>%
  ggplot(aes(Gender,n)) +
  geom_col(fill="#98C455",color="#98C455") +
  theme_ipsum_rc() +
  labs(title="Gender Distribution",x="Gender") +
  theme(plot.margin = margin(2,1, 2,1, "cm"),
        plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x = element_text(size = 20),
        #panel.grid = element_blank(),
        # axis.title.y = element_blank(),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm")),
        panel.grid.major.x = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm")))

# 4.1.6.	Educational level
# 4.1.7.	Experiences in the bio-based industries
# 4.1.8.	Job positions
# 4.1.9.	Country of company headquarters distribution
# 4.1.10.	Country of workplace - "q_110"

country <- df %>% 
  filter(!is.na(q_110)) %>%
  count(q_110) %>%
  ggplot(aes(reorder(q_110,n),n)) +
  geom_col() +
  geom_col(fill="#98C455",color="#98C455") +
  theme_ipsum_rc() +
  labs(title="Countries") +
  theme(plot.margin = margin(2,1, 2,1, "cm"),
        plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x = element_text(size = 20),
        #panel.grid = element_blank(),
        # axis.title.y = element_blank(),
        axis.title.x = element_text(size = 24,margin=margin(t=0,unit="cm")),
        axis.title.y = element_blank(),
        panel.grid.major.y = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm"))) +
  coord_flip() 
  
# region

df$region_work <- countrycode(sourcevar = df$q_110,origin = "country.name",destination="region")

region <- df %>% 
  filter(!is.na(q_110)) %>%
  count(region_work) %>%
  ggplot(aes(reorder(region_work,n),n)) +
  geom_col() +
  geom_col(fill="#98C455",color="#98C455") +
  theme_ipsum_rc() +
  labs(title="Regions") +
  theme(plot.margin = margin(2,1, 2,1, "cm"),
        plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x = element_text(size = 20,angle=45,hjust=1),
        #panel.grid = element_blank(),
        # axis.title.y = element_blank(),
        axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm")),
        axis.title.x = element_blank(),
        panel.grid.major.x = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm"))) #+
  #coord_flip() 

cowplot::plot_grid(region,country,align="h",ncol=2,rel_widths = c(2/5, 3/5))

# 4.1.11.	Company sector activities
# 4.1.12.	Company sizes

# 4.2.	General competences of the bio-based industries	9
# 4.2.13.	Management	

Q401 <-  df %>% 
  select(starts_with("q_401")) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(value = recode(value, 
                       "Vocational Education and Training (VET)*" = "VET",
                       "Bachelor/engineer – (Undergraduate)" = "BA/engineer")) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(percent = n/n_tot*100) %>%
  ungroup() %>%
  mutate(key = recode(key, 
                      q_401_1 = "[Purchasing] ?Management",
                      q_401_2 = "[Quality] ?Management",
                      q_401_3 = "[Product / Logistics] ?Management",
                      q_401_4 = "[Resources] ?Management",
                      q_401_5 = "[Industrial linkers] ?Management",
                      q_401_6 = "[Development of business models] ?Management",
                      q_401_7 = "[Life Cycle Assesment (LCA) of Bio-based industry processes] ?Management",
                      q_401_8 = "[Project Management] ?Management"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

Q401 %>% 
  ggplot(aes(value_num,percent)) +
  geom_col() +
  scale_x_continuous(breaks = Q401$value_num, labels = Q401$value) +
  facet_wrap(~key)
# 4.2.14.	Data management	9
# 4.2.15.	Personal initiative and entrepreneurship	9
# 4.2.16.	Soft skills	- "q_204_1" (to _8)

# heatmap
df %>% 
  select(starts_with("q_204")) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_204_1 = "1",q_204_2 = "2",
                       q_204_3 = "3",q_204_4 = "4",q_204_5 = "5",
                       q_204_6 = "6",q_204_7 = "7",q_204_8 = "8")) %>%
  ggplot(aes(Rank,value,fill=n)) +
  geom_tile() +
  scale_fill_gradient_tableau("Green") +
  theme_ipsum_rc() +
  labs(title="Soft skills") +
  theme(plot.margin = margin(1,1, 1,1, "cm"),
        plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x = element_text(size = 20),
        #panel.grid = element_blank(),
        # axis.title.y = element_blank(),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_blank(),
        panel.grid = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm")))

# barchart
# 
# df %>% 
#   select(starts_with("q_204")) %>%
#   gather() %>%
#   count(key,value) %>%
#   filter(value != "Not selected") %>%
#   mutate(Rank = recode(key, q_204_1 = "1",q_204_2 = "2",
#                        q_204_3 = "3",q_204_4 = "4",q_204_5 = "5",
#                        q_204_6 = "6",q_204_7 = "7",q_204_8 = "8")) %>%
#   mutate(Rank_class = case_when(Rank == 1 | Rank == 2 ~ 1,
#                                 Rank == 3 | Rank == 4 ~ 2,
#                                 Rank == 5 | Rank == 6 ~ 3,
#                                 Rank == 7 | Rank == 8 ~ 4),
#          Rank = as.numeric(Rank)) %>%
#   ggplot(aes(x=value,y=n,group=rev(Rank_class),fill=rev(Rank))) +
#   geom_col(position="dodge") +
#   coord_flip() +
#   scale_fill_gradient_tableau("Green")

df %>% 
  select(starts_with("q_204")) %>%
  gather() %>%
  count(key,value) %>%
  group_by(value) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_204_1 = "1",q_204_2 = "2",
                       q_204_3 = "3",q_204_4 = "4",q_204_5 = "5",
                       q_204_6 = "6",q_204_7 = "7",q_204_8 = "8")) %>%
  ggplot(aes(Rank,percent)) +
  geom_col() +
  facet_wrap(~value)

# combine skills and education

Q201 <- df %>% 
  select(starts_with("q_201")) %>%
  gather() %>%
  filter(value == "Purchasing") %>%
  count(key,value) %>%
  #group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_201_1 = "1",q_201_2 = "2",
                       q_201_3 = "3",q_201_4 = "4",q_201_5 = "5",
                       q_201_6 = "6",q_201_7 = "7",q_201_8 = "8"))

management_p1 <- Q201 %>% 
  ggplot(aes(Rank,Percent)) +
  ggtitle("Management: Purchasing") +
  labs(y="Per cent") +
  ylim(c(0,50)) +
  geom_col(fill="#98C455",color="#98C455") +
  theme_ipsum_rc() +
  theme(plot.margin = margin(1,1, 1,1, "cm"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        plot.title   = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y  = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x  = element_text(size = 20),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm")))
        
Q401_1 <-  df %>% 
  select(Education = q_401_1) %>%
  filter(!is.na(Education)) %>%
  count(Education) %>%
  add_row(Education = "PhD",n=0) %>%
  mutate(Education = recode(Education, 
                        "Vocational Education and Training (VET)*" = "VET",
                        "Bachelor/engineer – (Undergraduate)" = "BA/engineer")) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  mutate(
         value_num = case_when(
           Education == "VET"         ~ 1,
           Education == "BA/engineer" ~ 2,
           Education == "Master"      ~ 3,
           Education == "PhD"         ~ 4))

management_p2 <- Q401_1 %>% 
  ggplot(aes(value_num, Percent)) +
  geom_col(fill="#98C455",color="#98C455") +
  labs(title = "",
          x = "Education") +
  ylim(c(0,50)) +
  scale_x_continuous(breaks = Q401_1$value_num, labels = Q401_1$Education) +
  theme_ipsum_rc() +
  theme(plot.margin = margin(1,1, 1,-1, "cm"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y = element_text(size = 24,
                                   margin = margin(r = .3, unit = "cm")),
        axis.text.x = element_text(size = 20),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_blank())

cowplot::plot_grid(management_p1,management_p2,align="v",ncol=2,rel_widths = c(6/11, 5/11))
