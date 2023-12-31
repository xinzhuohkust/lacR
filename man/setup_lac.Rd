\name{setup_lac}
\alias{setup_lac}
\title{
To set up a virtual environment and import \emph{lac (python version)} into R.
}
\description{
This function can automatically set up a virtual environment, download the lac module, and allow you to specify whether a custom dictionary is needed.

If you do not specify the location of Python, a conda virtual environment wil be created by default, based on Python version \emph{3.1.1}. You, can, however, specify the location of Python in your machine, and a virtual environment will be created based on that specific Python. Please be aware that the performance and compatibility of your virtual environment might be affected by the Python version you choose.
}
\usage{
setup_lac(custom = FLASE, location = "custom.txt")
}
\arguments{
\item{custom}{A logical value to specify whether a custom dictionary is needed, default is FALSE.}
\item{location}{A character value to specify where is the custom dictionary, default is NULL. If use custom dictionary, please separate each word in the custom dictionary with a space or \t.}
\item{python}{A character value to specify where is your Python, default is NULL.}

