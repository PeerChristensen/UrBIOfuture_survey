# 4.2.	General competences of the bio-based industries	10

library(tidyverse)
library(hrbrthemes)
library(scales)

df <- read_csv2("Survey_consolidated_filter_20092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete>102)


# theme
# ----
theme_ubf_2 <- function () { 
  theme_ipsum_rc(plot_title_size = 30) %+replace% 
    theme(
      plot.title = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      plot.margin = margin(1,1, 1,1, "cm"),
      axis.text.y = element_text(size = 18,
                                 margin = margin(r = .3, unit = "cm")),
      axis.text.x = element_text(size = 18),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      strip.text = element_text(size=18,hjust=0,margin = margin(b=.3,unit="cm"))
      )
}

theme_set(theme_ubf_2())
# ----

###########################
# 4.2.13.	Management	10

#q_201
#----
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
                       q_201_6 = "6",q_201_7 = "7",q_201_8 = "8"),
         value = recode(value, 
                        "Life Cycle Assessment (LCA) of Bio-based industry processes" = "Life Cycle Assessment (LCA)",
                        "Development of business models" = "Business model development"))

q201 %>% 
  ggplot(aes(Rank,Percent)) +
  #ggtitle("Management: Ranking\n") +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
  
ggsave("q_201.png",width = 15,height=7.5)
#----
#q_401
#----
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
                      q_401_6 = "Business model development",
                      q_401_7 = "Life Cycle Assessment (LCA)",
                      q_401_8 = "Project Management"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q401 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
 # labs(title = "Management: Educational levels\n") +
  scale_x_continuous(breaks = q401$value_num, labels = q401$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_401.png",width = 15,height=7.5)

#----
###########################
# 4.2.14.	Data Management

#----
#q_202
#----
q202 <- df %>% 
  select(starts_with("q_202")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_202_1 = "1",q_202_2 = "2",
                       q_202_3 = "3",q_202_4 = "4",q_202_5 = "5",
                       q_202_6 = "6",q_202_7 = "7",q_202_8 = "8"),
         value = recode(value, 
                        "Data Analytics & Advanced Analytics" = "Analytics & Advanced Analytics",
                        "Data architecture" = "Architecture",
                        "Data Exploitation Technologies" = "Exploitation Technologies",
                        "Data processing (carry out, retrieve, transform)" = "Processing",
                        "Data sensing technologies"= "Sensing technologies",
                        "Data transmission technologies & standards" = "Transmission technologies",
                        "Information security and cybersecurity" = "Information and cybersecurity"))

q202 %>% 
  ggplot(aes(Rank,Percent)) +
 # ggtitle("Data Management: Ranking\n") +
  labs(y="Per cent",
       x="") +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  theme_ubf_2()
ggsave("q_202.png",width = 15,height=7.5)
# 4.2.14.	Data Management
#----
#q_402
#----
q402 <-  df %>% 
  select(starts_with("q_402")) %>%
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
                      q_402_1 = "Sensing technologies",
                      q_402_2 = "Processing",
                      q_402_3 = "Transmission technologies",
                      q_402_4 = "Analytics & Advanced Analytics",
                      q_402_5 = "Exploitation Technologies",
                      q_402_6 = "Information and cybersecurity"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q402 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  labs(title = "Data Management: Educational levels\n") +
  scale_x_continuous(breaks = q402$value_num, labels = q402$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_402.png",width = 15,height=7.5)
#----

###########################
# 4.2.15.	Personal initiative and entrepreneurship	12

#q_203
#----
q203 <- df %>% 
  select(starts_with("q_203")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_203_1 = "1",q_203_2 = "2",
                       q_203_3 = "3",q_203_4 = "4",q_203_5 = "5",
                       q_203_6 = "6",q_203_7 = "7",q_203_8 = "8"),
         value = recode(value,"Engagement capacity to involve different types of Stakeholders (clustering)" = "Engagement capacity"))

