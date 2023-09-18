LAC_env <- new.env()

setGlobal <- function(name, value) {
  assign(name, value, envir = LAC_env)
}

getGlobal <- function(name) {
  get(name, envir = LAC_env)
}

setup_lac <- function(custom = FALSE, location = NULL) {

  reticulate::virtualenv_create(envname = "python3_env")

  reticulate::virtualenv_install("python3_env", packages = c("lac"))

  reticulate::use_virtualenv("python3_env", required = T)

  LAC <- reticulate::import("LAC")

  if (custom == FALSE & !is.null(location)) {
    stop("location is ignored unless custom is TRUE")
  } else {
    if (custom == TRUE) {
      lac_seg <- LAC$LAC(mode = "seg")

      lac_seg$load_customization(location)

      lac_analysis <- LAC$LAC(mode = "lac")

      lac_analysis$load_customization(location)

      setGlobal("lac_seg", lac_seg)

      setGlobal("lac_analysis", lac_analysis)
    } else {
      lac_seg <- LAC$LAC(mode = "seg")

      lac_analysis <- LAC$LAC(mode = "lac")

      setGlobal("lac_seg", lac_seg)

      setGlobal("lac_analysis", lac_analysis)
    }
  }
}


