
rm(list = ls(all.names = TRUE))

DirectorioFotos <- 
  "C:\\Users\\jgarribas\\OneDrive - AIREF\\Imágenes\\Móvil\\"

DirectorioCarga <- 
  "C:\\Users\\jgarribas\\OneDrive - AIREF\\Imágenes\\Móvil\\NuevaCarga"

listaFicheros <- 
  list.files(DirectorioCarga)

for (fichero in listaFicheros ) {
  
  AñoFoto <- substr(fichero, 1, 4)
  MesFoto <- substr(fichero, 5, 6) 
  DiaFoto <- substr(fichero, 7, 8)
  
  DirectorioAño <- paste0(DirectorioFotos, AñoFoto)
  if (!dir.exists(DirectorioAño)) {
    dir.create(DirectorioAño)
  }
  
  DirectorioMes <- paste0(DirectorioFotos, AñoFoto, "\\", MesFoto ) 
  if (!dir.exists(DirectorioMes)) {
    dir.create(DirectorioMes)
  }
  
  DirectorioDia <- paste0(DirectorioFotos, AñoFoto, "\\", MesFoto, "\\", DiaFoto ) 
  if (!dir.exists(DirectorioDia)) {
    dir.create(DirectorioDia)
  }
  
  file.copy(
    paste0(DirectorioCarga, "\\", fichero), 
    paste0(DirectorioDia, "\\", fichero),
    overwrite = FALSE
    )

}