q203 %>% 
  ggplot(aes(Rank,Percent)) +
#  ggtitle("Personal initiative and entrepreneurship: Ranking\n") +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))

ggsave("q_203.png",width = 15,height=7.5)
#----
#q_403
# ----
q403 <-  df %>% 
  select(starts_with("q_403")) %>%
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
                      q_403_1 = "Critical thinking",
                      q_403_2 = "Problem solving",
                      q_403_3 = "Engagement capacity",
                      q_403_4 = "Creativity",
                      q_403_5 = "Empathy",
                      q_403_6 = "Persuasion",
                      q_403_7 = "Productivity"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q403 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
 # labs(title = "Personal initiative and entrepreneurship: Educational levels\n") +
  scale_x_continuous(breaks = q403$value_num, labels = q403$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_403.png",width = 15,height=7.5)
#----

###########################
# 4.2.16.	Soft skills	12

#q_204
#----
q204 <- df %>% 
  select(starts_with("q_204")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_204_1 = "1",q_204_2 = "2",
                       q_204_3 = "3",q_204_4 = "4",q_204_5 = "5",
                       q_204_6 = "6",q_204_7 = "7",q_204_8 = "8"),
         value = recode(value,"Communication (public speaking)" = "Communication (speaking)",
                        "Foreign Languages Competence" = "Foreign Languages",
                        "Teamwork and conflict resolution" = "Teamwork - conflict resolution"))

q204 %>% 
  ggplot(aes(Rank,Percent)) +
  #ggtitle("Soft skills: Ranking\n") +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))

ggsave("q_204.png",width = 15,height=7.5)
#----
#q_404
# ----
q404 <-  df %>% 
  select(starts_with("q_404")) %>%
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
                      q_404_1 = "Communication (speaking)",
                      q_404_2 = "Communication (writing)",
                      q_404_3 = "Relationship building",
                      q_404_4 = "Teamwork - conflict resolution",
                      q_404_5 = "Adaptability",
                      q_404_7 = "Personal branding",
                      q_404_6 = "Collaboration",
                      q_404_8 = "Foreign Languages"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q404 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
 # labs(title = "Soft skills: Educational levels\n") +
  scale_x_continuous(breaks = q404$value_num, labels = q404$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_404.png",width = 15,height=7.5)
#----

###########################
# 4.2.17.	Sustainability and industry

#q_205
#----
q205 <- df %>% 
  select(starts_with("q_205")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_205_1 = "1",q_205_2 = "2",
                       q_205_3 = "3",q_205_4 = "4",q_205_5 = "5",
                       q_205_6 = "6",q_205_7 = "7",q_205_8 = "8"),
         value = recode(value,
                        "Circular economy / Zero waste industry" = "Circ. economy / 0 waste industry",
                        "Monitoring contaminants in the products" = "Monitoring contaminants",
                        "Recyclability concepts for bio-based materials" = "Recyclability concepts",
                        "Secure bio-based materials and residues stability, availability, transport and storage" = "Secure bio-based materials etc.",
                        "Sustainable competitiveness / Economy" = "Sustainable competitiveness"))

q205 %>% 
  ggplot(aes(Rank,Percent)) +
  #ggtitle("Sustainability and industry: Ranking\n") +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_205.png",width = 15,height=7.5)
