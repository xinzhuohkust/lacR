\name{tokenizer}
\alias{tokenizer}
\title{
A Chinese tokenizer based on Baidu LAC (Lexical Analysis of Chinese).
}
\description{
A Chinese tokenizer based on LAC, supporting Chinese word segmentation, multiple part-of-speech tagging, vetorization, and equipped with a progress bar functionality.
}
\usage{
tokenizer(string, analysis = FALSE, progress = TRUE, min = 0)
}
\arguments{
\item{string}{A character vector awaits segmentation.}
\item{progress}{A logical value to specify whether to display a progress bar, default is TRUE.}
\item{min}{A numeric value to set a minimum length for words to be retained, default is 0.}
\item{analysis}{A logical value to specify whether to perform part-of-speech tagging, default is FALSE.

Part-of-Speech and Named Entity Categories:
\describe{
  \item{n}{General noun}
  \item{f}{Directional noun}
  \item{s}{Place noun}
  \item{nw}{Title of a work}
  \item{nz}{Other proper noun}
  \item{v}{General verb}
  \item{vd}{Verb as adverb}
  \item{vn}{Noun-verb}
  \item{a}{Adjective}
  \item{ad}{Adverb as adjective}
  \item{an}{Noun-adjective}
  \item{d}{Adverb}
  \item{m}{Numeral}
  \item{q}{Quantifier}
  \item{r}{Pronoun}
  \item{p}{Preposition}
  \item{c}{Conjunction}
  \item{u}{Auxiliary word}
  \item{xc}{Other function word}
  \item{w}{Punctuation mark}
  \item{PER}{Person name}
  \item{LOC}{Place name}
  \item{ORG}{Organization name}
  \item{TIME}{Time expression}
}
}
\details{
  For more information on LAC, please visit the \link{https://github.com/baidu/lac}.
}

