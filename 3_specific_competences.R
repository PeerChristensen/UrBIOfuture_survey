# Specific competences of bio-based industry sector	13

library(tidyverse)
library(hrbrthemes)
library(scales)

# df <- read_csv2("Survey_consolidated_filter_20092019.csv") %>%
#   mutate_if(is.character, 
#             ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
#   filter(n_complete>102)

df <- read_csv2("Survey_consolidated_filter_23092019.csv") %>%
  filter(n_complete > 90)

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

#########################################################################
# 4.3.24.	Specialists in bio-based sector business/market development	13

#q_301
#----
q301 <- df %>% 
  select(starts_with("q_301")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_301_1 = "1",q_301_2 = "2",
                       q_301_3 = "3",q_301_4 = "4",q_301_5 = "5"),
         value = recode(value,
                        "Bio-based-market knowledge & tecno-economic expertise" = "Market knowledge & tecno-econ. expertise",
                        "Identify and create market applications for new bio-based products" = "Identify and create market applications",
                        "New Bio-based Business Models based on technological surveillance, competitive intelligence and funding attraction" = "New business models",
                        "New Blue-Bio-based Business models and Value chains" = "New blue business models & value chains",
                        "To raise society's awareness on circular bio-based economy" = "Raise societal awareness"))

q301 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_301.png",width = 15,height=7.5)
#----
#q_501
# ----

q501 <-  df %>% 
  select(starts_with("q_501")) %>%
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
                      q_501_1 = "Market knowledge & tecno-econ. expertise",
                      q_501_2 = "Raise societal awareness",
                      q_501_3 = "Identify and create market applications",
                      q_501_4 = "New blue business models & value chains",
                      q_501_5 = "New business models"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q501 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q501$value_num, labels = q501$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_501.png",width = 15,height=7.5)

#----

#########################################################################
# 4.3.25.	Technical expertise in sustainable biomass production	13

#q_302
#----
q302 <- df %>% 
  select(starts_with("q_302")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_302_1 = "1",q_302_2 = "2",
                       q_302_3 = "3",q_302_4 = "4",q_302_5 = "5"),
         value = recode(value,
                        "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)" = "Advance ICT applications",
                        "Advanced pre-treatments at harvest-storage stage" = "Advanced pre-treatments",
                        "Feedstock-specific & market driven cascade valorization" = "Cascade valorization",
                        "Life Cycle assessment of processes, biorefineries and bio-based value chains" = "LCA",
                        "New varieties of macro- micro- organisms for cost-effective bio-products" = "New varieties of organisms",
                        "Precision equipment for biomass harvest/collection" = "Precision equipment",
                        "Techno-economic assessment of processes, biorefineries and bio-based value chains" = "Techno-economic assessment"))

q302 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_302.png",width = 15,height=7.5)
#----
#q_502
# ----

q502 <-  df %>% 
  select(starts_with("q_502")) %>%
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
                      q_502_1 = "Advanced pre-treatments",
                      q_502_2 = "Precision farming",
                      q_502_3 = "Cascade valorization",
                      q_502_4 = "Precision equipment",
                      q_502_5 = "Advance ICT applications",
                      q_502_6 = "Techno-economic assessment",
                      q_502_7 = "LCA",
                      q_502_8 = "New varieties of organisms"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q502 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q502$value_num, labels = q502$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_502.png",width = 15,height=7.5)

#----
#########################################################################
# 4.3.26.	Technical expertise in primary conversion processes	13

#q_303
#----
q303 <- df %>% 
  select(starts_with("q_303")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_303_1 = "1",q_303_2 = "2",
                       q_303_3 = "3",q_303_4 = "4",q_303_5 = "5"),
         value = recode(value,
                        "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)" = "Advance ICT applications",
                        "Advanced pre-treatments at harvest-storage stage" = "Advanced pre-treatments",
                        "Feedstock-specific & market driven cascade valorization" = "Cascade valorization",
                        "Life Cycle assessment of processes, biorefineries and bio-based value chains" = "LCA",
                        "New varieties of macro- micro- organisms for cost-effective bio-products" = "New varieties of organisms",
                        "Precision equipment for biomass harvest/collection" = "Precision equipment",
                        "Techno-economic assessment of processes, biorefineries and bio-based value chains" = "Techno-economic assessment"))

q303 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_303.png",width = 15,height=7.5)
#----
#q_503
# ----

