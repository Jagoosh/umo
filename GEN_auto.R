library(tidyverse)
library(rmarkdown)

for(
  id in read_csv("data/DB_competence.csv") %>% 
  select(id) %>% 
  unlist(use.names = FALSE)
) {
  render(
    "GEN_passport.Rmd",
    output_file = paste0(id, ".odt"),
    params = list(idx = id)
  )
}
