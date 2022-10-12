# install.packages("tidyverse")
library(tidyverse)

datos <- starwars

GeneroNoBinarios <- starwars %>%
  filter(
    (sex == "male" & gender != "masculine") |
         (sex == "female" & gender != "feminine") |
         !sex %in% c('male','female') )

datosCambiados <- starwars %>%
  select(1,8,9,10, 
         where(is.numeric)) %>%
  replace_na(
    list(
      name = "none",
      height = 0,
      mass = 0,
      sex = "none",
      gender = "none",
      homeworld = "none",
      birth_year = 0
    )
  )


#  remove_missing()                       # Elimina filas con algún dato a NA
#  select(where(is.numeric)) %>%          # Selecciona solo datos numéricos
#  distinct(homeworld, .keep_all = TRUE)  # Deja la primera observación de cada valor
