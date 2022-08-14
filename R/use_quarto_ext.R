#' Install bundled Quarto extensions into current working directory
#'
#' @param ext_name String indicating which extension to install
#'
#' @return a message if extension was successfully copied over
#' @export
use_quarto_ext <- function(ext_name = "grouped-tabsets"){

  # check for available extensions
  stopifnot("Extension not in package" = ext_name %in% c("grouped-tabsets", "code-filename"))

  # check for existing _extensions directory
  if(!file.exists("_extensions")) dir.create("_extensions")
  message("Created '_extensions' folder")

  # various reading of key-value pairs for reporting
  ext_yml <- readLines("inst/extdata/_extensions/code-filename/_extension.yml")

  ext_ver <- gsub(
    x = ext_yml[grepl(x = ext_yml, pattern = "version:")],
    pattern = "version: ",
    replacement = ""
  )

  ext_nm <- gsub(
    x = ext_yml[grepl(x = ext_yml, pattern = "title:")],
    pattern = "title: ",
    replacement = ""
  )

  # Create folder for recursive copying into ahead of time
  if(!file.exists(paste0("_extensions/", ext_name))) dir.create(paste0("_extensions/", ext_name))

  # copy from internals
  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name), package = "octavo"),
    to = paste0("_extensions/"),
    overwrite = TRUE,
    recursive = TRUE,
    copy.mode = TRUE
  )

  # logic check to make sure extension files were moved
  n_files <- length(dir(paste0("_extensions/", ext_name)))

  if(n_files >= 2){
    message(paste(ext_nm, "v", ext_ver, "was installed to _extensions folder in current working directory."))
  } else {
    message("Extension appears to not have been created")
  }

}

#' List bundled Quarto extensions
#'
#' @return a string of available extensions for install
#' @export
available_extensions <- function(){
  list.files(system.file("extdata/_extensions", package = "octavo"))
}
