#' Get the location of the main environment folders and files of the project
#'
#' Print the current home folders for R, user and script.
#' Print if a .Renviron or .Rprofile exists in that folders
#'
#' @param
#'
#' @return None
#'
#' @examples
#'
#' wai()
#'
#' @export
getEnvFiles <- function() {
  folders <-
    data.frame(
      name = c("R home", "User home", "Working directory"),
      path = c(R.home(), path.expand("~"), getwd()),
      stringsAsFactors = FALSE
    )
  
  message(paste(folders$name, " : ", folders$path, "\n"))
  
  for (x in folders$path) {
    filePath <- file.path(x, ".Rprofile")
    if (file.exists(filePath))
      message(paste("--->", filePath, " exists \n"))
  }
  
  for (x in folders$path) {
    filePath <- file.path(x, ".Renviron")
    if (file.exists(filePath))
      message(paste("--->", filePath, " exists \n"))
  }
}