\name{setup_lac}
\alias{setup_lac}
\title{
To set up a virtual environment and import lac (python version) into R.
}
\description{
This function can automatically set up a virtual environment, download the lac module, and allow you to specify whether a custom dictionary is needed.
}
\usage{
setup_lac(custom = FLASE, location = "custom.txt")
}
\arguments{
\item{custom}{A logical value to specify whether a custom dictionary is needed, default is FALSE.}
\item{location}{A character value to specify where is the custom dictionary, default is NULL. If use custom dictionary, please separate each word in the custom dictionary with a space or \t.}
