
library(tidyverse)
library(hrbrthemes)

df <- read_csv("data.csv")

# 4.1.4.	Age distribution - "q_101"
table(is.na(df$q_101))

df %>% 
  count(q_101) %>%
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

df %>% 
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
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_blank(),
        panel.grid.major.x = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm"))) +
  coord_flip() 
  
# region

df$region_work <- countrycode(sourcevar = df$q_110,origin = "country.name",destination="region")

df %>% 
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
        axis.text.x = element_text(size = 20),
        #panel.grid = element_blank(),
        # axis.title.y = element_blank(),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_blank(),
        panel.grid.major.x = element_blank(),
        legend.title = element_blank(),
        legend.key.size = unit(1.5, "cm"),
        legend.text = element_text(size=24),
        strip.text = element_text(size=28,margin=margin(b=1,unit="cm"))) +
  coord_flip() 

# 4.1.11.	Company sector activities
# 4.1.12.	Company sizes


#4.2.16.	Soft skills	- "q_204_1" (to _8)

df %>% 
  select(starts_with("q_204")) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_204_1 = "1",q_204_2 = "2",
                       q_204_3 = "3",q_204_4 = "4",q_204_5 = "5",
                       q_204_6 = "6",q_204_7 = "7",q_204_8 = "8")) 

df %>%
  ggplot(aes(reorder(dayOfWeek2,dayOfWeek),reorder(hour,rev(hour)),fill=n_sessions)) +
  geom_tile() +
  scale_fill_gradient_tableau("Classic Red") +
  theme_minimal()