q503 <-  df %>% 
  select(starts_with("q_503")) %>%
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
                      q_503_1 = "Advanced pre-treatments",
                      q_503_2 = "Precision farming",
                      q_503_3 = "Cascade valorization",
                      q_503_4 = "Precision equipment",
                      q_503_5 = "Advance ICT applications",
                      q_503_6 = "Techno-economic assessment",
                      q_503_7 = "LCA",
                      q_503_8 = "New varieties of organisms"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q503 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q503$value_num, labels = q503$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_503.png",width = 15,height=7.5)

#----

#########################################################################
# 4.3.27.	Technical expertise in secondary conversion processes	13

#q_304
#----
q304 <- df %>% 
  select(starts_with("q_304")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_304_1 = "1",q_304_2 = "2",
                       q_304_3 = "3",q_304_4 = "4",q_304_5 = "5",
                       q_304_6 = "6",q_304_7 = "7",q_304_8 = "8"),
         value = recode(value,
                        "Advanced methods to preserve and generate functional natural macromolecular polymers’" = "Adv. methods...polymers",
                        "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture," = "Biopolymer processing",
                        "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products" = "Chemo-catal. & Thermo-chem.",
                        "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring" = "Design of control systems",
                        "Hybridization of processes for different feedstock valorization" = "Hybridization of processes",
                        "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap" = "efficient methods...bio-chem",
                        "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology" = "Oleochemistry",
                        "Polymerisation processes based on new bio-based monomers" = "Polymerisation processes"))

q304 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_304.png",width = 15,height=7.5)
#----
#q_504
# ----

q504 <-  df %>% 
  select(starts_with("q_504")) %>%
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
                      q_504_1 = "Chemo-catal. & Thermo-chem.",
                      q_504_2 = "Hybridization of processes",
                      q_504_3 = "efficient methods...bio-chem",
                      q_504_4 = "Design of control systems",
                      q_504_5 = "Adv. methods...polymers",
                      q_504_6 = "Biopolymer processing",
                      q_504_7 = "Polymerisation processes",
                      q_504_8 = "Oleochemistry"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q504 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q504$value_num, labels = q504$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_504.png",width = 15,height=7.5)

#----

#########################################################################
# 4.3.28.	Technical expertise in materials, products and functionalization	13

#q_305
#----
q305 <- df %>% 
  select(starts_with("q_305")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  group_by(key) %>%
  mutate(n_tot = sum(n)) %>%
  mutate(Percent = n/n_tot*100) %>%
  ungroup() %>%
  filter(value != "Not selected") %>%
  mutate(Rank = recode(key, q_305_1 = "1",q_305_2 = "2",
                       q_305_3 = "3",q_305_4 = "4",q_305_5 = "5",
                       q_305_6 = "6",q_305_7 = "7",q_305_8 = "8"),
         value = recode(value,
                        "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers." = "Alternatives: existing polymers",
                        "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica" = "Extraction techniques",
                        "Materials based on lignin (and bio-aromatic) chemistry" = "Lignin-based materials",
                        "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents" = "Oil-based materials",
                        "New (chemical) building blocks from renewable resources." = "New (chemical) building blocks",
                        "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car" = "New bio-based materials",
                        "New packaging solutions derived from bio-based materials" = "New packaging solutions ",
                        "New products design from bio-waste." = "New products design"))

q305 %>% 
  ggplot(aes(Rank,Percent)) +
  geom_col(fill="#98C455",color=NA) +
  theme_ipsum_rc() +
  facet_wrap(~value,nrow=2) +
  theme_ubf_2() +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_305.png",width = 15,height=7.5)
#----
#q_505
# ----

q505 <-  df %>% 
  select(starts_with("q_505")) %>%
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
                      q_505_1 = "Lignin-based materials",
                      q_505_2 = "Oil-based materials",
                      q_505_3 = "Alternatives: existing polymers",
                      q_505_4 = "Extraction techniques",
                      q_505_5 = "New (chemical) building blocks",
                      q_505_6 = "New bio-based materials",
                      q_505_7 = "New packaging solutions",
                      q_505_8 = "New products design"),
         value_num = case_when(
           value == "VET"         ~ 1,
           value == "BA/engineer" ~ 2,
           value == "Master"      ~ 3,
           value == "PhD"         ~ 4))

q505 %>% 
  ggplot(aes(value_num, percent)) +
  geom_col(fill="#98C455",color=NA) +
  scale_x_continuous(breaks = q505$value_num, labels = q505$value) +
  theme_ipsum_rc() +
  facet_wrap(~key, nrow = 2) +
  theme_ubf_2() +
  theme(axis.text.x = element_text(angle=45,hjust=1,vjust=1)) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("images/q_505.png",width = 15,height=7.5)

#----
