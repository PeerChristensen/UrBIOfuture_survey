# 4.1.	Description of the respondents

library(tidyverse)
library(hrbrthemes)
library(countrycode)
library(scales)

# df <- read_csv2("Survey_consolidated_filter_20092019.csv") %>%
#   mutate_if(is.character, 
#             ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
#   filter(n_complete>102)

df <- read_csv2("Survey_consolidated_filter_23092019.csv")

# theme
# ----
theme_ubf <- function () { 
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
    )
}
theme_set(theme_ubf())
# ----
# 4.1.4.	Age distribution "q_101"
# ----
df %>% 
  count(q_101) %>%
  filter(!is.na(q_101)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_101 = fct_relevel(factor(q_101),"> 60", after = 6)) %>%
  ggplot(aes(q_101,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) 
ggsave("q_101.png", width=7,height=6)

# ----
# 4.1.5.	Gender distribution	"q_102"
# ----
df %>% 
  select(q_102_1,q_102_2,q_102_3) %>%
  gather() %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Gender = recode(key, q_102_1 = "Male",q_102_2 = "Female",q_102_3 = "Non-binary"),
         pct   = n/sum(n) * 100) %>%
  ggplot(aes(Gender,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) 
ggsave("q_102.png",width=7,height=6)

# ----
# 4.1.6.	Educational level	q_103
# ----
df %>% 
  count(q_103) %>%
  filter(!is.na(q_103)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_103 = recode(q_103, 
                        "VET - Vocational Education and Training" = "VET")) %>%
  ggplot(aes(q_103,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
#  ggtitle("Educational level") +
  theme(axis.text.x=element_text(angle=45,vjust=1,hjust=1))

ggsave("q_103.png",width=7,height=6)
# ----
# 4.1.7.	Experiences in the bio-based industries q_104
# ----
df %>% 
  count(q_104) %>%
  filter(!is.na(q_104)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_104 = fct_relevel(factor(q_104),"> 15 years", after = Inf)) %>%
  ggplot(aes(q_104,pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  #ggtitle("Experience in the bio-based\nindustries") +
  theme(axis.text.x=element_text(angle=45,vjust=1,hjust=1))
ggsave("q_104.png",height=7)

# ----
# 4.1.8.	Job positions q_105
# ----
df %>% 
  count(q_105) %>%
  filter(!is.na(q_105)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_105 = recode(q_105, "Technician and associate professional" = "Technician and assoc. professional", 
                        "Clerical support (personal assistant, secretary, etc..)" = "Clerical support",
                        "Service and market sales worker" = "Service and market sales", 
                        "Elementary (low education level or no qualifications at all)" = "Elementary")) %>%
  ggplot(aes(reorder(q_105,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  ggtitle("Job positions") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  coord_flip()
ggsave("q_105.png",width=10,height=6)

# ----
# 4.1.9.	Country of company headquarters distribution "q_109"
# ----
df %>% 
  filter(!is.na(q_109)) %>%
  count(q_109) %>%
  mutate(pct = n/sum(n)*100) %>%
  ggplot(aes(reorder(q_109,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  #labs(title="Country of company headquarters") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  coord_flip() 
ggsave("q_109.png",height=9, width=10)
# ----
# 4.1.10.	Country of workplace "q_110"
# ----
df %>% 
  filter(!is.na(q_110)) %>%
  count(q_110) %>%
  mutate(pct = n/sum(n)*100) %>%
  ggplot(aes(reorder(q_110,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  #labs(title="Country of workplace") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  coord_flip() 
ggsave("q_110.png",height=9, width=10)

# # region
# 
# df$region_work <- countrycode(sourcevar = df$q_110,origin = "country.name",destination="region")
# 
# region <- df %>% 
#   filter(!is.na(q_110)) %>%
#   count(region_work) %>%
#   ggplot(aes(reorder(region_work,n),n)) +
#   geom_col() +
#   geom_col(fill="#98C455",color="#98C455") +
#   theme_ipsum_rc() +
#   labs(title="Regions") +
#   theme(plot.margin = margin(2,1, 2,1, "cm"),
#         plot.title = element_text(size=30,margin=margin(b=1,unit="cm")),
#         axis.text.y = element_text(size = 24,
#                                    margin = margin(r = .3, unit = "cm")),
#         axis.text.x = element_text(size = 20,angle=45,hjust=1),
#         #panel.grid = element_blank(),
#         # axis.title.y = element_blank(),
#         axis.title.y = element_text(size = 24,margin=margin(r=1,unit="cm")),
#         axis.title.x = element_blank(),
#         panel.grid.major.x = element_blank(),
#         legend.title = element_blank(),
#         legend.key.size = unit(1.5, "cm"),
#         legend.text = element_text(size=24),
#         strip.text = element_text(size=28,margin=margin(b=1,unit="cm"))) #+
# #coord_flip() 
# 
# cowplot::plot_grid(region,country,align="h",ncol=2,rel_widths = c(2/5, 3/5))

# ----
# 4.1.11.	Company sector activities "q_111"
# ----
df %>% 
  filter(!is.na(q_111)) %>%
  count(q_111) %>%
  mutate(pct = n/sum(n)*100) %>%
  ggplot(aes(reorder(q_111,pct),pct)) +
  geom_col(fill="#98C455",color=NA) +
  #labs(title="Company sector activities") +
  theme(axis.text.y = element_text(hjust=1),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line()) +
  scale_y_continuous(labels=percent_format(scale=1)) +
  coord_flip() 
ggsave("q_111.png",height=9, width=10)
# ----
# 4.1.12.	Company sizes q_112
# ----
df %>% 
  count(q_112) %>%
  filter(!is.na(q_112)) %>%
  mutate(pct   = n/sum(n) * 100,
         q_112 = recode(q_112, "< 10 employees (Microcompany)" = "< 10",
                        "11 to 49 employees (Small company)" = "11 to 49",
                        "50 to 249 employees (Medium Company)" = "50 to 249",
                        "= > 250 employees (Large Company)" = "> 250")) %>%
  mutate(q_112 = fct_relevel(factor(q_112),"> 250", after = Inf)) %>%
  ggplot(aes(q_112,pct)) +
  geom_col(fill="#98C455",color=NA) +
  #labs(title="Company size (employees)") +
  theme(axis.text.x = element_text(angle=45,vjust=1,hjust=1),
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line()) +
  scale_y_continuous(labels=percent_format(scale=1))
ggsave("q_112.png",height=6,width=7)
# ----
