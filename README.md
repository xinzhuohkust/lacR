# lacR #
A Chinese tokenizer based on Baidu LAC (Lexical Analysis of Chinese).
<img align='left' src="lacR.png" width="188">        
                                    
Author: *Xinzhuo Huang*

Version: 0.1.0

Compared to other Chinese word segmentation schemes, LAC performs rather 
well in entity information extraction, particularly for personal names and 
place names. Unfortunately, due to issues with RStudio, this package 
cannot run within the RStudio environment, please use VS code to run R.

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



