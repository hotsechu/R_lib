getPathLib <- function () {
    
    # Recuperamos el directorio de trabajo
    workDir <- getwd()
    
    # Localizamos las posiciones que separan los componentes de la ruta
    posSlash <- stringr::str_locate_all(workDir, "/")
    
    # Extraemos de la ruta la parte común a todos los proyectos 
    pathLib <-
        stringr::str_sub(workDir, 1, posSlash[[1]][length(posSlash[[1]]) / 2])

    return(pathLib)
}