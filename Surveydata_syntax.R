#$Rev: 9205 $ .
dfeng <- read.table("survey_28396_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

dfger <- read.table("survey_49122_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

dfesp <- read.table("survey_65596_data_file.csv", sep=",", quote = "'", na.strings=c("","\"\""), stringsAsFactors=FALSE)

data <- rbind(dfeng, dfger, dfesp)

data[, 1] <- as.numeric(data[, 1])
attributes(data)$variable.labels[1] <- "id"
names(data)[1] <- "id"

data[, 2] <- as.character(data[, 2])
attributes(data)$variable.labels[2] <- "submitdate"
names(data)[2] <- "submitdate"

#Field hidden

data[, 3] <- as.character(data[, 3])
attributes(data)$variable.labels[3] <- "startlanguage"
names(data)[3] <- "startlanguage"

data[, 4] <- as.numeric(data[, 4])
attributes(data)$variable.labels[4] <- "[Yes] I agree to participate in the research study. I understand the purpose and nature of this study and I am participating voluntarily. I understand that I can withdraw from the study at any time, without any penalty or consequences."
data[, 4] <- factor(data[, 4], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[4] <- "q_01_SQ001"

data[, 5] <- as.numeric(data[, 5])
attributes(data)$variable.labels[5] <- "[No] I agree to participate in the research study. I understand the purpose and nature of this study and I am participating voluntarily. I understand that I can withdraw from the study at any time, without any penalty or consequences."
data[, 5] <- factor(data[, 5], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[5] <- "q_01_SQ002"

data[, 6] <- as.numeric(data[, 6])
attributes(data)$variable.labels[6] <- "[Yes] I agree to receive the project newsletter and information about the events and results."
data[, 6] <- factor(data[, 6], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[6] <- "q_02_SQ001"

data[, 7] <- as.numeric(data[, 7])
attributes(data)$variable.labels[7] <- "[No] I agree to receive the project newsletter and information about the events and results."
data[, 7] <- factor(data[, 7], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[7] <- "q_02_SQ002"

data[, 8] <- as.character(data[, 8])
attributes(data)$variable.labels[8] <- "?Age"
data[, 8] <- factor(data[, 8], levels=c( "A1", "A2", "A3", "A4", "A5", "A6"), labels=c( "< 20", "21 - 30", "31 - 40", "41 - 50", "51 - 60", "> 60"))
names(data)[8] <- "q_101"

data[, 9] <- as.numeric(data[, 9])
attributes(data)$variable.labels[9] <- "[Male] ?Gender"
data[, 9] <- factor(data[, 9], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[9] <- "q_102_1"

data[, 10] <- as.numeric(data[, 10])
attributes(data)$variable.labels[10] <- "[Female] ?Gender"
data[, 10] <- factor(data[, 10], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[10] <- "q_102_2"

data[, 11] <- as.numeric(data[, 11])
attributes(data)$variable.labels[11] <- "[Non-binary] ?Gender"
data[, 11] <- factor(data[, 11], levels=c( 1, 0), labels=c( "Yes", "Not selected"))
names(data)[11] <- "q_102_3"

data[, 12] <- as.numeric(data[, 12])
attributes(data)$variable.labels[12] <- "Your level of Studies"
data[, 12] <- factor(data[, 12], levels=c( 1, 2, 3, 4), labels=c( "VET - Vocational Education and Training", "Undergraduate", "Master", "PhD"))
names(data)[12] <- "q_103"

data[, 13] <- as.numeric(data[, 13])
attributes(data)$variable.labels[13] <- "Years of experience in the Bio-based Industries Sector"
data[, 13] <- factor(data[, 13], levels=c( 1, 2, 3), labels=c( "< 5 years", "6 to 15 years", "> 15 years"))
names(data)[13] <- "q_104"

data[, 14] <- as.numeric(data[, 14])
attributes(data)$variable.labels[14] <- "?Your Job Position (according to CEDEFOP, 2014)"
data[, 14] <- factor(data[, 14], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9), labels=c( "Manager", "Professional", "Technician and associate professional", "Clerical support (personal assistant, secretary, etc..)", "Service and market sales worker", "Skilled agricultural, forestry and fishing", "Building, crafts or related trades", "Plant and machine operator and assembler", "Elementary (low education level or no qualifications at all)"))
names(data)[14] <- "q_105"

data[, 15] <- as.character(data[, 15])
attributes(data)$variable.labels[15] <- "[Other] ?Your Job Position (according to CEDEFOP, 2014)"
names(data)[15] <- "q_105_other"

data[, 16] <- as.character(data[, 16])
attributes(data)$variable.labels[16] <- "?Name of the company"
names(data)[16] <- "q_106"

data[, 17] <- as.character(data[, 17])
attributes(data)$variable.labels[17] <- "?Website of the Company"
names(data)[17] <- "q_107"

data[, 18] <- as.character(data[, 18])
attributes(data)$variable.labels[18] <- "?Your contact e-mail:"
names(data)[18] <- "q_108"

data[, 19] <- as.numeric(data[, 19])
attributes(data)$variable.labels[19] <- "Your company headquarters country"
data[, 19] <- factor(data[, 19], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30), labels=c( "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden", "United Kingdom", "Outside the European Union"))
names(data)[19] <- "q_109"

data[, 20] <- as.numeric(data[, 20])
attributes(data)$variable.labels[20] <- "?Your workplace country"
data[, 20] <- factor(data[, 20], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29), labels=c( "Austria", "Belgium", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Slovakia", "Slovenia", "Spain", "Sweden", "United Kingdom"))
names(data)[20] <- "q_110"

data[, 21] <- as.numeric(data[, 21])
attributes(data)$variable.labels[21] <- "Your company sector activity (According to EU, 2017)"
data[, 21] <- factor(data[, 21], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22), labels=c( "Agriculture", "Beverages", "Bioenergy", "Biofuels", "Biorefinery", "Biotechnology", "Chemical", "Construction materials", "Cosmetics", "Feed", "Fertilisers", "Fishery", "Food products", "Forest-based industry", "Forestry", "Heat (biogas and solid biomass)", "Maritime", "Paper and paper products", "Pharmaceuticals", "Plastics", "Textile and textile products", "Tobacco products"))
names(data)[21] <- "q_111"

data[, 22] <- as.character(data[, 22])
attributes(data)$variable.labels[22] <- "[Other] Your company sector activity (According to EU, 2017)"
names(data)[22] <- "q_111_other"

data[, 23] <- as.numeric(data[, 23])
attributes(data)$variable.labels[23] <- "Your Company Size (Number of employees)"
data[, 23] <- factor(data[, 23], levels=c( 1, 2, 3, 4), labels=c( "< 10 employees (Microcompany)", "11 to 49 employees (Small company)", "50 to 249 employees (Medium Company)", "= > 250 employees (Large Company)"))
names(data)[23] <- "q_112"

data[, 24] <- as.numeric(data[, 24])
attributes(data)$variable.labels[24] <- "[Rank 1] ?Management"
data[, 24] <- factor(data[, 24], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[24] <- "q_201_1"

data[, 25] <- as.numeric(data[, 25])
attributes(data)$variable.labels[25] <- "[Rank 2] ?Management"
data[, 25] <- factor(data[, 25], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[25] <- "q_201_2"

data[, 26] <- as.numeric(data[, 26])
attributes(data)$variable.labels[26] <- "[Rank 3] ?Management"
data[, 26] <- factor(data[, 26], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[26] <- "q_201_3"

data[, 27] <- as.numeric(data[, 27])
attributes(data)$variable.labels[27] <- "[Rank 4] ?Management"
data[, 27] <- factor(data[, 27], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[27] <- "q_201_4"

data[, 28] <- as.numeric(data[, 28])
attributes(data)$variable.labels[28] <- "[Rank 5] ?Management"
data[, 28] <- factor(data[, 28], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[28] <- "q_201_5"

data[, 29] <- as.numeric(data[, 29])
attributes(data)$variable.labels[29] <- "[Rank 6] ?Management"
data[, 29] <- factor(data[, 29], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[29] <- "q_201_6"

data[, 30] <- as.numeric(data[, 30])
attributes(data)$variable.labels[30] <- "[Rank 7] ?Management"
data[, 30] <- factor(data[, 30], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[30] <- "q_201_7"

data[, 31] <- as.numeric(data[, 31])
attributes(data)$variable.labels[31] <- "[Rank 8] ?Management"
data[, 31] <- factor(data[, 31], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Purchasing", "Quality", "Product / Logistics", "Resources", "Industrial linkers", "Development of business models", "Life Cycle Assessment (LCA) of Bio-based industry processes", "Project Management"))
names(data)[31] <- "q_201_8"

data[, 32] <- as.numeric(data[, 32])
attributes(data)$variable.labels[32] <- "[Rank 1] Data Management"
data[, 32] <- factor(data[, 32], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[32] <- "q_202_1"

data[, 33] <- as.numeric(data[, 33])
attributes(data)$variable.labels[33] <- "[Rank 2] Data Management"
data[, 33] <- factor(data[, 33], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[33] <- "q_202_2"

data[, 34] <- as.numeric(data[, 34])
attributes(data)$variable.labels[34] <- "[Rank 3] Data Management"
data[, 34] <- factor(data[, 34], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[34] <- "q_202_3"

data[, 35] <- as.numeric(data[, 35])
attributes(data)$variable.labels[35] <- "[Rank 4] Data Management"
data[, 35] <- factor(data[, 35], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[35] <- "q_202_4"

data[, 36] <- as.numeric(data[, 36])
attributes(data)$variable.labels[36] <- "[Rank 5] Data Management"
data[, 36] <- factor(data[, 36], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[36] <- "q_202_5"

data[, 37] <- as.numeric(data[, 37])
attributes(data)$variable.labels[37] <- "[Rank 6] Data Management"
data[, 37] <- factor(data[, 37], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[37] <- "q_202_6"

data[, 38] <- as.numeric(data[, 38])
attributes(data)$variable.labels[38] <- "[Rank 7] Data Management"
data[, 38] <- factor(data[, 38], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Data sensing technologies", "Data processing (carry out, retrieve, transform)", "Data transmission technologies & standards", "Data Analytics & Advanced Analytics", "Data Exploitation Technologies", "Information security and cybersecurity", "Data architecture"))
names(data)[38] <- "q_202_7"

data[, 39] <- as.numeric(data[, 39])
attributes(data)$variable.labels[39] <- "[Rank 1] Personal initiative and entrepreneurship"
data[, 39] <- factor(data[, 39], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[39] <- "q_203_1"

data[, 40] <- as.numeric(data[, 40])
attributes(data)$variable.labels[40] <- "[Rank 2] Personal initiative and entrepreneurship"
data[, 40] <- factor(data[, 40], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[40] <- "q_203_2"

data[, 41] <- as.numeric(data[, 41])
attributes(data)$variable.labels[41] <- "[Rank 3] Personal initiative and entrepreneurship"
data[, 41] <- factor(data[, 41], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[41] <- "q_203_3"

data[, 42] <- as.numeric(data[, 42])
attributes(data)$variable.labels[42] <- "[Rank 4] Personal initiative and entrepreneurship"
data[, 42] <- factor(data[, 42], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[42] <- "q_203_4"

data[, 43] <- as.numeric(data[, 43])
attributes(data)$variable.labels[43] <- "[Rank 5] Personal initiative and entrepreneurship"
data[, 43] <- factor(data[, 43], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[43] <- "q_203_5"

data[, 44] <- as.numeric(data[, 44])
attributes(data)$variable.labels[44] <- "[Rank 6] Personal initiative and entrepreneurship"
data[, 44] <- factor(data[, 44], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[44] <- "q_203_6"

data[, 45] <- as.numeric(data[, 45])
attributes(data)$variable.labels[45] <- "[Rank 7] Personal initiative and entrepreneurship"
data[, 45] <- factor(data[, 45], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Critical thinking", "Problem solving", "Engagement capacity to involve different types of Stakeholders (clustering)", "Creativity", "Empathy", "Persuasion", "Proactivity"))
names(data)[45] <- "q_203_7"

data[, 46] <- as.numeric(data[, 46])
attributes(data)$variable.labels[46] <- "[Rank 1] Soft Skills"
data[, 46] <- factor(data[, 46], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[46] <- "q_204_1"

data[, 47] <- as.numeric(data[, 47])
attributes(data)$variable.labels[47] <- "[Rank 2] Soft Skills"
data[, 47] <- factor(data[, 47], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[47] <- "q_204_2"

data[, 48] <- as.numeric(data[, 48])
attributes(data)$variable.labels[48] <- "[Rank 3] Soft Skills"
data[, 48] <- factor(data[, 48], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[48] <- "q_204_3"

data[, 49] <- as.numeric(data[, 49])
attributes(data)$variable.labels[49] <- "[Rank 4] Soft Skills"
data[, 49] <- factor(data[, 49], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[49] <- "q_204_4"

data[, 50] <- as.numeric(data[, 50])
attributes(data)$variable.labels[50] <- "[Rank 5] Soft Skills"
data[, 50] <- factor(data[, 50], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[50] <- "q_204_5"

data[, 51] <- as.numeric(data[, 51])
attributes(data)$variable.labels[51] <- "[Rank 6] Soft Skills"
data[, 51] <- factor(data[, 51], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[51] <- "q_204_6"

data[, 52] <- as.numeric(data[, 52])
attributes(data)$variable.labels[52] <- "[Rank 7] Soft Skills"
data[, 52] <- factor(data[, 52], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[52] <- "q_204_7"

data[, 53] <- as.numeric(data[, 53])
attributes(data)$variable.labels[53] <- "[Rank 8] Soft Skills"
data[, 53] <- factor(data[, 53], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Communication (public speaking)", "Communication (writing)", "Relationship building", "Teamwork and conflict resolution", "Adaptability", "Personal branding", "Collaboration", "Foreign Languages Competence"))
names(data)[53] <- "q_204_8"

data[, 54] <- as.numeric(data[, 54])
attributes(data)$variable.labels[54] <- "[Rank 1] Sustainability and Industry"
data[, 54] <- factor(data[, 54], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Ecological perspective", "Circular economy / Zero waste industry", "Sustainable competitiveness / Economy", "Secure bio-based materials and residues stability, availability, transport and storage", "Monitoring contaminants in the products", "Recyclability concepts for bio-based materials"))
names(data)[54] <- "q_205_1"

data[, 55] <- as.numeric(data[, 55])
attributes(data)$variable.labels[55] <- "[Rank 2] Sustainability and Industry"
data[, 55] <- factor(data[, 55], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Ecological perspective", "Circular economy / Zero waste industry", "Sustainable competitiveness / Economy", "Secure bio-based materials and residues stability, availability, transport and storage", "Monitoring contaminants in the products", "Recyclability concepts for bio-based materials"))
names(data)[55] <- "q_205_2"

data[, 56] <- as.numeric(data[, 56])
attributes(data)$variable.labels[56] <- "[Rank 3] Sustainability and Industry"
data[, 56] <- factor(data[, 56], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Ecological perspective", "Circular economy / Zero waste industry", "Sustainable competitiveness / Economy", "Secure bio-based materials and residues stability, availability, transport and storage", "Monitoring contaminants in the products", "Recyclability concepts for bio-based materials"))
names(data)[56] <- "q_205_3"

data[, 57] <- as.numeric(data[, 57])
attributes(data)$variable.labels[57] <- "[Rank 4] Sustainability and Industry"
data[, 57] <- factor(data[, 57], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Ecological perspective", "Circular economy / Zero waste industry", "Sustainable competitiveness / Economy", "Secure bio-based materials and residues stability, availability, transport and storage", "Monitoring contaminants in the products", "Recyclability concepts for bio-based materials"))
names(data)[57] <- "q_205_4"

data[, 58] <- as.numeric(data[, 58])
attributes(data)$variable.labels[58] <- "[Rank 5] Sustainability and Industry"
data[, 58] <- factor(data[, 58], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Ecological perspective", "Circular economy / Zero waste industry", "Sustainable competitiveness / Economy", "Secure bio-based materials and residues stability, availability, transport and storage", "Monitoring contaminants in the products", "Recyclability concepts for bio-based materials"))
names(data)[58] <- "q_205_5"

data[, 59] <- as.numeric(data[, 59])
attributes(data)$variable.labels[59] <- "[Rank 6] Sustainability and Industry"
data[, 59] <- factor(data[, 59], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Ecological perspective", "Circular economy / Zero waste industry", "Sustainable competitiveness / Economy", "Secure bio-based materials and residues stability, availability, transport and storage", "Monitoring contaminants in the products", "Recyclability concepts for bio-based materials"))
names(data)[59] <- "q_205_6"

data[, 60] <- as.numeric(data[, 60])
attributes(data)$variable.labels[60] <- "[Rank 1] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 60] <- factor(data[, 60], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[60] <- "q_206_1"

data[, 61] <- as.numeric(data[, 61])
attributes(data)$variable.labels[61] <- "[Rank 2] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 61] <- factor(data[, 61], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[61] <- "q_206_2"

data[, 62] <- as.numeric(data[, 62])
attributes(data)$variable.labels[62] <- "[Rank 3] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 62] <- factor(data[, 62], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[62] <- "q_206_3"

data[, 63] <- as.numeric(data[, 63])
attributes(data)$variable.labels[63] <- "[Rank 4] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 63] <- factor(data[, 63], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[63] <- "q_206_4"

data[, 64] <- as.numeric(data[, 64])
attributes(data)$variable.labels[64] <- "[Rank 5] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 64] <- factor(data[, 64], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[64] <- "q_206_5"

data[, 65] <- as.numeric(data[, 65])
attributes(data)$variable.labels[65] <- "[Rank 6] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 65] <- factor(data[, 65], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[65] <- "q_206_6"

data[, 66] <- as.numeric(data[, 66])
attributes(data)$variable.labels[66] <- "[Rank 7] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 66] <- factor(data[, 66], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[66] <- "q_206_7"

data[, 67] <- as.numeric(data[, 67])
attributes(data)$variable.labels[67] <- "[Rank 8] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 67] <- factor(data[, 67], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Digital skills", "Information and Communication Technology", "Cybersecurity", "Data mining tools/strategies", "Key Enabling Technologies for the Bio-Based Industry", "Traceability and logistics", "DLT (Distributed ledger technology) & Blockchain technologies", "Artificial Intelligence technologies"))
names(data)[67] <- "q_206_8"

data[, 68] <- as.numeric(data[, 68])
attributes(data)$variable.labels[68] <- "[Rank 1] Research & Innovation"
data[, 68] <- factor(data[, 68], levels=c( 1, 2, 3, 4, 5), labels=c( "Innovation and change", "Management and development of research", "Knowledge Transfer: From LAB to Industry", "Fundamental research", "Analytical capacity"))
names(data)[68] <- "q_207_1"

data[, 69] <- as.numeric(data[, 69])
attributes(data)$variable.labels[69] <- "[Rank 2] Research & Innovation"
data[, 69] <- factor(data[, 69], levels=c( 1, 2, 3, 4, 5), labels=c( "Innovation and change", "Management and development of research", "Knowledge Transfer: From LAB to Industry", "Fundamental research", "Analytical capacity"))
names(data)[69] <- "q_207_2"

data[, 70] <- as.numeric(data[, 70])
attributes(data)$variable.labels[70] <- "[Rank 3] Research & Innovation"
data[, 70] <- factor(data[, 70], levels=c( 1, 2, 3, 4, 5), labels=c( "Innovation and change", "Management and development of research", "Knowledge Transfer: From LAB to Industry", "Fundamental research", "Analytical capacity"))
names(data)[70] <- "q_207_3"

data[, 71] <- as.numeric(data[, 71])
attributes(data)$variable.labels[71] <- "[Rank 4] Research & Innovation"
data[, 71] <- factor(data[, 71], levels=c( 1, 2, 3, 4, 5), labels=c( "Innovation and change", "Management and development of research", "Knowledge Transfer: From LAB to Industry", "Fundamental research", "Analytical capacity"))
names(data)[71] <- "q_207_4"

data[, 72] <- as.numeric(data[, 72])
attributes(data)$variable.labels[72] <- "[Rank 5] Research & Innovation"
data[, 72] <- factor(data[, 72], levels=c( 1, 2, 3, 4, 5), labels=c( "Innovation and change", "Management and development of research", "Knowledge Transfer: From LAB to Industry", "Fundamental research", "Analytical capacity"))
names(data)[72] <- "q_207_5"

data[, 73] <- as.numeric(data[, 73])
attributes(data)$variable.labels[73] <- "[Rank 1] Basic Scientific Knowledge"
data[, 73] <- factor(data[, 73], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[73] <- "q_208_1"

data[, 74] <- as.numeric(data[, 74])
attributes(data)$variable.labels[74] <- "[Rank 2] Basic Scientific Knowledge"
data[, 74] <- factor(data[, 74], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[74] <- "q_208_2"

data[, 75] <- as.numeric(data[, 75])
attributes(data)$variable.labels[75] <- "[Rank 3] Basic Scientific Knowledge"
data[, 75] <- factor(data[, 75], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[75] <- "q_208_3"

data[, 76] <- as.numeric(data[, 76])
attributes(data)$variable.labels[76] <- "[Rank 4] Basic Scientific Knowledge"
data[, 76] <- factor(data[, 76], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[76] <- "q_208_4"

data[, 77] <- as.numeric(data[, 77])
attributes(data)$variable.labels[77] <- "[Rank 5] Basic Scientific Knowledge"
data[, 77] <- factor(data[, 77], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[77] <- "q_208_5"

data[, 78] <- as.numeric(data[, 78])
attributes(data)$variable.labels[78] <- "[Rank 6] Basic Scientific Knowledge"
data[, 78] <- factor(data[, 78], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[78] <- "q_208_6"

data[, 79] <- as.numeric(data[, 79])
attributes(data)$variable.labels[79] <- "[Rank 7] Basic Scientific Knowledge"
data[, 79] <- factor(data[, 79], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[79] <- "q_208_7"

data[, 80] <- as.numeric(data[, 80])
attributes(data)$variable.labels[80] <- "[Rank 8] Basic Scientific Knowledge"
data[, 80] <- factor(data[, 80], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Maths", "Information and Communication Technologies.", "Physics", "Chemistry", "Biotechnology", "Biology", "Chemical Engineering", "Nanotechnology"))
names(data)[80] <- "q_208_8"

data[, 81] <- as.numeric(data[, 81])
attributes(data)$variable.labels[81] <- "[Rank 1] Rules and Regulations"
data[, 81] <- factor(data[, 81], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[81] <- "q_209_1"

data[, 82] <- as.numeric(data[, 82])
attributes(data)$variable.labels[82] <- "[Rank 2] Rules and Regulations"
data[, 82] <- factor(data[, 82], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[82] <- "q_209_2"

data[, 83] <- as.numeric(data[, 83])
attributes(data)$variable.labels[83] <- "[Rank 3] Rules and Regulations"
data[, 83] <- factor(data[, 83], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[83] <- "q_209_3"

data[, 84] <- as.numeric(data[, 84])
attributes(data)$variable.labels[84] <- "[Rank 4] Rules and Regulations"
data[, 84] <- factor(data[, 84], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[84] <- "q_209_4"

data[, 85] <- as.numeric(data[, 85])
attributes(data)$variable.labels[85] <- "[Rank 5] Rules and Regulations"
data[, 85] <- factor(data[, 85], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[85] <- "q_209_5"

data[, 86] <- as.numeric(data[, 86])
attributes(data)$variable.labels[86] <- "[Rank 6] Rules and Regulations"
data[, 86] <- factor(data[, 86], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[86] <- "q_209_6"

data[, 87] <- as.numeric(data[, 87])
attributes(data)$variable.labels[87] <- "[Rank 7] Rules and Regulations"
data[, 87] <- factor(data[, 87], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[87] <- "q_209_7"

data[, 88] <- as.numeric(data[, 88])
attributes(data)$variable.labels[88] <- "[Rank 8] Rules and Regulations"
data[, 88] <- factor(data[, 88], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Local legal regulations", "Patent regulations", "IPR - Intellectual Property Rights", "Common EU regulations", "Quality, safety and security regulations", "Waste regulations", "Bio-based products legal framework", "Digital Compliance"))
names(data)[88] <- "q_209_8"

data[, 89] <- as.numeric(data[, 89])
attributes(data)$variable.labels[89] <- "[Rank 1] Social Responsibility - CSR"
data[, 89] <- factor(data[, 89], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[89] <- "q_210_1"

data[, 90] <- as.numeric(data[, 90])
attributes(data)$variable.labels[90] <- "[Rank 2] Social Responsibility - CSR"
data[, 90] <- factor(data[, 90], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[90] <- "q_210_2"

data[, 91] <- as.numeric(data[, 91])
attributes(data)$variable.labels[91] <- "[Rank 3] Social Responsibility - CSR"
data[, 91] <- factor(data[, 91], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[91] <- "q_210_3"

data[, 92] <- as.numeric(data[, 92])
attributes(data)$variable.labels[92] <- "[Rank 4] Social Responsibility - CSR"
data[, 92] <- factor(data[, 92], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[92] <- "q_210_4"

data[, 93] <- as.numeric(data[, 93])
attributes(data)$variable.labels[93] <- "[Rank 5] Social Responsibility - CSR"
data[, 93] <- factor(data[, 93], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[93] <- "q_210_5"

data[, 94] <- as.numeric(data[, 94])
attributes(data)$variable.labels[94] <- "[Rank 6] Social Responsibility - CSR"
data[, 94] <- factor(data[, 94], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[94] <- "q_210_6"

data[, 95] <- as.numeric(data[, 95])
attributes(data)$variable.labels[95] <- "[Rank 7] Social Responsibility - CSR"
data[, 95] <- factor(data[, 95], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[95] <- "q_210_7"

data[, 96] <- as.numeric(data[, 96])
attributes(data)$variable.labels[96] <- "[Rank 8] Social Responsibility - CSR"
data[, 96] <- factor(data[, 96], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Economic responsibilities", "Legal responsibilities", "Ethical responsibilities", "Philanthropic responsibilities", "Environmental responsibility", "Green engineering awareness", "Health Responsibilities", "Self-consumption energies"))
names(data)[96] <- "q_210_8"

data[, 97] <- as.numeric(data[, 97])
attributes(data)$variable.labels[97] <- "[Rank 1] Sales and Marketing"
data[, 97] <- factor(data[, 97], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Market globalization", "Adapting the products to new targets", "Openness of the industrial processes and products", "Marketing online and Social Media", "Increasing consumer/society  awareness on bio-based products", "Packaging solutions derived from bio-based materials"))
names(data)[97] <- "q_211_1"

data[, 98] <- as.numeric(data[, 98])
attributes(data)$variable.labels[98] <- "[Rank 2] Sales and Marketing"
data[, 98] <- factor(data[, 98], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Market globalization", "Adapting the products to new targets", "Openness of the industrial processes and products", "Marketing online and Social Media", "Increasing consumer/society  awareness on bio-based products", "Packaging solutions derived from bio-based materials"))
names(data)[98] <- "q_211_2"

data[, 99] <- as.numeric(data[, 99])
attributes(data)$variable.labels[99] <- "[Rank 3] Sales and Marketing"
data[, 99] <- factor(data[, 99], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Market globalization", "Adapting the products to new targets", "Openness of the industrial processes and products", "Marketing online and Social Media", "Increasing consumer/society  awareness on bio-based products", "Packaging solutions derived from bio-based materials"))
names(data)[99] <- "q_211_3"

data[, 100] <- as.numeric(data[, 100])
attributes(data)$variable.labels[100] <- "[Rank 4] Sales and Marketing"
data[, 100] <- factor(data[, 100], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Market globalization", "Adapting the products to new targets", "Openness of the industrial processes and products", "Marketing online and Social Media", "Increasing consumer/society  awareness on bio-based products", "Packaging solutions derived from bio-based materials"))
names(data)[100] <- "q_211_4"

data[, 101] <- as.numeric(data[, 101])
attributes(data)$variable.labels[101] <- "[Rank 5] Sales and Marketing"
data[, 101] <- factor(data[, 101], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Market globalization", "Adapting the products to new targets", "Openness of the industrial processes and products", "Marketing online and Social Media", "Increasing consumer/society  awareness on bio-based products", "Packaging solutions derived from bio-based materials"))
names(data)[101] <- "q_211_5"

data[, 102] <- as.numeric(data[, 102])
attributes(data)$variable.labels[102] <- "[Rank 6] Sales and Marketing"
data[, 102] <- factor(data[, 102], levels=c( 1, 2, 3, 4, 5, 6), labels=c( "Market globalization", "Adapting the products to new targets", "Openness of the industrial processes and products", "Marketing online and Social Media", "Increasing consumer/society  awareness on bio-based products", "Packaging solutions derived from bio-based materials"))
names(data)[102] <- "q_211_6"

data[, 103] <- as.numeric(data[, 103])
attributes(data)$variable.labels[103] <- "[Rank 1] Specialists in bio-based sector business/market development"
data[, 103] <- factor(data[, 103], levels=c( 1, 2, 3, 4, 5), labels=c( "Bio-based-market knowledge & tecno-economic expertise", "To raise society's awareness on circular bio-based economy", "Identify and create market applications for new bio-based products", "New Blue-Bio-based Business models and Value chains", "New Bio-based Business Models based on technological surveillance, competitive intelligence and funding attraction"))
names(data)[103] <- "q_301_1"

data[, 104] <- as.numeric(data[, 104])
attributes(data)$variable.labels[104] <- "[Rank 2] Specialists in bio-based sector business/market development"
data[, 104] <- factor(data[, 104], levels=c( 1, 2, 3, 4, 5), labels=c( "Bio-based-market knowledge & tecno-economic expertise", "To raise society's awareness on circular bio-based economy", "Identify and create market applications for new bio-based products", "New Blue-Bio-based Business models and Value chains", "New Bio-based Business Models based on technological surveillance, competitive intelligence and funding attraction"))
names(data)[104] <- "q_301_2"

data[, 105] <- as.numeric(data[, 105])
attributes(data)$variable.labels[105] <- "[Rank 3] Specialists in bio-based sector business/market development"
data[, 105] <- factor(data[, 105], levels=c( 1, 2, 3, 4, 5), labels=c( "Bio-based-market knowledge & tecno-economic expertise", "To raise society's awareness on circular bio-based economy", "Identify and create market applications for new bio-based products", "New Blue-Bio-based Business models and Value chains", "New Bio-based Business Models based on technological surveillance, competitive intelligence and funding attraction"))
names(data)[105] <- "q_301_3"

data[, 106] <- as.numeric(data[, 106])
attributes(data)$variable.labels[106] <- "[Rank 4] Specialists in bio-based sector business/market development"
data[, 106] <- factor(data[, 106], levels=c( 1, 2, 3, 4, 5), labels=c( "Bio-based-market knowledge & tecno-economic expertise", "To raise society's awareness on circular bio-based economy", "Identify and create market applications for new bio-based products", "New Blue-Bio-based Business models and Value chains", "New Bio-based Business Models based on technological surveillance, competitive intelligence and funding attraction"))
names(data)[106] <- "q_301_4"

data[, 107] <- as.numeric(data[, 107])
attributes(data)$variable.labels[107] <- "[Rank 5] Specialists in bio-based sector business/market development"
data[, 107] <- factor(data[, 107], levels=c( 1, 2, 3, 4, 5), labels=c( "Bio-based-market knowledge & tecno-economic expertise", "To raise society's awareness on circular bio-based economy", "Identify and create market applications for new bio-based products", "New Blue-Bio-based Business models and Value chains", "New Bio-based Business Models based on technological surveillance, competitive intelligence and funding attraction"))
names(data)[107] <- "q_301_5"

data[, 108] <- as.numeric(data[, 108])
attributes(data)$variable.labels[108] <- "[Rank 1] Technical expertise in sustainable biomass production"
data[, 108] <- factor(data[, 108], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[108] <- "q_302_1"

data[, 109] <- as.numeric(data[, 109])
attributes(data)$variable.labels[109] <- "[Rank 2] Technical expertise in sustainable biomass production"
data[, 109] <- factor(data[, 109], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[109] <- "q_302_2"

data[, 110] <- as.numeric(data[, 110])
attributes(data)$variable.labels[110] <- "[Rank 3] Technical expertise in sustainable biomass production"
data[, 110] <- factor(data[, 110], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[110] <- "q_302_3"

data[, 111] <- as.numeric(data[, 111])
attributes(data)$variable.labels[111] <- "[Rank 4] Technical expertise in sustainable biomass production"
data[, 111] <- factor(data[, 111], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[111] <- "q_302_4"

data[, 112] <- as.numeric(data[, 112])
attributes(data)$variable.labels[112] <- "[Rank 5] Technical expertise in sustainable biomass production"
data[, 112] <- factor(data[, 112], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[112] <- "q_302_5"

data[, 113] <- as.numeric(data[, 113])
attributes(data)$variable.labels[113] <- "[Rank 6] Technical expertise in sustainable biomass production"
data[, 113] <- factor(data[, 113], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[113] <- "q_302_6"

data[, 114] <- as.numeric(data[, 114])
attributes(data)$variable.labels[114] <- "[Rank 7] Technical expertise in sustainable biomass production"
data[, 114] <- factor(data[, 114], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[114] <- "q_302_7"

data[, 115] <- as.numeric(data[, 115])
attributes(data)$variable.labels[115] <- "[Rank 8] Technical expertise in sustainable biomass production"
data[, 115] <- factor(data[, 115], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Advanced pre-treatments at harvest-storage stage", "Precision farming", "Feedstock-specific & market driven cascade valorization", "Precision equipment for biomass harvest/collection", "Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)", "Techno-economic assessment of processes, biorefineries and bio-based value chains", "Life Cycle assessment of processes, biorefineries and bio-based value chains", "New varieties of macro- micro- organisms for cost-effective bio-products"))
names(data)[115] <- "q_302_8"

data[, 116] <- as.numeric(data[, 116])
attributes(data)$variable.labels[116] <- "[Rank 1] Technical expertise in primary conversion processes"
data[, 116] <- factor(data[, 116], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[116] <- "q_303_1"

data[, 117] <- as.numeric(data[, 117])
attributes(data)$variable.labels[117] <- "[Rank 2] Technical expertise in primary conversion processes"
data[, 117] <- factor(data[, 117], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[117] <- "q_303_2"

data[, 118] <- as.numeric(data[, 118])
attributes(data)$variable.labels[118] <- "[Rank 3] Technical expertise in primary conversion processes"
data[, 118] <- factor(data[, 118], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[118] <- "q_303_3"

data[, 119] <- as.numeric(data[, 119])
attributes(data)$variable.labels[119] <- "[Rank 4] Technical expertise in primary conversion processes"
data[, 119] <- factor(data[, 119], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[119] <- "q_303_4"

data[, 120] <- as.numeric(data[, 120])
attributes(data)$variable.labels[120] <- "[Rank 5] Technical expertise in primary conversion processes"
data[, 120] <- factor(data[, 120], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[120] <- "q_303_5"

data[, 121] <- as.numeric(data[, 121])
attributes(data)$variable.labels[121] <- "[Rank 6] Technical expertise in primary conversion processes"
data[, 121] <- factor(data[, 121], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[121] <- "q_303_6"

data[, 122] <- as.numeric(data[, 122])
attributes(data)$variable.labels[122] <- "[Rank 7] Technical expertise in primary conversion processes"
data[, 122] <- factor(data[, 122], levels=c( 1, 2, 3, 4, 5, 6, 7), labels=c( "Methods for efficient and cost-effective biomass’ production", "Advanced technologies to mildly extract or separate functional components", "Market flexible and feedstock adaptable multiproduct integrated biorefineries", "New processes to improve bioproducts yield from biowaste", "Implementation of cascade biomass valorization approach in integrated biorefineries", "New Industrial symbiosis designs and implementation in integrated biorefineries", "Biotechnologies to convert C02 effluents to biochemicals"))
names(data)[122] <- "q_303_7"

data[, 123] <- as.numeric(data[, 123])
attributes(data)$variable.labels[123] <- "[Rank 1] Technical expertise in secondary conversion processes"
data[, 123] <- factor(data[, 123], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[123] <- "q_304_1"

data[, 124] <- as.numeric(data[, 124])
attributes(data)$variable.labels[124] <- "[Rank 2] Technical expertise in secondary conversion processes"
data[, 124] <- factor(data[, 124], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[124] <- "q_304_2"

data[, 125] <- as.numeric(data[, 125])
attributes(data)$variable.labels[125] <- "[Rank 3] Technical expertise in secondary conversion processes"
data[, 125] <- factor(data[, 125], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[125] <- "q_304_3"

data[, 126] <- as.numeric(data[, 126])
attributes(data)$variable.labels[126] <- "[Rank 4] Technical expertise in secondary conversion processes"
data[, 126] <- factor(data[, 126], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[126] <- "q_304_4"

data[, 127] <- as.numeric(data[, 127])
attributes(data)$variable.labels[127] <- "[Rank 5] Technical expertise in secondary conversion processes"
data[, 127] <- factor(data[, 127], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[127] <- "q_304_5"

data[, 128] <- as.numeric(data[, 128])
attributes(data)$variable.labels[128] <- "[Rank 6] Technical expertise in secondary conversion processes"
data[, 128] <- factor(data[, 128], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[128] <- "q_304_6"

data[, 129] <- as.numeric(data[, 129])
attributes(data)$variable.labels[129] <- "[Rank 7] Technical expertise in secondary conversion processes"
data[, 129] <- factor(data[, 129], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[129] <- "q_304_7"

data[, 130] <- as.numeric(data[, 130])
attributes(data)$variable.labels[130] <- "[Rank 8] Technical expertise in secondary conversion processes"
data[, 130] <- factor(data[, 130], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products", "Hybridization of processes for different feedstock valorization", "New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy ap", "Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring", "Advanced methods to preserve and generate functional natural macromolecular polymers’", "Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, ", "Polymerisation processes based on new bio-based monomers", "Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology"))
names(data)[130] <- "q_304_8"

data[, 131] <- as.numeric(data[, 131])
attributes(data)$variable.labels[131] <- "[Rank 1] Technical expertise in materials, products and functionalization"
data[, 131] <- factor(data[, 131], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[131] <- "q_305_1"

data[, 132] <- as.numeric(data[, 132])
attributes(data)$variable.labels[132] <- "[Rank 2] Technical expertise in materials, products and functionalization"
data[, 132] <- factor(data[, 132], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[132] <- "q_305_2"

data[, 133] <- as.numeric(data[, 133])
attributes(data)$variable.labels[133] <- "[Rank 3] Technical expertise in materials, products and functionalization"
data[, 133] <- factor(data[, 133], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[133] <- "q_305_3"

data[, 134] <- as.numeric(data[, 134])
attributes(data)$variable.labels[134] <- "[Rank 4] Technical expertise in materials, products and functionalization"
data[, 134] <- factor(data[, 134], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[134] <- "q_305_4"

data[, 135] <- as.numeric(data[, 135])
attributes(data)$variable.labels[135] <- "[Rank 5] Technical expertise in materials, products and functionalization"
data[, 135] <- factor(data[, 135], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[135] <- "q_305_5"

data[, 136] <- as.numeric(data[, 136])
attributes(data)$variable.labels[136] <- "[Rank 6] Technical expertise in materials, products and functionalization"
data[, 136] <- factor(data[, 136], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[136] <- "q_305_6"

data[, 137] <- as.numeric(data[, 137])
attributes(data)$variable.labels[137] <- "[Rank 7] Technical expertise in materials, products and functionalization"
data[, 137] <- factor(data[, 137], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[137] <- "q_305_7"

data[, 138] <- as.numeric(data[, 138])
attributes(data)$variable.labels[138] <- "[Rank 8] Technical expertise in materials, products and functionalization"
data[, 138] <- factor(data[, 138], levels=c( 1, 2, 3, 4, 5, 6, 7, 8), labels=c( "Materials based on lignin (and bio-aromatic) chemistry", "Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents", "Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.", "Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutica", "New (chemical) building blocks from renewable resources.", "New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or car", "New packaging solutions derived from bio-based materials", "New products design from bio-waste."))
names(data)[138] <- "q_305_8"

data[, 139] <- as.numeric(data[, 139])
attributes(data)$variable.labels[139] <- "[Purchasing] ?Management"
data[, 139] <- factor(data[, 139], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[139] <- "q_401_1"

data[, 140] <- as.numeric(data[, 140])
attributes(data)$variable.labels[140] <- "[Quality] ?Management"
data[, 140] <- factor(data[, 140], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[140] <- "q_401_2"

data[, 141] <- as.numeric(data[, 141])
attributes(data)$variable.labels[141] <- "[Product / Logistics] ?Management"
data[, 141] <- factor(data[, 141], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[141] <- "q_401_3"

data[, 142] <- as.numeric(data[, 142])
attributes(data)$variable.labels[142] <- "[Resources] ?Management"
data[, 142] <- factor(data[, 142], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[142] <- "q_401_4"

data[, 143] <- as.numeric(data[, 143])
attributes(data)$variable.labels[143] <- "[Industrial linkers] ?Management"
data[, 143] <- factor(data[, 143], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[143] <- "q_401_5"

data[, 144] <- as.numeric(data[, 144])
attributes(data)$variable.labels[144] <- "[Development of business models] ?Management"
data[, 144] <- factor(data[, 144], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[144] <- "q_401_6"

data[, 145] <- as.numeric(data[, 145])
attributes(data)$variable.labels[145] <- "[Life Cycle Assesment (LCA) of Bio-based industry processes] ?Management"
data[, 145] <- factor(data[, 145], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[145] <- "q_401_7"

data[, 146] <- as.numeric(data[, 146])
attributes(data)$variable.labels[146] <- "[Project Management] ?Management"
data[, 146] <- factor(data[, 146], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[146] <- "q_401_8"

data[, 147] <- as.numeric(data[, 147])
attributes(data)$variable.labels[147] <- "[Data sensing technologies] ?Data Management"
data[, 147] <- factor(data[, 147], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[147] <- "q_402_1"

data[, 148] <- as.numeric(data[, 148])
attributes(data)$variable.labels[148] <- "[Data processing (carry out, retrieve, transform)] ?Data Management"
data[, 148] <- factor(data[, 148], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[148] <- "q_402_2"

data[, 149] <- as.numeric(data[, 149])
attributes(data)$variable.labels[149] <- "[Data transmission technologies & standards] ?Data Management"
data[, 149] <- factor(data[, 149], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[149] <- "q_402_3"

data[, 150] <- as.numeric(data[, 150])
attributes(data)$variable.labels[150] <- "[Data Analytics & Advanced Analytics] ?Data Management"
data[, 150] <- factor(data[, 150], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[150] <- "q_402_4"

data[, 151] <- as.numeric(data[, 151])
attributes(data)$variable.labels[151] <- "[Data Exploitation Technologies] ?Data Management"
data[, 151] <- factor(data[, 151], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[151] <- "q_402_5"

data[, 152] <- as.numeric(data[, 152])
attributes(data)$variable.labels[152] <- "[Information security and cybersecurity] ?Data Management"
data[, 152] <- factor(data[, 152], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[152] <- "q_402_6"

data[, 153] <- as.numeric(data[, 153])
attributes(data)$variable.labels[153] <- "[Critical thinking] Personal initiative and entrepreneurship"
data[, 153] <- factor(data[, 153], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[153] <- "q_403_1"

data[, 154] <- as.numeric(data[, 154])
attributes(data)$variable.labels[154] <- "[Problem solving] Personal initiative and entrepreneurship"
data[, 154] <- factor(data[, 154], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[154] <- "q_403_2"

data[, 155] <- as.numeric(data[, 155])
attributes(data)$variable.labels[155] <- "[Engagement capacity to involve different types of Stakeholders (clustering)] Personal initiative and entrepreneurship"
data[, 155] <- factor(data[, 155], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[155] <- "q_403_3"

data[, 156] <- as.numeric(data[, 156])
attributes(data)$variable.labels[156] <- "[Creativity] Personal initiative and entrepreneurship"
data[, 156] <- factor(data[, 156], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[156] <- "q_403_4"

data[, 157] <- as.numeric(data[, 157])
attributes(data)$variable.labels[157] <- "[Empathy] Personal initiative and entrepreneurship"
data[, 157] <- factor(data[, 157], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[157] <- "q_403_5"

data[, 158] <- as.numeric(data[, 158])
attributes(data)$variable.labels[158] <- "[Persuasion] Personal initiative and entrepreneurship"
data[, 158] <- factor(data[, 158], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[158] <- "q_403_6"

data[, 159] <- as.numeric(data[, 159])
attributes(data)$variable.labels[159] <- "[Proactivity] Personal initiative and entrepreneurship"
data[, 159] <- factor(data[, 159], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[159] <- "q_403_7"

data[, 160] <- as.numeric(data[, 160])
attributes(data)$variable.labels[160] <- "[Communication (public speaking) ] Soft Skills"
data[, 160] <- factor(data[, 160], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[160] <- "q_404_1"

data[, 161] <- as.numeric(data[, 161])
attributes(data)$variable.labels[161] <- "[Communication (writing)] Soft Skills"
data[, 161] <- factor(data[, 161], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[161] <- "q_404_2"

data[, 162] <- as.numeric(data[, 162])
attributes(data)$variable.labels[162] <- "[Relationship building] Soft Skills"
data[, 162] <- factor(data[, 162], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[162] <- "q_404_3"

data[, 163] <- as.numeric(data[, 163])
attributes(data)$variable.labels[163] <- "[Teamwork and conflict resolution] Soft Skills"
data[, 163] <- factor(data[, 163], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[163] <- "q_404_4"

data[, 164] <- as.numeric(data[, 164])
attributes(data)$variable.labels[164] <- "[Adaptability] Soft Skills"
data[, 164] <- factor(data[, 164], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[164] <- "q_404_5"

data[, 165] <- as.numeric(data[, 165])
attributes(data)$variable.labels[165] <- "[Personal branding] Soft Skills"
data[, 165] <- factor(data[, 165], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[165] <- "q_404_6"

data[, 166] <- as.numeric(data[, 166])
attributes(data)$variable.labels[166] <- "[Collaboration] Soft Skills"
data[, 166] <- factor(data[, 166], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[166] <- "q_404_7"

data[, 167] <- as.numeric(data[, 167])
attributes(data)$variable.labels[167] <- "[Foreign Languages Competence] Soft Skills"
data[, 167] <- factor(data[, 167], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[167] <- "q_404_8"

data[, 168] <- as.numeric(data[, 168])
attributes(data)$variable.labels[168] <- "[Ecological perspective] Sustainability and Industry"
data[, 168] <- factor(data[, 168], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[168] <- "q_405_1"

data[, 169] <- as.numeric(data[, 169])
attributes(data)$variable.labels[169] <- "[Circular economy / Zero waste industry] Sustainability and Industry"
data[, 169] <- factor(data[, 169], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[169] <- "q_405_2"

data[, 170] <- as.numeric(data[, 170])
attributes(data)$variable.labels[170] <- "[Sustainable competitiveness / Economy] Sustainability and Industry"
data[, 170] <- factor(data[, 170], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[170] <- "q_405_3"

data[, 171] <- as.numeric(data[, 171])
attributes(data)$variable.labels[171] <- "[Secure bio-based materials and residues stability, availability, transport and storage] Sustainability and Industry"
data[, 171] <- factor(data[, 171], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[171] <- "q_405_4"

data[, 172] <- as.numeric(data[, 172])
attributes(data)$variable.labels[172] <- "[Monitoring contaminants in the products] Sustainability and Industry"
data[, 172] <- factor(data[, 172], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[172] <- "q_405_5"

data[, 173] <- as.numeric(data[, 173])
attributes(data)$variable.labels[173] <- "[Recyclability concepts for bio-based materials] Sustainability and Industry"
data[, 173] <- factor(data[, 173], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[173] <- "q_405_6"

data[, 174] <- as.numeric(data[, 174])
attributes(data)$variable.labels[174] <- "[Digital skills] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 174] <- factor(data[, 174], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[174] <- "q_406_1"

data[, 175] <- as.numeric(data[, 175])
attributes(data)$variable.labels[175] <- "[Information and Communication Technology] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 175] <- factor(data[, 175], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[175] <- "q_406_2"

data[, 176] <- as.numeric(data[, 176])
attributes(data)$variable.labels[176] <- "[Cybersecurity] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 176] <- factor(data[, 176], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[176] <- "q_406_3"

data[, 177] <- as.numeric(data[, 177])
attributes(data)$variable.labels[177] <- "[Data mining tools/strategies] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 177] <- factor(data[, 177], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[177] <- "q_406_4"

data[, 178] <- as.numeric(data[, 178])
attributes(data)$variable.labels[178] <- "[Key Enabling Technologies for the Bio-Based Industry] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 178] <- factor(data[, 178], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[178] <- "q_406_5"

data[, 179] <- as.numeric(data[, 179])
attributes(data)$variable.labels[179] <- "[Traceability and logistics] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 179] <- factor(data[, 179], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[179] <- "q_406_6"

data[, 180] <- as.numeric(data[, 180])
attributes(data)$variable.labels[180] <- "[DLT (Distributed ledger technology) & Blockchain technologies] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 180] <- factor(data[, 180], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[180] <- "q_406_7"

data[, 181] <- as.numeric(data[, 181])
attributes(data)$variable.labels[181] <- "[Artificial Intelligence technologies] Technology / STEM (Science, Technology, Engineering and Maths)"
data[, 181] <- factor(data[, 181], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[181] <- "q_406_8"

data[, 182] <- as.numeric(data[, 182])
attributes(data)$variable.labels[182] <- "[Innovation and change] Research & Innovation"
data[, 182] <- factor(data[, 182], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[182] <- "q_407_1"

data[, 183] <- as.numeric(data[, 183])
attributes(data)$variable.labels[183] <- "[Management and development of research] Research & Innovation"
data[, 183] <- factor(data[, 183], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[183] <- "q_407_2"

data[, 184] <- as.numeric(data[, 184])
attributes(data)$variable.labels[184] <- "[Knowledge Transfer: From LAB to Industry] Research & Innovation"
data[, 184] <- factor(data[, 184], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[184] <- "q_407_3"

data[, 185] <- as.numeric(data[, 185])
attributes(data)$variable.labels[185] <- "[Fundamental research ] Research & Innovation"
data[, 185] <- factor(data[, 185], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[185] <- "q_407_4"

data[, 186] <- as.numeric(data[, 186])
attributes(data)$variable.labels[186] <- "[Analytical capacity] Research & Innovation"
data[, 186] <- factor(data[, 186], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[186] <- "q_407_5"

data[, 187] <- as.numeric(data[, 187])
attributes(data)$variable.labels[187] <- "[Maths] Basic Scientific Knowledge"
data[, 187] <- factor(data[, 187], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[187] <- "q_408_1"

data[, 188] <- as.numeric(data[, 188])
attributes(data)$variable.labels[188] <- "[Information and Communication Technologies.] Basic Scientific Knowledge"
data[, 188] <- factor(data[, 188], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[188] <- "q_408_2"

data[, 189] <- as.numeric(data[, 189])
attributes(data)$variable.labels[189] <- "[Physics] Basic Scientific Knowledge"
data[, 189] <- factor(data[, 189], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[189] <- "q_408_3"

data[, 190] <- as.numeric(data[, 190])
attributes(data)$variable.labels[190] <- "[Chemistry] Basic Scientific Knowledge"
data[, 190] <- factor(data[, 190], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[190] <- "q_408_4"

data[, 191] <- as.numeric(data[, 191])
attributes(data)$variable.labels[191] <- "[Biotechnology] Basic Scientific Knowledge"
data[, 191] <- factor(data[, 191], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[191] <- "q_408_5"

data[, 192] <- as.numeric(data[, 192])
attributes(data)$variable.labels[192] <- "[Biology] Basic Scientific Knowledge"
data[, 192] <- factor(data[, 192], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[192] <- "q_408_6"

data[, 193] <- as.numeric(data[, 193])
attributes(data)$variable.labels[193] <- "[Chemical Engineering] Basic Scientific Knowledge"
data[, 193] <- factor(data[, 193], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[193] <- "q_408_7"

data[, 194] <- as.numeric(data[, 194])
attributes(data)$variable.labels[194] <- "[Nanotechnology] Basic Scientific Knowledge"
data[, 194] <- factor(data[, 194], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[194] <- "q_408_8"

data[, 195] <- as.numeric(data[, 195])
attributes(data)$variable.labels[195] <- "[Local legal regulations] Rules and Regulations"
data[, 195] <- factor(data[, 195], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[195] <- "q_409_1"

data[, 196] <- as.numeric(data[, 196])
attributes(data)$variable.labels[196] <- "[Patent regulations] Rules and Regulations"
data[, 196] <- factor(data[, 196], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[196] <- "q_409_2"

data[, 197] <- as.numeric(data[, 197])
attributes(data)$variable.labels[197] <- "[IPR - Intellectual Property Rights] Rules and Regulations"
data[, 197] <- factor(data[, 197], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[197] <- "q_409_3"

data[, 198] <- as.numeric(data[, 198])
attributes(data)$variable.labels[198] <- "[Common EU regulations] Rules and Regulations"
data[, 198] <- factor(data[, 198], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[198] <- "q_409_4"

data[, 199] <- as.numeric(data[, 199])
attributes(data)$variable.labels[199] <- "[Quality, safety and security regulations] Rules and Regulations"
data[, 199] <- factor(data[, 199], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[199] <- "q_409_5"

data[, 200] <- as.numeric(data[, 200])
attributes(data)$variable.labels[200] <- "[Waste regulations] Rules and Regulations"
data[, 200] <- factor(data[, 200], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[200] <- "q_409_6"

data[, 201] <- as.numeric(data[, 201])
attributes(data)$variable.labels[201] <- "[Bio-based products legal framework] Rules and Regulations"
data[, 201] <- factor(data[, 201], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[201] <- "q_409_7"

data[, 202] <- as.numeric(data[, 202])
attributes(data)$variable.labels[202] <- "[Digital Compliance] Rules and Regulations"
data[, 202] <- factor(data[, 202], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[202] <- "q_409_8"

data[, 203] <- as.numeric(data[, 203])
attributes(data)$variable.labels[203] <- "[Economic responsibilities] Social Responsibility - CSR"
data[, 203] <- factor(data[, 203], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[203] <- "q_410_1"

data[, 204] <- as.numeric(data[, 204])
attributes(data)$variable.labels[204] <- "[Legal responsibilities] Social Responsibility - CSR"
data[, 204] <- factor(data[, 204], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[204] <- "q_410_2"

data[, 205] <- as.numeric(data[, 205])
attributes(data)$variable.labels[205] <- "[Ethical responsibilities] Social Responsibility - CSR"
data[, 205] <- factor(data[, 205], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[205] <- "q_410_3"

data[, 206] <- as.numeric(data[, 206])
attributes(data)$variable.labels[206] <- "[Philanthropic responsibilities] Social Responsibility - CSR"
data[, 206] <- factor(data[, 206], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[206] <- "q_410_4"

data[, 207] <- as.numeric(data[, 207])
attributes(data)$variable.labels[207] <- "[Environmental responsibility] Social Responsibility - CSR"
data[, 207] <- factor(data[, 207], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[207] <- "q_410_5"

data[, 208] <- as.numeric(data[, 208])
attributes(data)$variable.labels[208] <- "[Green engineering awareness] Social Responsibility - CSR"
data[, 208] <- factor(data[, 208], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[208] <- "q_410_6"

data[, 209] <- as.numeric(data[, 209])
attributes(data)$variable.labels[209] <- "[Health Responsibilities] Social Responsibility - CSR"
data[, 209] <- factor(data[, 209], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[209] <- "q_410_7"

data[, 210] <- as.numeric(data[, 210])
attributes(data)$variable.labels[210] <- "[Self-consumption energies] Social Responsibility - CSR"
data[, 210] <- factor(data[, 210], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[210] <- "q_410_8"

data[, 211] <- as.numeric(data[, 211])
attributes(data)$variable.labels[211] <- "[Market globalization] Sales and Marketing"
data[, 211] <- factor(data[, 211], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[211] <- "q_411_1"

data[, 212] <- as.numeric(data[, 212])
attributes(data)$variable.labels[212] <- "[Adapting the products to new targets] Sales and Marketing"
data[, 212] <- factor(data[, 212], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[212] <- "q_411_2"

data[, 213] <- as.numeric(data[, 213])
attributes(data)$variable.labels[213] <- "[Openness of the industrial processes and products] Sales and Marketing"
data[, 213] <- factor(data[, 213], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[213] <- "q_411_3"

data[, 214] <- as.numeric(data[, 214])
attributes(data)$variable.labels[214] <- "[Marketing online and Social Media] Sales and Marketing"
data[, 214] <- factor(data[, 214], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[214] <- "q_411_4"

data[, 215] <- as.numeric(data[, 215])
attributes(data)$variable.labels[215] <- "[Increasing consumer/society  awareness on bio-based products] Sales and Marketing"
data[, 215] <- factor(data[, 215], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[215] <- "q_411_5"

data[, 216] <- as.numeric(data[, 216])
attributes(data)$variable.labels[216] <- "[Packaging solutions derived from bio-based materials] Sales and Marketing"
data[, 216] <- factor(data[, 216], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[216] <- "q_411_6"

data[, 217] <- as.numeric(data[, 217])
attributes(data)$variable.labels[217] <- "[Bio-based-market knowledge & tecno-economical expertise] Specialists in bio-based sector business/market development"
data[, 217] <- factor(data[, 217], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[217] <- "q_501_1"

data[, 218] <- as.numeric(data[, 218])
attributes(data)$variable.labels[218] <- "[To raise society\'s awareness on circular bio-based economy] Specialists in bio-based sector business/market development"
data[, 218] <- factor(data[, 218], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[218] <- "q_501_2"

data[, 219] <- as.numeric(data[, 219])
attributes(data)$variable.labels[219] <- "[Identify and create market applications for new bio-based products] Specialists in bio-based sector business/market development"
data[, 219] <- factor(data[, 219], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[219] <- "q_501_3"

data[, 220] <- as.numeric(data[, 220])
attributes(data)$variable.labels[220] <- "[New Blue-Bio-based Business models and Value chains] Specialists in bio-based sector business/market development"
data[, 220] <- factor(data[, 220], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[220] <- "q_501_4"

data[, 221] <- as.numeric(data[, 221])
attributes(data)$variable.labels[221] <- "[New Bio-based Business Models based on technological surveillance, competitive intelligence and financing capture] Specialists in bio-based sector business/market development"
data[, 221] <- factor(data[, 221], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[221] <- "q_501_5"

data[, 222] <- as.numeric(data[, 222])
attributes(data)$variable.labels[222] <- "[Advanced pre-treatments at harvest-storage stage ] Technical expertise in sustainable biomass production"
data[, 222] <- factor(data[, 222], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[222] <- "q_502_1"

data[, 223] <- as.numeric(data[, 223])
attributes(data)$variable.labels[223] <- "[Precision farming] Technical expertise in sustainable biomass production"
data[, 223] <- factor(data[, 223], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[223] <- "q_502_2"

data[, 224] <- as.numeric(data[, 224])
attributes(data)$variable.labels[224] <- "[Feedstock-specific & market driven cascade valorization ] Technical expertise in sustainable biomass production"
data[, 224] <- factor(data[, 224], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[224] <- "q_502_3"

data[, 225] <- as.numeric(data[, 225])
attributes(data)$variable.labels[225] <- "[Precision equipment for biomass harvest/collection ] Technical expertise in sustainable biomass production"
data[, 225] <- factor(data[, 225], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[225] <- "q_502_4"

data[, 226] <- as.numeric(data[, 226])
attributes(data)$variable.labels[226] <- "[Advance ICT applications to logistic/storage (IoT, industry 4.0 ...)] Technical expertise in sustainable biomass production"
data[, 226] <- factor(data[, 226], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[226] <- "q_502_5"

data[, 227] <- as.numeric(data[, 227])
attributes(data)$variable.labels[227] <- "[Techno-economic assessment of processes, biorefineries and bio-based value chains] Technical expertise in sustainable biomass production"
data[, 227] <- factor(data[, 227], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[227] <- "q_502_6"

data[, 228] <- as.numeric(data[, 228])
attributes(data)$variable.labels[228] <- "[Life Cycle assessment of processes, biorefineries and bio-based value chains] Technical expertise in sustainable biomass production"
data[, 228] <- factor(data[, 228], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[228] <- "q_502_7"

data[, 229] <- as.numeric(data[, 229])
attributes(data)$variable.labels[229] <- "[New varieties of macro- micro- organisms for cost-effective bio-products] Technical expertise in sustainable biomass production"
data[, 229] <- factor(data[, 229], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[229] <- "q_502_8"

data[, 230] <- as.numeric(data[, 230])
attributes(data)$variable.labels[230] <- "[Methods for efficient and cost-effective biomass? production] Technical expertise in primary conversion processes"
data[, 230] <- factor(data[, 230], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[230] <- "q_503_1"

data[, 231] <- as.numeric(data[, 231])
attributes(data)$variable.labels[231] <- "[Advanced technologies to mildly extract or separate functional components] Technical expertise in primary conversion processes"
data[, 231] <- factor(data[, 231], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[231] <- "q_503_2"

data[, 232] <- as.numeric(data[, 232])
attributes(data)$variable.labels[232] <- "[Market flexible and feedstock adaptable multiproduct integrated biorefineries] Technical expertise in primary conversion processes"
data[, 232] <- factor(data[, 232], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[232] <- "q_503_3"

data[, 233] <- as.numeric(data[, 233])
attributes(data)$variable.labels[233] <- "[New processes to improve bioproducts yield from biowaste] Technical expertise in primary conversion processes"
data[, 233] <- factor(data[, 233], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[233] <- "q_503_4"

data[, 234] <- as.numeric(data[, 234])
attributes(data)$variable.labels[234] <- "[Implementation of cascade biomass valorization approach in integrated biorefineries] Technical expertise in primary conversion processes"
data[, 234] <- factor(data[, 234], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[234] <- "q_503_5"

data[, 235] <- as.numeric(data[, 235])
attributes(data)$variable.labels[235] <- "[New Industrial symbiosis designs and implementation in integrated biorefineries] Technical expertise in primary conversion processes"
data[, 235] <- factor(data[, 235], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[235] <- "q_503_6"

data[, 236] <- as.numeric(data[, 236])
attributes(data)$variable.labels[236] <- "[Biotechnologies to convert C02 effluents to biochemicals] Technical expertise in primary conversion processes"
data[, 236] <- factor(data[, 236], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[236] <- "q_503_7"

data[, 237] <- as.numeric(data[, 237])
attributes(data)$variable.labels[237] <- "[Chemo-catalysis & Thermo-chemical processes to obtain functionalised chemicals and products] Technical expertise in secondary conversion processes"
data[, 237] <- factor(data[, 237], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[237] <- "q_504_1"

data[, 238] <- as.numeric(data[, 238])
attributes(data)$variable.labels[238] <- "[Hybridization of processes for different feedstock valorization] Technical expertise in secondary conversion processes"
data[, 238] <- factor(data[, 238], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[238] <- "q_504_2"

data[, 239] <- as.numeric(data[, 239])
attributes(data)$variable.labels[239] <- "[New more efficient methods to recover/convert bio-based chemicals including cascade valorization and circular economy approaches] Technical expertise in secondary conversion processes"
data[, 239] <- factor(data[, 239], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[239] <- "q_504_3"

data[, 240] <- as.numeric(data[, 240])
attributes(data)$variable.labels[240] <- "[Design of control systems for robust, stable and sustainable production, quality and contaminants monitoring] Technical expertise in secondary conversion processes"
data[, 240] <- factor(data[, 240], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[240] <- "q_504_4"

data[, 241] <- as.numeric(data[, 241])
attributes(data)$variable.labels[241] <- "[Advanced methods to preserve and generate functional natural macromolecular polymers?] Technical expertise in secondary conversion processes"
data[, 241] <- factor(data[, 241], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[241] <- "q_504_5"

data[, 242] <- as.numeric(data[, 242])
attributes(data)$variable.labels[242] <- "[Biopolymer processing to obtain different materials (films, fibres, structural composites) for automotive, agriculture, building, etc...] Technical expertise in secondary conversion processes"
data[, 242] <- factor(data[, 242], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[242] <- "q_504_6"

data[, 243] <- as.numeric(data[, 243])
attributes(data)$variable.labels[243] <- "[Polymerisation processes based on new bio-based monomers] Technical expertise in secondary conversion processes"
data[, 243] <- factor(data[, 243], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[243] <- "q_504_7"

data[, 244] <- as.numeric(data[, 244])
attributes(data)$variable.labels[244] <- "[Oleochemistry (fatty acids conversion technologies) including chemistry and biotechnology] Technical expertise in secondary conversion processes"
data[, 244] <- factor(data[, 244], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[244] <- "q_504_8"

data[, 245] <- as.numeric(data[, 245])
attributes(data)$variable.labels[245] <- "[Materials based on lignin (and bio-aromatic) chemistry] Technical expertise in materials, products and functionalization"
data[, 245] <- factor(data[, 245], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[245] <- "q_505_1"

data[, 246] <- as.numeric(data[, 246])
attributes(data)$variable.labels[246] <- "[Materials based on oils and fats from plants and animals (bio-based lubricants, surfactants, solvents] Technical expertise in materials, products and functionalization"
data[, 246] <- factor(data[, 246], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[246] <- "q_505_2"

data[, 247] <- as.numeric(data[, 247])
attributes(data)$variable.labels[247] <- "[Bio-based alternatives for existing polymers and innovative polymers from new bio-based monomers.] Technical expertise in materials, products and functionalization"
data[, 247] <- factor(data[, 247], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[247] <- "q_505_3"

data[, 248] <- as.numeric(data[, 248])
attributes(data)$variable.labels[248] <- "[Extraction techniques to obtain High added-value biomolecules from marine, agri-food or forest biomass for pharmaceutical, nutraceutical and cosmetic sectors] Technical expertise in materials, products and functionalization"
data[, 248] <- factor(data[, 248], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[248] <- "q_505_4"

data[, 249] <- as.numeric(data[, 249])
attributes(data)$variable.labels[249] <- "[New (chemical) building blocks from renewable resources.] Technical expertise in materials, products and functionalization"
data[, 249] <- factor(data[, 249], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[249] <- "q_505_5"

data[, 250] <- as.numeric(data[, 250])
attributes(data)$variable.labels[250] <- "[New functional bio-based materials and products: plastics, composites, based on lignin, starch, (nano-) cellulose or carbon fibres.] Technical expertise in materials, products and functionalization"
data[, 250] <- factor(data[, 250], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[250] <- "q_505_6"

data[, 251] <- as.numeric(data[, 251])
attributes(data)$variable.labels[251] <- "[New packaging solutions derived from bio-based materials] Technical expertise in materials, products and functionalization"
data[, 251] <- factor(data[, 251], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[251] <- "q_505_7"

data[, 252] <- as.numeric(data[, 252])
attributes(data)$variable.labels[252] <- "[New products design from bio-waste.] Technical expertise in materials, products and functionalization"
data[, 252] <- factor(data[, 252], levels=c( 1, 2, 3, 4), labels=c( "Vocational Education and Training (VET)*", "Bachelor/engineer – (Undergraduate)", "Master", "PhD"))
names(data)[252] <- "q_505_8"

data[, 253] <- as.numeric(data[, 253])
attributes(data)$variable.labels[253] <- "?The first most important competence in my sector is..."
data[, 253] <- factor(data[, 253], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), labels=c( "Management", "Data Management", "Personal initiative and entrepreneurship", "Soft Skills", "Sustainability and Industry", "Technology / STEM (Science, Technology, Engineering and Maths)", "Research & Innovation", "Basic Scientific Knowledge", "Rules and Regulations", "Social Responsibility - CSR", "Sales and Marketing", "Specialists in bio-based sector business/market development", "Technical expertise in sustainable biomass production", "Technical expertise in primary conversion processes", "Technical expertise in secondary conversion processes", "Technical expertise in materials, products and functionalization"))
names(data)[253] <- "q_601"

data[, 254] <- as.numeric(data[, 254])
attributes(data)$variable.labels[254] <- "?The second most important competence in my sector is..."
data[, 254] <- factor(data[, 254], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), labels=c( "Management", "Data Management", "Personal initiative and entrepreneurship", "Soft Skills", "Sustainability and Industry", "Technology / STEM (Science, Technology, Engineering and Maths)", "Research & Innovation", "Basic Scientific Knowledge", "Rules and Regulations", "Social Responsibility - CSR", "Sales and Marketing", "Specialists in bio-based sector business/market development", "Technical expertise in sustainable biomass production", "Technical expertise in primary conversion processes", "Technical expertise in secondary conversion processes", "Technical expertise in materials, products and functionalization"))
names(data)[254] <- "q_602"

data[, 255] <- as.numeric(data[, 255])
attributes(data)$variable.labels[255] <- "?The third most important competence in my sector is..."
data[, 255] <- factor(data[, 255], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), labels=c( "Management", "Data Management", "Personal initiative and entrepreneurship", "Soft Skills", "Sustainability and Industry", "Technology / STEM (Science, Technology, Engineering and Maths)", "Research & Innovation", "Basic Scientific Knowledge", "Rules and Regulations", "Social Responsibility - CSR", "Sales and Marketing", "Specialists in bio-based sector business/market development", "Technical expertise in sustainable biomass production", "Technical expertise in primary conversion processes", "Technical expertise in secondary conversion processes", "Technical expertise in materials, products and functionalization"))
names(data)[255] <- "q_603"

data[, 256] <- as.numeric(data[, 256])
attributes(data)$variable.labels[256] <- "?The fourth most important competence in my sector is..."
data[, 256] <- factor(data[, 256], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), labels=c( "Management", "Data Management", "Personal initiative and entrepreneurship", "Soft Skills", "Sustainability and Industry", "Technology / STEM (Science, Technology, Engineering and Maths)", "Research & Innovation", "Basic Scientific Knowledge", "Rules and Regulations", "Social Responsibility - CSR", "Sales and Marketing", "Specialists in bio-based sector business/market development", "Technical expertise in sustainable biomass production", "Technical expertise in primary conversion processes", "Technical expertise in secondary conversion processes", "Technical expertise in materials, products and functionalization"))
names(data)[256] <- "q_604"

data[, 257] <- as.numeric(data[, 257])
attributes(data)$variable.labels[257] <- "?The fifth most important competence in my sector is..."
data[, 257] <- factor(data[, 257], levels=c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16), labels=c( "Management", "Data Management", "Personal initiative and entrepreneurship", "Soft Skills", "Sustainability and Industry", "Technology / STEM (Science, Technology, Engineering and Maths)", "Research & Innovation", "Basic Scientific Knowledge", "Rules and Regulations", "Social Responsibility - CSR", "Sales and Marketing", "Specialists in bio-based sector business/market development", "Technical expertise in sustainable biomass production", "Technical expertise in primary conversion processes", "Technical expertise in secondary conversion processes", "Technical expertise in materials, products and functionalization"))
names(data)[257] <- "q_605"

data[, 258] <- as.character(data[, 258])
attributes(data)$variable.labels[258] <- "We will also appreciate it if you could include other needs and constrains of your Bio based company that you did not find in the previous questions"
names(data)[258] <- "q_701"

data[, 259] <- as.character(data[, 259])
attributes(data)$variable.labels[259] <- "Any other aspect you would like to highlight before the end of the Survey?"
names(data)[259] <- "q_702"

data[, 260] <- as.character(data[, 260])
attributes(data)$variable.labels[260] <- "Remember that you can provide your e-mail to subscribe to the project\'s information updates on results and activities"
names(data)[260] <- "q_703"

write_csv(data,"data.csv")

# Variable name was incorrect and was changed from 01_SQ001 to q_01_SQ001 .
# Variable name was incorrect and was changed from 01_SQ002 to q_01_SQ002 .
# Variable name was incorrect and was changed from 02_SQ001 to q_02_SQ001 .
# Variable name was incorrect and was changed from 02_SQ002 to q_02_SQ002 .
# Variable name was incorrect and was changed from 101 to q_101 .
# Variable name was incorrect and was changed from 102_1 to q_102_1 .
# Variable name was incorrect and was changed from 102_2 to q_102_2 .
# Variable name was incorrect and was changed from 102_3 to q_102_3 .
# Variable name was incorrect and was changed from 103 to q_103 .
# Variable name was incorrect and was changed from 104 to q_104 .
# Variable name was incorrect and was changed from 105 to q_105 .
# Variable name was incorrect and was changed from 105_other to q_105_other .
# Variable name was incorrect and was changed from 106 to q_106 .
# Variable name was incorrect and was changed from 107 to q_107 .
# Variable name was incorrect and was changed from 108 to q_108 .
# Variable name was incorrect and was changed from 109 to q_109 .
# Variable name was incorrect and was changed from 110 to q_110 .
# Variable name was incorrect and was changed from 111 to q_111 .
# Variable name was incorrect and was changed from 111_other to q_111_other .
# Variable name was incorrect and was changed from 112 to q_112 .
# Variable name was incorrect and was changed from 201_1 to q_201_1 .
# Variable name was incorrect and was changed from 201_2 to q_201_2 .
# Variable name was incorrect and was changed from 201_3 to q_201_3 .
# Variable name was incorrect and was changed from 201_4 to q_201_4 .
# Variable name was incorrect and was changed from 201_5 to q_201_5 .
# Variable name was incorrect and was changed from 201_6 to q_201_6 .
# Variable name was incorrect and was changed from 201_7 to q_201_7 .
# Variable name was incorrect and was changed from 201_8 to q_201_8 .
# Variable name was incorrect and was changed from 202_1 to q_202_1 .
# Variable name was incorrect and was changed from 202_2 to q_202_2 .
# Variable name was incorrect and was changed from 202_3 to q_202_3 .
# Variable name was incorrect and was changed from 202_4 to q_202_4 .
# Variable name was incorrect and was changed from 202_5 to q_202_5 .
# Variable name was incorrect and was changed from 202_6 to q_202_6 .
# Variable name was incorrect and was changed from 202_7 to q_202_7 .
# Variable name was incorrect and was changed from 203_1 to q_203_1 .
# Variable name was incorrect and was changed from 203_2 to q_203_2 .
# Variable name was incorrect and was changed from 203_3 to q_203_3 .
# Variable name was incorrect and was changed from 203_4 to q_203_4 .
# Variable name was incorrect and was changed from 203_5 to q_203_5 .
# Variable name was incorrect and was changed from 203_6 to q_203_6 .
# Variable name was incorrect and was changed from 203_7 to q_203_7 .
# Variable name was incorrect and was changed from 204_1 to q_204_1 .
# Variable name was incorrect and was changed from 204_2 to q_204_2 .
# Variable name was incorrect and was changed from 204_3 to q_204_3 .
# Variable name was incorrect and was changed from 204_4 to q_204_4 .
# Variable name was incorrect and was changed from 204_5 to q_204_5 .
# Variable name was incorrect and was changed from 204_6 to q_204_6 .
# Variable name was incorrect and was changed from 204_7 to q_204_7 .
# Variable name was incorrect and was changed from 204_8 to q_204_8 .
# Variable name was incorrect and was changed from 205_1 to q_205_1 .
# Variable name was incorrect and was changed from 205_2 to q_205_2 .
# Variable name was incorrect and was changed from 205_3 to q_205_3 .
# Variable name was incorrect and was changed from 205_4 to q_205_4 .
# Variable name was incorrect and was changed from 205_5 to q_205_5 .
# Variable name was incorrect and was changed from 205_6 to q_205_6 .
# Variable name was incorrect and was changed from 206_1 to q_206_1 .
# Variable name was incorrect and was changed from 206_2 to q_206_2 .
# Variable name was incorrect and was changed from 206_3 to q_206_3 .
# Variable name was incorrect and was changed from 206_4 to q_206_4 .
# Variable name was incorrect and was changed from 206_5 to q_206_5 .
# Variable name was incorrect and was changed from 206_6 to q_206_6 .
# Variable name was incorrect and was changed from 206_7 to q_206_7 .
# Variable name was incorrect and was changed from 206_8 to q_206_8 .
# Variable name was incorrect and was changed from 207_1 to q_207_1 .
# Variable name was incorrect and was changed from 207_2 to q_207_2 .
# Variable name was incorrect and was changed from 207_3 to q_207_3 .
# Variable name was incorrect and was changed from 207_4 to q_207_4 .
# Variable name was incorrect and was changed from 207_5 to q_207_5 .
# Variable name was incorrect and was changed from 208_1 to q_208_1 .
# Variable name was incorrect and was changed from 208_2 to q_208_2 .
# Variable name was incorrect and was changed from 208_3 to q_208_3 .
# Variable name was incorrect and was changed from 208_4 to q_208_4 .
# Variable name was incorrect and was changed from 208_5 to q_208_5 .
# Variable name was incorrect and was changed from 208_6 to q_208_6 .
# Variable name was incorrect and was changed from 208_7 to q_208_7 .
# Variable name was incorrect and was changed from 208_8 to q_208_8 .
# Variable name was incorrect and was changed from 209_1 to q_209_1 .
# Variable name was incorrect and was changed from 209_2 to q_209_2 .
# Variable name was incorrect and was changed from 209_3 to q_209_3 .
# Variable name was incorrect and was changed from 209_4 to q_209_4 .
# Variable name was incorrect and was changed from 209_5 to q_209_5 .
# Variable name was incorrect and was changed from 209_6 to q_209_6 .
# Variable name was incorrect and was changed from 209_7 to q_209_7 .
# Variable name was incorrect and was changed from 209_8 to q_209_8 .
# Variable name was incorrect and was changed from 210_1 to q_210_1 .
# Variable name was incorrect and was changed from 210_2 to q_210_2 .
# Variable name was incorrect and was changed from 210_3 to q_210_3 .
# Variable name was incorrect and was changed from 210_4 to q_210_4 .
# Variable name was incorrect and was changed from 210_5 to q_210_5 .
# Variable name was incorrect and was changed from 210_6 to q_210_6 .
# Variable name was incorrect and was changed from 210_7 to q_210_7 .
# Variable name was incorrect and was changed from 210_8 to q_210_8 .
# Variable name was incorrect and was changed from 211_1 to q_211_1 .
# Variable name was incorrect and was changed from 211_2 to q_211_2 .
# Variable name was incorrect and was changed from 211_3 to q_211_3 .
# Variable name was incorrect and was changed from 211_4 to q_211_4 .
# Variable name was incorrect and was changed from 211_5 to q_211_5 .
# Variable name was incorrect and was changed from 211_6 to q_211_6 .
# Variable name was incorrect and was changed from 301_1 to q_301_1 .
# Variable name was incorrect and was changed from 301_2 to q_301_2 .
# Variable name was incorrect and was changed from 301_3 to q_301_3 .
# Variable name was incorrect and was changed from 301_4 to q_301_4 .
# Variable name was incorrect and was changed from 301_5 to q_301_5 .
# Variable name was incorrect and was changed from 302_1 to q_302_1 .
# Variable name was incorrect and was changed from 302_2 to q_302_2 .
# Variable name was incorrect and was changed from 302_3 to q_302_3 .
# Variable name was incorrect and was changed from 302_4 to q_302_4 .
# Variable name was incorrect and was changed from 302_5 to q_302_5 .
# Variable name was incorrect and was changed from 302_6 to q_302_6 .
# Variable name was incorrect and was changed from 302_7 to q_302_7 .
# Variable name was incorrect and was changed from 302_8 to q_302_8 .
# Variable name was incorrect and was changed from 303_1 to q_303_1 .
# Variable name was incorrect and was changed from 303_2 to q_303_2 .
# Variable name was incorrect and was changed from 303_3 to q_303_3 .
# Variable name was incorrect and was changed from 303_4 to q_303_4 .
# Variable name was incorrect and was changed from 303_5 to q_303_5 .
# Variable name was incorrect and was changed from 303_6 to q_303_6 .
# Variable name was incorrect and was changed from 303_7 to q_303_7 .
# Variable name was incorrect and was changed from 304_1 to q_304_1 .
# Variable name was incorrect and was changed from 304_2 to q_304_2 .
# Variable name was incorrect and was changed from 304_3 to q_304_3 .
# Variable name was incorrect and was changed from 304_4 to q_304_4 .
# Variable name was incorrect and was changed from 304_5 to q_304_5 .
# Variable name was incorrect and was changed from 304_6 to q_304_6 .
# Variable name was incorrect and was changed from 304_7 to q_304_7 .
# Variable name was incorrect and was changed from 304_8 to q_304_8 .
# Variable name was incorrect and was changed from 305_1 to q_305_1 .
# Variable name was incorrect and was changed from 305_2 to q_305_2 .
# Variable name was incorrect and was changed from 305_3 to q_305_3 .
# Variable name was incorrect and was changed from 305_4 to q_305_4 .
# Variable name was incorrect and was changed from 305_5 to q_305_5 .
# Variable name was incorrect and was changed from 305_6 to q_305_6 .
# Variable name was incorrect and was changed from 305_7 to q_305_7 .
# Variable name was incorrect and was changed from 305_8 to q_305_8 .
# Variable name was incorrect and was changed from 401_1 to q_401_1 .
# Variable name was incorrect and was changed from 401_2 to q_401_2 .
# Variable name was incorrect and was changed from 401_3 to q_401_3 .
# Variable name was incorrect and was changed from 401_4 to q_401_4 .
# Variable name was incorrect and was changed from 401_5 to q_401_5 .
# Variable name was incorrect and was changed from 401_6 to q_401_6 .
# Variable name was incorrect and was changed from 401_7 to q_401_7 .
# Variable name was incorrect and was changed from 401_8 to q_401_8 .
# Variable name was incorrect and was changed from 402_1 to q_402_1 .
# Variable name was incorrect and was changed from 402_2 to q_402_2 .
# Variable name was incorrect and was changed from 402_3 to q_402_3 .
# Variable name was incorrect and was changed from 402_4 to q_402_4 .
# Variable name was incorrect and was changed from 402_5 to q_402_5 .
# Variable name was incorrect and was changed from 402_6 to q_402_6 .
# Variable name was incorrect and was changed from 403_1 to q_403_1 .
# Variable name was incorrect and was changed from 403_2 to q_403_2 .
# Variable name was incorrect and was changed from 403_3 to q_403_3 .
# Variable name was incorrect and was changed from 403_4 to q_403_4 .
# Variable name was incorrect and was changed from 403_5 to q_403_5 .
# Variable name was incorrect and was changed from 403_6 to q_403_6 .
# Variable name was incorrect and was changed from 403_7 to q_403_7 .
# Variable name was incorrect and was changed from 404_1 to q_404_1 .
# Variable name was incorrect and was changed from 404_2 to q_404_2 .
# Variable name was incorrect and was changed from 404_3 to q_404_3 .
# Variable name was incorrect and was changed from 404_4 to q_404_4 .
# Variable name was incorrect and was changed from 404_5 to q_404_5 .
# Variable name was incorrect and was changed from 404_6 to q_404_6 .
# Variable name was incorrect and was changed from 404_7 to q_404_7 .
# Variable name was incorrect and was changed from 404_8 to q_404_8 .
# Variable name was incorrect and was changed from 405_1 to q_405_1 .
# Variable name was incorrect and was changed from 405_2 to q_405_2 .
# Variable name was incorrect and was changed from 405_3 to q_405_3 .
# Variable name was incorrect and was changed from 405_4 to q_405_4 .
# Variable name was incorrect and was changed from 405_5 to q_405_5 .
# Variable name was incorrect and was changed from 405_6 to q_405_6 .
# Variable name was incorrect and was changed from 406_1 to q_406_1 .
# Variable name was incorrect and was changed from 406_2 to q_406_2 .
# Variable name was incorrect and was changed from 406_3 to q_406_3 .
# Variable name was incorrect and was changed from 406_4 to q_406_4 .
# Variable name was incorrect and was changed from 406_5 to q_406_5 .
# Variable name was incorrect and was changed from 406_6 to q_406_6 .
# Variable name was incorrect and was changed from 406_7 to q_406_7 .
# Variable name was incorrect and was changed from 406_8 to q_406_8 .
# Variable name was incorrect and was changed from 407_1 to q_407_1 .
# Variable name was incorrect and was changed from 407_2 to q_407_2 .
# Variable name was incorrect and was changed from 407_3 to q_407_3 .
# Variable name was incorrect and was changed from 407_4 to q_407_4 .
# Variable name was incorrect and was changed from 407_5 to q_407_5 .
# Variable name was incorrect and was changed from 408_1 to q_408_1 .
# Variable name was incorrect and was changed from 408_2 to q_408_2 .
# Variable name was incorrect and was changed from 408_3 to q_408_3 .
# Variable name was incorrect and was changed from 408_4 to q_408_4 .
# Variable name was incorrect and was changed from 408_5 to q_408_5 .
# Variable name was incorrect and was changed from 408_6 to q_408_6 .
# Variable name was incorrect and was changed from 408_7 to q_408_7 .
# Variable name was incorrect and was changed from 408_8 to q_408_8 .
# Variable name was incorrect and was changed from 409_1 to q_409_1 .
# Variable name was incorrect and was changed from 409_2 to q_409_2 .
# Variable name was incorrect and was changed from 409_3 to q_409_3 .
# Variable name was incorrect and was changed from 409_4 to q_409_4 .
# Variable name was incorrect and was changed from 409_5 to q_409_5 .
# Variable name was incorrect and was changed from 409_6 to q_409_6 .
# Variable name was incorrect and was changed from 409_7 to q_409_7 .
# Variable name was incorrect and was changed from 409_8 to q_409_8 .
# Variable name was incorrect and was changed from 410_1 to q_410_1 .
# Variable name was incorrect and was changed from 410_2 to q_410_2 .
# Variable name was incorrect and was changed from 410_3 to q_410_3 .
# Variable name was incorrect and was changed from 410_4 to q_410_4 .
# Variable name was incorrect and was changed from 410_5 to q_410_5 .
# Variable name was incorrect and was changed from 410_6 to q_410_6 .
# Variable name was incorrect and was changed from 410_7 to q_410_7 .
# Variable name was incorrect and was changed from 410_8 to q_410_8 .
# Variable name was incorrect and was changed from 411_1 to q_411_1 .
# Variable name was incorrect and was changed from 411_2 to q_411_2 .
# Variable name was incorrect and was changed from 411_3 to q_411_3 .
# Variable name was incorrect and was changed from 411_4 to q_411_4 .
# Variable name was incorrect and was changed from 411_5 to q_411_5 .
# Variable name was incorrect and was changed from 411_6 to q_411_6 .
# Variable name was incorrect and was changed from 501_1 to q_501_1 .
# Variable name was incorrect and was changed from 501_2 to q_501_2 .
# Variable name was incorrect and was changed from 501_3 to q_501_3 .
# Variable name was incorrect and was changed from 501_4 to q_501_4 .
# Variable name was incorrect and was changed from 501_5 to q_501_5 .
# Variable name was incorrect and was changed from 502_1 to q_502_1 .
# Variable name was incorrect and was changed from 502_2 to q_502_2 .
# Variable name was incorrect and was changed from 502_3 to q_502_3 .
# Variable name was incorrect and was changed from 502_4 to q_502_4 .
# Variable name was incorrect and was changed from 502_5 to q_502_5 .
# Variable name was incorrect and was changed from 502_6 to q_502_6 .
# Variable name was incorrect and was changed from 502_7 to q_502_7 .
# Variable name was incorrect and was changed from 502_8 to q_502_8 .
# Variable name was incorrect and was changed from 503_1 to q_503_1 .
# Variable name was incorrect and was changed from 503_2 to q_503_2 .
# Variable name was incorrect and was changed from 503_3 to q_503_3 .
# Variable name was incorrect and was changed from 503_4 to q_503_4 .
# Variable name was incorrect and was changed from 503_5 to q_503_5 .
# Variable name was incorrect and was changed from 503_6 to q_503_6 .
# Variable name was incorrect and was changed from 503_7 to q_503_7 .
# Variable name was incorrect and was changed from 504_1 to q_504_1 .
# Variable name was incorrect and was changed from 504_2 to q_504_2 .
# Variable name was incorrect and was changed from 504_3 to q_504_3 .
# Variable name was incorrect and was changed from 504_4 to q_504_4 .
# Variable name was incorrect and was changed from 504_5 to q_504_5 .
# Variable name was incorrect and was changed from 504_6 to q_504_6 .
# Variable name was incorrect and was changed from 504_7 to q_504_7 .
# Variable name was incorrect and was changed from 504_8 to q_504_8 .
# Variable name was incorrect and was changed from 505_1 to q_505_1 .
# Variable name was incorrect and was changed from 505_2 to q_505_2 .
# Variable name was incorrect and was changed from 505_3 to q_505_3 .
# Variable name was incorrect and was changed from 505_4 to q_505_4 .
# Variable name was incorrect and was changed from 505_5 to q_505_5 .
# Variable name was incorrect and was changed from 505_6 to q_505_6 .
# Variable name was incorrect and was changed from 505_7 to q_505_7 .
# Variable name was incorrect and was changed from 505_8 to q_505_8 .
# Variable name was incorrect and was changed from 601 to q_601 .
# Variable name was incorrect and was changed from 602 to q_602 .
# Variable name was incorrect and was changed from 603 to q_603 .
# Variable name was incorrect and was changed from 604 to q_604 .
# Variable name was incorrect and was changed from 605 to q_605 .
# Variable name was incorrect and was changed from 701 to q_701 .
# Variable name was incorrect and was changed from 702 to q_702 .
# Variable name was incorrect and was changed from 703 to q_703 .
