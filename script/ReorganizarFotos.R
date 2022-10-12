
# Propósito del programa --------------------------------------------------
# A partir de una carpeta donde tenemos fotografías descargadas cuyos nombres 
# son del formato:
#                    AAAAMMDD_nombre.ext
# Las copiamos a un árbol de directorios dentro de la carpeta Imágenes ( o la
# que se desee) con el esquema AAAA / MM / DD 


rm(list = ls(all.names = TRUE))
ENTORNO <- Sys.getenv("ENTORNO")

if (ENTORNO != "Linux") {
  separador <- "\\"
} else {
  separador <- "/"
}

DirectorioFotos <- 
  "~/Imágenes/"
#  "C:\\Users\\usuario\\Imágenes\\Móvil\\"

DirectorioCarga <- 
  "~/Descargas/NuevaCarga/"
#  "C:\\Users\\usuario\\Descargas\\NuevaCarga"


listaFicheros <- 
  list.files(DirectorioCarga)

for (fichero in listaFicheros ) {
  
  AñoFoto <- substr(fichero, 1, 4)
  MesFoto <- substr(fichero, 5, 6) 
  DiaFoto <- substr(fichero, 7, 8)
  
  DirectorioAño <- paste0(DirectorioFotos, 
                          AñoFoto)
  
  if (!dir.exists(DirectorioAño)) {
    dir.create(DirectorioAño)
  }
  
  DirectorioMes <- paste0(DirectorioFotos, 
                          AñoFoto, separador, 
                          MesFoto ) 
  
  if (!dir.exists(DirectorioMes)) {
    dir.create(DirectorioMes)
  }
  
  DirectorioDia <- paste0(DirectorioFotos, 
                          AñoFoto, separador, 
                          MesFoto, separador, 
                          DiaFoto ) 
  
  if (!dir.exists(DirectorioDia)) {
    dir.create(DirectorioDia)
  }
  
  file.copy(
    paste0(DirectorioCarga, separador, 
           fichero), 
    paste0(DirectorioDia, separador, 
           fichero),
    overwrite = FALSE
    )

}

