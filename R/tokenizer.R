tokenizer <- function(string, analysis = FALSE, progress = TRUE, min = 0) {
  if (progress == TRUE) {
    bar <- list(
      format = "Processing: {cli::pb_current}  {cli::pb_bar} {cli::pb_percent}  Rate: {cli::pb_rate}  ETA: {cli::pb_eta}"
    )
  }

  if (analysis == FALSE) {
    purrr::map(
      string,
      \(x) {
        if (!is.na(nchar(x))) {
          if (nchar(x) > 1) {
            tokens <- getGlobal("lac_seg")$run(x)
            tokens <- tokens[nchar(tokens) > min]
            return(tokens)
          }
        }
      },
      .progress = bar
    )
  } else {
    purrr::map(
      string,
      \(x) {
        if (!is.na(nchar(x))) {
          if (nchar(x) > 1) {
            tokens <- getGlobal("lac_analysis")$run(x)
            names(tokens[[1]]) <- tokens[[2]]
            tokens[[1]] <- tokens[[1]][nchar(tokens[[1]]) > min]
            return(tokens[[1]])
          }
        }
      },
      .progress = bar
    )
  }
}

