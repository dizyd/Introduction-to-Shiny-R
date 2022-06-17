
# Introduction to Shiny R


This repository contains the materials for the workshop **Introduction to Shiny in R** at the SMiP graduate school in Mannheim, Germany. 

The following code can be used to install the packages used in this workshop:

```r
wanted.packages <- c("tidyverse","ggplot2","devtools","shiny","plotly","kableExtra",
"DT","parameters","rsconnect","shinythemes","thematic","shinyWidgets","shinydashboard")
  
# Check what packages need to be installed
new.packages <- wanted.packages[!(wanted.packages %in% installed.packages()[,"Package"])]
  
 # install the not yet installed but required packages and load them
if(length(new.packages)) install.packages(new.packages,dependencies = TRUE)
sapply(wanted.packages, require, character.only = TRUE)
```


**Note:** The workshop is based on R Version 4.2.0 



