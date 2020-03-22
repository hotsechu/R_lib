# Obtener el nombre del script en ejecución
getScriptName <- function() {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  needle <- "--file="
  match <- grep(needle, cmdArgs)
  if (length(match) > 0) {
    # RScript
    return(normalizePath(sub(needle, "", cmdArgs[match])))
  } else {
    neddle <- "RStudio"
    match <- grep(neddle, cmdArgs)
    if (length(match) > 0) {
      # RStudio
      return(rstudioapi::getActiveDocumentContext()$path)
    } else {
      # 'source'd via R Console
      return(normalizePath(sys.frames()[[1]]$ofile))
    }
  }
}