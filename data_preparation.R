library(tidyverse)
library(readxl)
library(stringr)

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

# subject -----------------------------------------------------------------


subject <- bind_rows(
  read_excel(
    "data/БД 38.03.06 ТД Коммерция.xls",
    sheet = 3,
    col_names = c("id", "name", "kathedra_id")
  ) %>%
    mutate(profile = "Коммерция"),
  read_excel(
    "data/БД 38.03.06 ТД Логистика.xls",
    sheet = 3,
    col_names = c("id", "name", "kathedra_id")
  ) %>%
    mutate(profile = "Логистика")
) %>%
  bind_rows(
read_excel(
  "data/БД 38.03.06 ТД Маркетинг.xls",
  sheet = 3,
  col_names = c("id", "name", "kathedra_id")
) %>%
  mutate(profile = "Маркетинг")
)

# subject %>%
#   select(id) %>% arrange(id) %>% distinct() %>%
#   separate(id, c("x1", "x2", "x3", "x4", "x5"), remove = FALSE) %>%
#   write_excel_csv("data/subject_id.csv")

subject_id <- read_csv("data/subject_id.csv")

subject_id %>%
  unite(nid, - id, sep = ".", remove = FALSE) %>%
  mutate(nid = str_replace_all(nid, "\\.NA", "")) %>%
  View()
