#' @noRd
clean_category <- function(category) {
  tolower(sub(" ", "-", category))
}
