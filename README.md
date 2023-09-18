# lacR #
A Chinese tokenizer based on Baidu LAC (Lexical Analysis of Chinese).
<img align='left' src="lacR.png" width="188">
Not supported in RStudio, please use VS Code to run R.
Author: *Xinzhuo Huang*

Version: 0.1.0

<br>
<br>
<br>
<br>
<br>

## Install this package

```
remotes::install_github("xinzhuohkust/lacR")
```
## Usage
### setup
```
setup_lac(custom = FALSE, location = NULL) # not use custom dictionary
```
### text segmentation
```
tokenizer(
  string = "政治学是一门研究权力的的社会科学",
  analysis = FALSE, # not to perform part-of-speech tagging
  progress = TRUE, # display progress bar
  min = 1 # keep only words with a length greater than 1
)
```
## Rcpp version (coming soon)