#----
#q_405
# ----
q405 <-  df %>% 
  select(starts_with("q_405")) %>%
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
                      q_405_1 = "Communication (speaking)",
                      q_405_2 = "Communication (writing)",
                      q_405_3 = "Relationship building",
                      q_405_4 = "Teamwork - conflict resolution",
                      q_405_5 = "Adaptability",
                      q_405_7 = "Personal branding",
                      q_405_6 = "Collaboration",
                      q_405_8 = "Foreign Languages"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q405 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
 # labs(title = "Soft skills: Educational levels\n") +
  scale_x_continuous(breaks = q405$value_num, labels = q405$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_405.png",width = 15,height=7.5)
#----

###########################
# 4.2.18.	Technology / STEM (Science, Technology, Engineering and Maths)	13

#q_206
#----
q206 <- df %>% 
  select(starts_with("q_206")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_206_1 = "1",q_206_2 = "2",
                       q_206_3 = "3",q_206_4 = "4",q_206_5 = "5",
                       q_206_6 = "6",q_206_7 = "7",q_206_8 = "8"),
         value = recode(value,
                        "Artificial Intelligence technologies" = "AI technologies",
                        "DLT (Distributed ledger technology) & Blockchain technologies" = "DLT & Blockchain technologies",
                        "Information and Communication Technology" = "IT and Communication Tech",
                        "Key Enabling Technologies for the Bio-Based Industry" = "Key Enabling Technologies"))

q206 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_206.png",width = 15,height=7.5)
#----
#q_406
# ----
q406 <-  df %>% 
  select(starts_with("q_406")) %>%
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
                      q_406_1 = "Digital skills",
                      q_406_2 = "IT and Communication Tech",
                      q_406_3 = "Cybersecurity",
                      q_406_4 = "Data mining tools/strategies",
                      q_406_5 = "Key Enabling Technologies",
                      q_406_7 = "Traceability and logistics",
                      q_406_6 = "DLT & Blockchain technologies",
                      q_406_8 = "AI technologies"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q406 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  # labs(title = "Soft skills: Educational levels\n") +
  scale_x_continuous(breaks = q406$value_num, labels = q406$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_406.png",width = 15,height=7.5)
#----

###########################
# 4.2.19.	Research and Innovation	13

#q_207
#----
q207 <- df %>% 
  select(starts_with("q_207")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_207_1 = "1",q_207_2 = "2",
                       q_207_3 = "3",q_207_4 = "4",q_207_5 = "5"),
         value = recode(value,
                        "Knowledge Transfer: From LAB to Industry" = "Knowledge Transfer",
                        "Management and development of research" = "Research management and development"))

q207 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_207.png",width = 15,height=7.5)
#----
#q_407
# ----
q407 <-  df %>% 
  select(starts_with("q_407")) %>%
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
                      q_407_1 = "Innovation and change",
                      q_407_2 = "Research management and development",
                      q_407_3 = "Knowledge Transfer",
                      q_407_4 = "Fundamental research",
                      q_407_5 = "Analytical capacity"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q407 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  # labs(title = "Soft skills: Educational levels\n") +
  scale_x_continuous(breaks = q407$value_num, labels = q407$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_407.png",width = 15,height=7.5)
#----

###########################
# 4.2.20.	Basic scientific knowledge	13

#q_208
#----
q208 <- df %>% 
  select(starts_with("q_208")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_208_1 = "1",q_208_2 = "2",
                       q_208_3 = "3",q_208_4 = "4",q_208_5 = "5",
                       q_208_6 = "6",q_208_7 = "7",q_208_8 = "8"),
         value = recode(value,
                        "Information and Communication Technologies." = "IT and Communication Tech"))

q208 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_208.png",width = 15,height=7.5)
#----
#q_408
# ----
q408 <-  df %>% 
  select(starts_with("q_408")) %>%
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
                      q_408_1 = "Maths",
                      q_408_2 = "IT and Communication Tech",
                      q_408_3 = "Physics",
                      q_408_4 = "Chemistry",
                      q_408_5 = "Biotechnology",
                      q_408_6 = "Biology",
                      q_408_7 = "Chemical Engineering",
                      q_408_8 = "Nanotechnology"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q408 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  # labs(title = "Soft skills: Educational levels\n") +
  scale_x_continuous(breaks = q408$value_num, labels = q408$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_408.png",width = 15,height=7.5)
#----

###########################
# 4.2.21.	Rules and regulations	13

#q_209
#----
q209 <- df %>% 
  select(starts_with("q_209")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_209_1 = "1",q_209_2 = "2",
                       q_209_3 = "3",q_209_4 = "4",q_209_5 = "5",
                       q_209_6 = "6",q_209_7 = "7",q_209_8 = "8"),
         value = recode(value,
                        "Bio-based products legal framework" = "Legal framework",
                        "IPR - Intellectual Property Rights" = "Intellectual Property Rights",
                        "Quality, safety and security regulations" = "Quality, safety and security"))

