library(tidyverse)
library(readxl)

# competence --------------------------------------------------------------


# competence_com <- read_excel(
#   "data/БД 38.03.06 ТД Коммерция.xls",
#   sheet = 1,
#   col_names = c("id", "content")
# ) %>%
#   mutate(profile = "Коммерция")
# 
# competence_log <- read_excel(
#   "data/БД 38.03.06 ТД Логистика.xls",
#   sheet = 1,
#   col_names = c("id", "content")
# ) %>%
#   mutate(profile = "Логистика")
# 
# competence_mar <- read_excel(
#   "data/БД 38.03.06 ТД Маркетинг.xls",
#   sheet = 1,
#   col_names = c("id", "content")
# ) %>%
#   mutate(profile = "Маркетинг")
# 
# competence <- bind_rows(competence_com, competence_log) %>%
#   bind_rows(competence_mar)
# 
# competence <- competence %>%
#   select(id, content) %>%
#   distinct() %>%
#   mutate(specialty = "38.03.06 Торговое дело")
# 
# write_excel_csv(competence, "data/DB_competence.csv")
# 
# rm(list = ls(pattern = "^competence"))

competence <- read_csv("data/DB_competence.csv")
