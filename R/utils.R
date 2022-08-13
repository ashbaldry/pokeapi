#' @noRd
clean_category <- function(category) {
  category_clean <- tolower(sub(" ", "-", category))
  if (grepl("our$", category_clean)) {
    category_clean <- sub("our$", "or", category_clean)
  }
  category_clean
}