q209 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_209.png",width = 15,height=7.5)
#----
#q_409
# ----
q409 <-  df %>% 
  select(starts_with("q_409")) %>%
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
                      q_409_1 = "Local legal regulations",
                      q_409_2 = "Patent regulations",
                      q_409_3 = "Intellectual Property Rights",
                      q_409_4 = "Common EU regulations",
                      q_409_5 = "Quality, safety and security",
                      q_409_6 = "Waste regulations",
                      q_409_7 = "Legal framework",
                      q_409_8 = "Digital Compliance"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q409 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q409$value_num, labels = q409$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_409.png",width = 15,height=7.5)
#----

###########################
# 4.2.22.	Social responsibility – CSR	13

#q_210
#----
q210 <- df %>% 
  select(starts_with("q_210")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_210_1 = "1",q_210_2 = "2",
                       q_210_3 = "3",q_210_4 = "4",q_210_5 = "5",
                       q_210_6 = "6",q_210_7 = "7",q_210_8= "8"),
         value = recode(value,
                        "Economic responsibilities" = "Economic",
                        "Environmental responsibility" = "Environmental",
                        "Ethical responsibilities" = "Ethical",
                        "Health Responsibilities" = "Health",
                        "Legal responsibilities" = "Legal",
                        "Philanthropic responsibilities" = "Philanthropic"))

q210 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_210.png",width = 15,height=7.5)
#----
#q_410
# ----
q410 <-  df %>% 
  select(starts_with("q_410")) %>%
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
                      q_410_1 = "Economic",
                      q_410_2 = "Legal",
                      q_410_3 = "Ethical",
                      q_410_4 = "Philanthropic",
                      q_410_5 = "Environmental",
                      q_410_6 = "Green engineering awareness",
                      q_410_7 = "Health",
                      q_410_8 = "Self-consumption energies"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q410 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q410$value_num, labels = q410$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_410.png",width = 15,height=7.5)
#----

###########################
# 4.2.23.	Sales and marketing	13

#q_211
#----
q211 <- df %>% 
  select(starts_with("q_211")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*110) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_211_1 = "1",q_211_2 = "2",
                       q_211_3 = "3",q_211_4 = "4",q_211_5 = "5",
                       q_211_6 = "6"),
         value = recode(value,
                        "Adapting the products to new targets" = "Adapting products",
                        "Increasing consumer/society  awareness on bio-based products" = "Increasing product awareness",
                        "Marketing online and Social Media" = "Online marketing and SoMe",
                        "Openness of the industrial processes and products" = "Openness: products and processes",
                        "Packaging solutions derived from bio-based materials" = "Packaging solutions"))

q211 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_211.png",width = 15,height=7.5)
#----
#q_411
# ----
q411 <-  df %>% 
  select(starts_with("q_411")) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(value = recode(value, 
                        "Vocational Education and Training (VET)*" = "VET",
                        "Bachelor/engineer – (Undergraduate)" = "BA/engineer")) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(percent = n/n_tot*110) %>%
  ungroup() %>%
  mutate(key = recode(key, 
                      q_411_1 = "Market globalization",
                      q_411_2 = "Adapting products",
                      q_411_3 = "Openness: products and processes",
                      q_411_4 = "Online marketing and SoMe",
                      q_411_5 = "Increasing product awareness",
                      q_411_6 = "Packaging solutions"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q411 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q411$value_num, labels = q411$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_411.png",width = 15,height=7.5)
