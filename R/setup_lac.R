LAC_env <- new.env()

setGlobal <- function(name, value) {
  assign(name, value, envir = LAC_env)
}

getGlobal <- function(name) {
  get(name, envir = LAC_env)
}

use_conda <- purrr::safely(reticulate::use_condaenv)

use_vir <- purrr::safely(reticulate::use_virtualenv)

answer <- readline(prompt = "Is this your first time using this? If yes, a virtual environment will be created: (yes/no): ")

if (tolower(answer) == "yes") {
  print("Welcome! Let's get started.")

  setup_lac <- function(custom = FALSE, location = NULL, conda = NULL) {
    system("cmd.exe /c where python", intern = TRUE) |>
      purrr::map_chr(~ paste("Found the following Python installations:", ., "\n")) |>
      message()

    if (is.null(python)) {
      reticulate::conda_create("condaenv_for_python2r", python_version = "3.11")

      reticulate::conda_install("condaenv_for_python2r", packages = c("lac"), pip = TRUE)

      reticulate::use_condaenv("condaenv_for_python2r", required = TRUE)

      LAC <- reticulate::import("LAC")
    } else {
      reticulate::virtualenv_create("virenv_for_python2r", python = python)

      reticulate::virtualenv_install("virenv_for_python2r", packages = c("lac"))

      reticulate::use_virtualenv("virenv_for_python2r", required = TRUE)

      LAC <- reticulate::import(module = "LAC")
    }

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
} else if (tolower(answer) == "no") {
  message("Great! Let's continue.")

  setup_lac <- function(custom = FALSE, location = NULL, conda = TRUE) {
    if (conda == TRUE) {
      if (is.null(use_conda("condaenv_for_python2r", required = TRUE)$error)) {
        message("Using the conda virtual environment `condaenv_for_python2r`")
        LAC <- reticulate::import(module = "LAC")
      }
    } else {
      if (is.null(use_vir("virenv_for_python2r", required = TRUE)$error)) {
        message("Using the virtual environment `virenv_for_python2r`.")
        LAC <- reticulate::import(module = "LAC")
      }
    }

    if (custom == FALSE & !is.null(location)) {
      stop("location is ignored unless custom is TRUE.")
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
} else {
  print("Sorry, I did not understand your input. Please answer with 'yes' or 'no'.")
}


