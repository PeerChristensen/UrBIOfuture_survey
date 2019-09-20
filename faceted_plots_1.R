#q_201

q201 <- df %>% 
  select(starts_with("q_201")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_201_1 = "1",q_201_2 = "2",
                       q_201_3 = "3",q_201_4 = "4",q_201_5 = "5",
                       q_201_6 = "6",q_201_7 = "7",q_201_8 = "8"))

q201 %>% 
  ggplot(aes(Rank,Percent)) +
  ggtitle("Management: Ranking") +
  labs(y="Per cent",
       x="") +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme(plot.margin = margin(1,1, 1,1, "cm"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        strip.text = element_text(size=18),
        plot.title   = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y  = element_text(size = 18,
                                    margin = margin(r = .3, unit = "cm")),
        axis.text.x  = element_text(size = 18),
        #axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm")))

q401 <-  df %>% 
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
                      q_401_1 = "Purchasing",
                      q_401_2 = "Quality",
                      q_401_3 = "Product / Logistics",
                      q_401_4 = "Resources",
                      q_401_5 = "Industrial linkers",
                      q_401_6 = "Development of business models",
                      q_401_7 = "LCA of Bio-based industry processes",
                      q_401_8 = "Project Management"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q401 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  labs(title = "Management: Educational levels",
       x = "",
       y = "Per cent") +
  scale_x_continuous(breaks = q401$value_num, labels = q401$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme(plot.margin = margin(1,1, 1,1, "cm"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank(),
        strip.text = element_text(size=18,margin=margin(b=1,unit="cm")),
        plot.title   = element_text(size=30,margin=margin(b=1,unit="cm")),
        axis.text.y  = element_text(size = 18,
                                    margin = margin(r = .3, unit = "cm")),
        axis.text.x  = element_text(size = 18,angle=45,hjust=1),
        axis.title.x = element_text(size = 24,margin=margin(t=1,unit="cm")),
        axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm"))) 

