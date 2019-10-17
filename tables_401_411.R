# tables 401-411

library(tidyverse)
library(scales)

df <- read_csv2("Survey_consolidated_filter_23092019.csv") %>%
  mutate_if(is.character, 
            ~replace(., grepl("Bachelor/engineer", .), "BA/engineer")) %>%
  filter(n_complete > 90)
#company_type == "i")

weights <- seq(0,100,100/3)

# 401 Management 
#----
table_401 <- df %>% 
  select(starts_with("q_401")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, q_401_1 = "Purchasing",q_401_2 = "Quality",
                       q_401_3 = "Product / Logistics",q_401_4 = "Resources",
                       q_401_5 = "Industrial linkers",
                       q_401_6 = "Development of business models",
                       q_401_7 = "Life Cycle Assesment (LCA) of Bio-based industry processes",
                       q_401_8 = "Project Management")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
            VET          * weights[1] +
           `BA/engineer` * weights[2] +
            Master       * weights[3] +
            PhD          * weights[4],
            score = w_sum/sum_n,
            `Gen. score` = w_sum/sum(w_sum))


write_csv2(table_401,"Tables/table_401.csv")

# 402 Data Management 
#----
table_402 <- df %>% 
  select(starts_with("q_402")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_402_1 = "Data sensing technologies",
                           q_402_2 = "Data processing (carry out, retrieve, transform)",
                           q_402_3 = "Data transmission technologies & standards",
                           q_402_4 = "Data Analytics & Advanced Analytics",
                           q_402_5 = "Data Exploitation Technologies",
                           q_402_6 = "Information security and cybersecurity")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_402,"Tables/table_402.csv")


# 403 Personal initiative and entrepreneurship
#----
table_403 <- df %>% 
  select(starts_with("q_403")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_403_1 = "Critical thinking",
                           q_403_2 = "Problem solving",
                           q_403_3 = "Engagement capacity to involve different types of Stakeholders (clustering)",
                           q_403_4 = "Creativity",
                           q_403_5 = "Empathy",
                           q_403_6 = "Persuasion",
                           q_403_7 = "Proactivity")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_403,"Tables/table_403.csv")

# 404 Soft Skills
#----
table_404 <- df %>% 
  select(starts_with("q_404")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_404_1 = "Communication (public speaking)",
                           q_404_2 = "Communication (writing)",
                           q_404_3 = "Relationship building",
                           q_404_4 = "Teamwork and conflict resolution",
                           q_404_5 = "Adaptability",
                           q_404_6 = "Personal branding",
                           q_404_7 = "Collaboration",
                           q_404_8 = "Foreign Languages Competence")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_404,"Tables/table_404.csv")

# 405 Sustainability and Industry
#----
table_405 <- df %>% 
  select(starts_with("q_405")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_405_1 = "Ecological perspective",
                           q_405_2 = "Circular economy / Zero waste industry",
                           q_405_3 = "Sustainable competitiveness / Economy",
                           q_405_4 = "Secure bio-based materials and residues stability, availability, transport and storage",
                           q_405_5 = "Monitoring contaminants in the products",
                           q_405_6 = "Recyclability concepts for bio-based materials")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_405,"Tables/table_405.csv")

# 406 Technology / STEM (Science, Technology, Engineering and Maths)
#----
table_406 <- df %>% 
  select(starts_with("q_406")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_406_1 = "Digital skills",
                           q_406_2 = "Information and Communication Technology",
                           q_406_3 = "Cybersecurity",
                           q_406_4 = "Data mining tools/strategies",
                           q_406_5 = "Key Enabling Technologies for the Bio-Based Industry",
                           q_406_6 = "Traceability and logistics",
                           q_406_7 = "DLT (Distributed ledger technology) & Blockchain technologies",
                           q_406_8 = "Artificial Intelligence technologies")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_406,"Tables/table_406.csv")

# 407 Research & Innovation
#----
table_407 <- df %>% 
  select(starts_with("q_407")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_407_1 = "Innovation and change",
                           q_407_2 = "Management and development of research",
                           q_407_3 = "Knowledge Transfer: From LAB to Industry",
                           q_407_4 = "Fundamental research",
                           q_407_5 = "Analytical capacity")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_407,"Tables/table_407.csv")

# 408 Basic Scientific Knowledge
#----
table_408 <- df %>% 
  select(starts_with("q_408")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_408_1 = "Maths",
                           q_408_2 = "Information and Communication Technologies",
                           q_408_3 = "Physics",
                           q_408_4 = "Chemistry",
                           q_408_5 = "Biotechnology",
                           q_408_6 = "Biology",
                           q_408_7 = "Chemical Engineering",
                           q_408_8 = "Nanotechnology")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_408,"Tables/table_408.csv")

# 409 Rules and Regulations
#----
table_409 <- df %>% 
  select(starts_with("q_409")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_409_1 = "Local legal regulations",
                           q_409_2 = "Patent regulations",
                           q_409_3 = "IPR - Intellectual Property Rights",
                           q_409_4 = "Common EU regulations",
                           q_409_5 = "Quality, safety and security regulations",
                           q_409_6 = "Waste regulations",
                           q_409_7 = "Bio-based products legal framework",
                           q_409_8 = "Digital Compliance")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_409,"Tables/table_409.csv")


# 410 Social Responsibility - CSR
#----
table_410 <- df %>% 
  select(starts_with("q_410")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_410_1 = "Economic responsibilities",
                           q_410_2 = "Legal responsibilities",
                           q_410_3 = "Ethical responsibilities",
                           q_410_4 = "Philanthropic responsibilities",
                           q_410_5 = "Environmental responsibility",
                           q_410_6 = "Green engineering awareness",
                           q_410_7 = "Health Responsibilities",
                           q_410_8 = "Self-consumption energies")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_410,"Tables/table_410.csv")

# 411 Sales and Marketing
#----
table_411 <- df %>% 
  select(starts_with("q_411")) %>%
  gather() %>%
  filter(!is.na(value)) %>%
  count(key,value) %>%
  filter(value != "Not selected") %>%
  mutate(Category = recode(key, 
                           q_411_1 = "Market globalization",
                           q_411_2 = "Adapting the products to new targets",
                           q_411_3 = "Openness of the industrial processes and products",
                           q_411_4 = "Marketing online and Social Media",
                           q_411_5 = "Increasing consumer/society  awareness on bio-based products",
                           q_411_6 = "Packaging solutions derived from bio-based materials")) %>%
  select(-key) %>%
  pivot_wider(names_from = value,values_from = n) %>%
  select(Category, VET = `Vocational Education and Training (VET)*`,
         `BA/engineer`, Master, PhD, everything()) %>%
  mutate_if(is.numeric, ~replace(., is.na(.), 0)) %>%
  mutate(sum_n = rowSums(select(., -Category))) %>%
  mutate(w_sum =
           VET          * weights[1] +
           `BA/engineer` * weights[2] +
           Master       * weights[3] +
           PhD          * weights[4],
         score = w_sum/sum_n)


write_csv2(table_411,"Tables/table_411.csv")

