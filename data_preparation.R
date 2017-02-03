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


# subject <- bind_rows(
#   read_excel(
#     "data/БД 38.03.06 ТД Коммерция.xls",
#     sheet = 3,
#     col_names = c("id", "name", "kathedra_id")
#   ) %>%
#     mutate(profile = "Коммерция"),
#   read_excel(
#     "data/БД 38.03.06 ТД Логистика.xls",
#     sheet = 3,
#     col_names = c("id", "name", "kathedra_id")
#   ) %>%
#     mutate(profile = "Логистика")
# ) %>%
#   bind_rows(
#     read_excel(
#       "data/БД 38.03.06 ТД Маркетинг.xls",
#       sheet = 3,
#       col_names = c("id", "name", "kathedra_id")
#     ) %>%
#       mutate(profile = "Маркетинг")
#   ) %>% 
#   select(- kathedra_id)

# subject %>%
#   select(id) %>% arrange(id) %>% distinct() %>%
#   separate(id, c("x1", "x2", "x3", "x4", "x5"), remove = FALSE) %>%
#   write_excel_csv("data/subject_id.csv")

# subject_id <- read_csv("data/subject_id.csv")

# subject_id %>%
#   unite(nid, - id, sep = ".", remove = FALSE) %>%
#   mutate(nid = str_replace_all(nid, "\\.0", "")) %>%
#   View()
# 
# left_join(subject, subject_id, by = "id") %>% 
#   spread(profile, profile) %>% 
#   arrange(block, part, variant, position, subpos) %>% 
#   unite(code, block, part, variant, position, subpos, sep = ".", remove = FALSE) %>% 
#   mutate(code = str_replace_all(code, "\\.0", "")) %>% 
#   rename(is_com = Коммерция, is_log = Логистика, is_mar = Маркетинг) %>% 
#   write_csv("data/subject_tmp.csv")

# read_csv("data/subject_tmp.csv") %>% 
#   gather(variable, profile, is_com, is_log, is_mar) %>% 
#   filter(! is.na(profile)) %>% 
#   select(- variable) %>% 
#   rename(code = id) %>% 
#   write_csv("data/DB_subject.csv")

subject <- read_csv("data/DB_subject.csv")

# edges competence-subject ------------------------------------------------


# edges <- bind_rows(
#   read_excel(
#     "data/БД 38.03.06 ТД Коммерция.xls",
#     sheet = 2,
#     col_names = c("id", "code", "name")
#   ) %>%
#     mutate(profile = "Коммерция"),
#   read_excel(
#     "data/БД 38.03.06 ТД Логистика.xls",
#     sheet = 2,
#     col_names = c("id", "code", "name")
#   ) %>%
#     mutate(profile = "Логистика")
# ) %>%
#   bind_rows(
#     read_excel(
#       "data/БД 38.03.06 ТД Маркетинг.xls",
#       sheet = 2,
#       col_names = c("id", "code", "name")
#     ) %>%
#       mutate(profile = "Маркетинг")
#   )
# 
# edges %>% 
#   select(- name) %>% 
#   right_join(subject, by = c("code", "profile")) %>% 
#   select(id, code, profile) %>% 
#   write_csv("data/DB_edges_competence-subject.csv")

edges <- read_csv("data/DB_edges_competence-subject.csv")
